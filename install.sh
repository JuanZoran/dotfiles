#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# install.sh - 模块化 Dotfiles 安装脚本
# -----------------------------------------------------------------------------
#
# 此脚本用于自动在新系统上：
# 1. 请求 Sudo 权限
# 2. 检测发行版 (Ubuntu/Arch)
# 3. 安装定义的软件包
# 4. 使用 stow 链接配置文件
#
# -----------------------------------------------------------------------------

# --- 安全设置 (健壮性) ---
# -e: 如果一个命令失败，脚本立即退出
# -o pipefail: 管道中的任何命令失败，都视为整个管道失败
# -u: 试图使用未定义的变量时，视为错误
set -eou pipefail

# --- 脚本目录 ---
# 获取此脚本所在的目录, 假设 dotfiles 仓库根目录
# 我们需要它来运行 stow
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# -----------------------------------------------------------------------------
# [配置] - 在这里维护你的包列表
# -----------------------------------------------------------------------------

# --- Stow 目标 ---
STOW_TARGETS=(
    zsh
    nvim
    ghostty 
)


# --- Pacman 软件包 (Arch Linux) ---
PKGS=(
    stow
    zsh
    neovim
    git
    base-devel # 编译工具
    ripgrep
    curl
    # ... 在此添加更多
)

# -----------------------------------------------------------------------------
# [日志] - 辅助函数
# -----------------------------------------------------------------------------

# --- 颜色常量 ---
BOLD="\033[1m"
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# --- 日志函数 ---
msg_info() {
    echo -e "${BOLD}[ INFO ]${RESET} $1"
}
msg_ok() {
    echo -e "${GREEN}[ OK ]${RESET} $1"
}
msg_err() {
    # 打印错误消息并退出
    echo -e "${RED}[ ERROR ]${RESET} $1" >&2
    exit 1
}
msg_warn() {
    echo -e "${YELLOW}[ WARN ]${RESET} $1"
}

# -----------------------------------------------------------------------------
# [核心逻辑] - 模块化函数
# -----------------------------------------------------------------------------

# --- 模块 1: 权限检查 ---
fn_get_sudo() {
    msg_info "请求管理员权限 (Sudo)..."
    if sudo -v; then
        # 保持 Sudo 活跃: 在后台每 60 秒更新一次 sudo 凭证
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
        msg_ok "Sudo 权限已获取。"
    else
        msg_err "无法获取 Sudo 权限。退出。"
    fi
}

# --- 模块 2: 软件包安装 ---

# 2a. Apt (Debian/Ubuntu)
fn_install_apt() {
    msg_info "更新 Apt 仓库..."
    sudo apt update
    msg_info "正在安装 ${#PKGS[@]} 个软件包 (Apt)..."
    sudo apt install -y "${PKGS[@]}"
    msg_ok "Apt 软件包安装完毕。"
}

# 2b. Pacman (Arch Linux)
fn_install_pacman() {
    msg_info "正在安装 ${#PKGS[@]} 个软件包 (Pacman)..."
    # --noconfirm: 自动确认
    # --needed: 仅安装确实缺失的包 (避免重新安装)
    sudo pacman -S --noconfirm --needed "${PKGS[@]}"
    msg_ok "Pacman 软件包安装完毕。"
}

# 2c. 操作系统检测与分发
fn_install_packages() {
    msg_info "开始安装系统软件包..."
    
    if [ -f /etc/arch-release ]; then
        msg_info "检测到 Arch Linux。"
        fn_install_pacman
    elif [ -f /etc/debian_version ]; then
        msg_info "检测到 Debian / Ubuntu。"
        fn_install_apt
    elif command -v dnf &>/dev/null; then
        msg_warn "检测到 Fedora (DNF)。尚未实现自动安装。"
        # TODO: 在此添加 Fedora (DNF) 的安装逻辑
    elif command -v brew &>/dev/null; then
        msg_warn "检测到 macOS (Homebrew)。尚未实现自动安装。"
        # TODO: 在此添加 Homebrew 的安装逻辑
    else
        msg_err "不支持的操作系统。请手动安装软件包。"
    fi
}

