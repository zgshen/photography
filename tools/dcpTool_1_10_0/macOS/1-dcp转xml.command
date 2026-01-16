#!/bin/bash

# 定义输入和输出文件夹路径
IN_FOLDER="dcp_input"
OUT_FOLDER="xml_output"

# 检查输出文件夹是否存在，如果不存在则创建
if [ ! -d "$OUT_FOLDER" ]; then
    mkdir "$OUT_FOLDER"
fi

# 循环遍历输入文件夹中的所有.dcp文件
for DCP_FILE in "$IN_FOLDER"/*.dcp; do
    # 提取文件名（不包含路径和扩展名）
    BASENAME=$(basename "$DCP_FILE" .dcp)

    # 构建输出文件的完整路径
    OUTPUT_FILE="$OUT_FOLDER/${BASENAME}.xml"

    # 执行dcptool命令进行转换
    /Users/yuanjun/Desktop/dcp转换工具/dcpTool_1_10_0/Binaries/macOS/dcptool -d "$DCP_FILE" "$OUTPUT_FILE"
done

echo "转换完成。"



