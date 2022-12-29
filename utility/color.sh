done='\e[0m'
hl='\e[1m'
underline='\e[4m'
blink='\e[5m'
reverse='\e[7m'
fade='\e[8m'
fg='\e[30m' # 字体
bg='\e[40m' # 背景
# \e[nA 光标上移n行 
# \e[nB 光标下移n行 
# \e[nC 光标右移n行 
# \e[nD 光标左移n行 
# set=\e[y;xH # 设置光标位置 
clear='\e[2J' #  清屏 
clearToLineEnd='\e[K' #  清除从光标到行尾的内容 
store='\e[s' # 保存光标位置 
recover='\e[u' #  恢复光标位置 
hide='\e[?25l' # 隐藏光标 
show='\e[?25h' # 显示光标


black='\e[30m'   # 黑色字
red='\e[31m'     # 红色字
green='\e[32m'   # 绿色字
yellow='\e[33m'  # 黄色字
blue='\e[34m'    # 蓝色字
purple='\e[35m'  # 紫色字
skyblue='\e[36m' # 天蓝字


# TODO: accept some arguments then print colorized message
# color()
# {
#     
# }
