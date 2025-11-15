# setopt EXTENDED_GLOB      # 加强版通配符
setopt correct
setopt hist_ignore_dups     # 相同命令历史纪录唯一
setopt append_history       # 多个会话的历史记录会追加到文件
setopt inc_append_history   # 命令执行后立即追加，而非等到退出shell
setopt share_history        # 在会话间实时共享历史

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000              # 内存中历史数量
SAVEHIST=10000              # 保存到文件的历史数量
