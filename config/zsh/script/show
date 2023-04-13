#!/usr/bin/env zsh

# check out the arguments number

exist() {
    which $1 > /dev/null
}

# TODO: accept option with '-s' '-S'
pattern=show
while { getopts sp arg } {
    case $arg {
        (s)
            # search mode
            pattern=search
        ;;
        (p)
            # print mode
            pattern=tldr
        ;;
        (?)
            echo 请检查选项是否正确
            exit 1
        ;;
    }
}

# FIXME : doesn't work with opt after argments
shift $((OPTIND - 1))

if (! exist pls) {
    echo '请先安装 pls: '
    echo 'go installl github.com/chenjiangdongx/pls@latest'
    exit 1
}

if (( $# != 1 )) {
    echo '[警告]: 请检查参数，此脚本需要一个参数'
    exit 1
}

if [[ $pattern == tldr ]] {
    eval "$pattern $1 | cat -l md"
} else {
    eval "pls $pattern $1 | cat -l md"
}
