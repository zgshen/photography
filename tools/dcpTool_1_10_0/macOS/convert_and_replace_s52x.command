#!/bin/bash

# 第一部分：将 .dcp 文件转换为 .xml 文件
IN_FOLDER_DCP="dcp_input"
OUT_FOLDER_XML="xml_output"

# 检查输出文件夹是否存在，如果不存在则创建
if [ ! -d "$OUT_FOLDER_XML" ]; then
    mkdir "$OUT_FOLDER_XML"
fi

# 循环遍历输入文件夹中的所有.dcp文件
for DCP_FILE in "$IN_FOLDER_DCP"/*.dcp; do
    # 提取文件名（不包含路径和扩展名）
    BASENAME=$(basename "$DCP_FILE" .dcp)

    # 构建输出文件的完整路径
    OUTPUT_FILE_XML="$OUT_FOLDER_XML/${BASENAME}.xml"

    # 执行dcptool命令进行转换
    /Users/yuanjun/Desktop/dcp转换工具/dcpTool_1_10_0/Binaries/macOS/dcptool -d "$DCP_FILE" "$OUTPUT_FILE_XML"
done

echo ".dcp 到 .xml 的转换完成。"

# 第二部分：批量替换 .xml 文件中的 UniqueCameraModelRestriction 标签的值
IN_FOLDER_XML="xml_output"
NEW_CAMERA_MODEL="Panasonic DC-S5M2X"

# 循环遍历输入文件夹中的所有.xml文件
for XML_FILE in "$IN_FOLDER_XML"/*.xml; do
    # 检查文件是否存在，避免空的通配符匹配
    if [ -f "$XML_FILE" ]; then
        echo "正在处理 $XML_FILE ..."

        # 使用 sed 替换 UniqueCameraModelRestriction 标签的值
        sed -i ".bak" "s/<UniqueCameraModelRestriction>.*<\/UniqueCameraModelRestriction>/<UniqueCameraModelRestriction>$NEW_CAMERA_MODEL<\/UniqueCameraModelRestriction>/g" "$XML_FILE"

        echo "$XML_FILE 已更新。"
    fi
done

echo "所有 .xml 文件处理完成。"

# 第三部分：将 .xml 文件转换回 .dcp 文件
IN_FOLDER_XML="xml_output"
OUT_FOLDER_DCP="dcp_output"

# 检查输出文件夹是否存在，如果不存在则创建
if [ ! -d "$OUT_FOLDER_DCP" ]; then
    mkdir -p "$OUT_FOLDER_DCP"
fi

# 循环遍历输入文件夹中的所有.xml文件
for XML_FILE in "$IN_FOLDER_XML"/*.xml; do
    # 检查文件是否存在，避免空的通配符匹配
    if [ -f "$XML_FILE" ]; then
        # 提取文件名（不包含路径和扩展名）
        BASENAME=$(basename "$XML_FILE" .xml)

        # 构建输出文件的完整路径
        OUTPUT_FILE_DCP="$OUT_FOLDER_DCP/${BASENAME}.dcp"

        # 执行dcptool命令进行转换
        /Users/yuanjun/Desktop/dcp转换工具/dcpTool_1_10_0/Binaries/macOS/dcptool -c "$XML_FILE" "$OUTPUT_FILE_DCP"
    fi
done

echo ".xml 到 .dcp 的转换完成。"