fn_install_lazygit() {
    msg_info "安装最新的 LazyGit..."

    if ! command -v curl &>/dev/null; then
        msg_warn "curl 未安装，跳过 LazyGit 下载。"
        return
    fi

    local os
    os=$(uname -s)
    local platform

    if [ "$os" = "Darwin" ]; then
        platform="darwin_amd64"
    elif [ "$os" = "Linux" ]; then
        case "$(uname -m)" in
            x86_64) platform="linux_amd64" ;;
            aarch64|arm64) platform="linux_arm64" ;;
            *)
                msg_warn "不支持的 LazyGit 架构: $(uname -m)"
                return
                ;;
        esac
    else
        msg_warn "不支持的 LazyGit 平台: $os"
        return
    fi

    local release_json
    if ! release_json=$(curl -sSf "https://api.github.com/repos/jesseduffield/lazygit/releases/latest"); then
        msg_warn "无法获取 LazyGit 发布信息。"
        return
    fi
    local download_url
    download_url=$(printf "%s" "$release_json" | awk -F\" -v plat="$platform" '/browser_download_url/ { if (index($4, plat)) { print $4; exit } }')

    if [ -z "$download_url" ]; then
        msg_warn "无法获取 LazyGit 的下载链接。"
        return
    fi

    local tmp_dir
    tmp_dir=$(mktemp -d)
    trap 'rm -rf "$tmp_dir"' RETURN

    local archive="$tmp_dir/lazygit.tar.gz"
    if ! curl -sSfL "$download_url" -o "$archive"; then
        msg_warn "下载 LazyGit 归档失败。"
        return
    fi

    if ! tar -xzf "$archive" -C "$tmp_dir"; then
        msg_warn "解压 LazyGit 归档失败。"
        return
    fi

    local binary="$tmp_dir/lazygit"
    if [ ! -f "$binary" ]; then
        msg_warn "LazyGit 包未包含二进制文件。"
        return
    fi

    local install_dir="$HOME/.local/bin"
    mkdir -p "$install_dir"
    mv "$binary" "$install_dir/lazygit"
    chmod +x "$install_dir/lazygit"

    msg_ok "LazyGit 已安装到 $install_dir/lazygit"
}

# --- 模块 3: Stow 链接 ---
fn_link_dotfiles() {
    msg_info "使用 Stow 链接配置文件..."
    
    # 确保我们在 dotfiles 目录下
    cd "$DOTFILES_DIR" || msg_err "无法进入 $DOTFILES_DIR"
    
    # 检查 stow 是否已安装
    if ! command -v stow &>/dev/null; then
        msg_err "'stow' 命令未找到。请先安装它。"
    fi

    for target in "${STOW_TARGETS[@]}"; do
        if [ -d "$target" ]; then
            msg_info "  -> 正在链接 ${target}..."
            # -t ~: 指定目标目录为主目录
            # -R: 强制重新链接 (如果已有链接)
            stow -R -t ~ "$target"
        else
            msg_warn "  -> 找不到目录 $target, 跳过。"
        fi
    done
    
    msg_ok "Dotfiles 链接完毕。"
}

# -----------------------------------------------------------------------------
# [主函数] - 脚本执行入口
# -----------------------------------------------------------------------------
main() {
    msg_info "---------- Dotfiles 安装程序启动 ----------"
    
    fn_get_sudo
    fn_install_packages
    fn_install_lazygit
    fn_link_dotfiles
    
    msg_ok "---------- 安装成功! ----------"
    msg_info "请考虑重启 Shell (或运行 'exec zsh') 来加载新配置。"
}

# --- 执行 main 函数 ---
main
