#!/bin/bash

# 定义输入和输出文件夹路径
IN_FOLDER="xml_output"
OUT_FOLDER="dcp_output"

# 检查输出文件夹是否存在，如果不存在则创建
if [ ! -d "$OUT_FOLDER" ]; then
    mkdir -p "$OUT_FOLDER"
fi

# 循环遍历输入文件夹中的所有.xml文件
for XML_FILE in "$IN_FOLDER"/*.xml; do
    # 检查文件是否存在，避免空的通配符匹配
    if [ -f "$XML_FILE" ]; then
        # 提取文件名（不包含路径和扩展名）
        BASENAME=$(basename "$XML_FILE" .xml)

        # 构建输出文件的完整路径
        OUTPUT_FILE="$OUT_FOLDER/${BASENAME}.dcp"

        # 执行dcptool命令进行转换
        /Users/yuanjun/Desktop/dcp转换工具/dcpTool_1_10_0/Binaries/macOS/dcptool -c "$XML_FILE" "$OUTPUT_FILE"
    fi
done

echo "转换完成。"