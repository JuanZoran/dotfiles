#!/usr/bin/env python3
import os


def excuteable(cmd):
    return os.system(f"which {cmd} > /dev/null") == 0


# 确保apt 存在
if not excuteable("apt"):
    print("apt not found")
    exit(1)

import rich  # for pretty print
from rich import print
from rich.progress import track


# utility
# write wrapper function for red, green, yellow, purple, sky_blue ... etc
def red(text):
    print(f"[red]{text}[/red]")


def green(text):
    print(f"[green]{text}[/green]")


def yellow(text):
    print(f"[yellow]{text}[/yellow]")


def purple(text):
    print(f"[purple]{text}[/purple]")


def blue(text):
    print(f"[sky_blue]{text}[/sky_blue]")


import apt

cache = apt.Cache()


def apt_install(package):
    try:
        pkg = cache[package]
        if pkg.is_installed:
            green(f"{package} is installed")
        else:
            pkg.mark_install()
            green(f"{package} install success")

    except:
        red(f"{package} install failed")


def ensure_install():
    # 必装的软件包
    ensure_packages = [
        "git",
        "net-tools",
        "curl",
        "wget",
    ]

    for i in track(ensure_packages):
        if excuteable(i):
            green(f"{i} is installed")
        else:
            apt_install(i)


def option_install(*args: str):
    if args != None:
        option_packages = args

    else:
        option_packages = [
            "cargo",
            "exa",
            "zsh",
            "lazygit",
            "nodejs",
            "neovim",
            "ripgrep",
            "tldr",
            "fzf",
            "golang",
        ]

    def install_cargo():
        cmd = "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
        if os.system(cmd) == 0:
            green("cargo install success")
        else:
            red("cargo install failed")

    def install_exa():
        method = input("install exa by [1.apt | 2.cargo]: ")
        if method in ["1", "apt"]:
            apt_install("exa")

        elif method in ["2", "cargo"]:
            os.system("cargo install exa")

        else:
            red("invalid input")
            exit(1)

    def install_zsh():
        apt_install("zsh")

    def install_lazygit():
        method = input("install lazygit from [1.source | 2. curl]: ")
        if method == "1" or method == "source":
            if not excuteable("go"):
                red("go not found, build lazygit from source failed")
                exit(1)

            os.system("go get github.com/jesseduffield/lazygit@latest")
            blue("ensure you have add $GOPATH/bin to $PATH")

        elif method == "2" or method == "curl":
            os.system(
                r"""
                LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
                curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
                tar xf lazygit.tar.gz lazygit
                sudo install lazygit /usr/local/bin
            """
            )
        else:
            red("invalid input")
            exit(1)

    def install_nodejs():
        version = input("install nodejs version: [recommend 16 ~ 19]: ")
        os.system(
            f"curl -sL https://deb.nodesource.com/setup_{version}.x | sudo -E bash -"
        )
        apt_install("nodejs")

    def install_neovim():
        method = input("install neovim by [1.apt | 2. source]: ")
        if method == "1" or method == "apt":
            # TODO :
            apt_install("neovim")

    def install_ripgrep():
        pass

    def install_tldr():
        pass

    def install_fzf():
        pass

    def install_golang():
        pass

    for i in track(option_packages):
        if excuteable(i):
            green(f"{i} is installed")
        else:
            locals()[f"install_{i}"]()


def main(argv):
    pass


if __name__ == "__main__":
    # clear output before install
    os.system("clear")
    ensure_install()
    # option_install()
