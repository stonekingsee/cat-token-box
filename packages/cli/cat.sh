#!/bin/bash

# 获取用户设置的mint次数
read -p "请输入 mint 次数: " MINT_COUNT

# 设置 mint 命令
command="sudo yarn cli mint -i 45ee725c2c5993b3e4d308842d87e973bf1951f5f7a804b21e4dd964ecd12d6b_0 5 --fee-rate 1500"

# 循环执行 mint
for ((i=1; i<=MINT_COUNT; i++)); do
    echo "正在执行第 $i 次 mint"
    $command

    # 检查命令是否成功
    if [ $? -ne 0 ]; then
        echo "命令执行失败，退出脚本"
        exit 1
    fi

    sleep 1
done

echo "所有 mint 操作完成"