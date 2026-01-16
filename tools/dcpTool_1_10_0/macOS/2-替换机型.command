#!/bin/bash

# 定义输入文件夹路径
IN_FOLDER="xml_output"

# 您希望替换成的新相机型号
NEW_CAMERA_MODEL="Panasonic DC-S5M2X"

# 循环遍历输入文件夹中的所有.xml文件
for XML_FILE in "$IN_FOLDER"/*.xml; do
    # 检查文件是否存在，避免空的通配符匹配
    if [ -f "$XML_FILE" ]; then
        echo "正在处理 $XML_FILE ..."

        # 使用 sed 替换 UniqueCameraModelRestriction 标签的值
        # -i 选项表示直接修改文件
        # -e 选项后跟的是对 sed 的命令
        # s/旧值/新值/g 是 sed 的替换命令
        sed -i ".bak" "s/<UniqueCameraModelRestriction>.*<\/UniqueCameraModelRestriction>/<UniqueCameraModelRestriction>$NEW_CAMERA_MODEL<\/UniqueCameraModelRestriction>/g" "$XML_FILE"

        echo "$XML_FILE 已更新。"
    fi
done

echo "所有文件处理完成。"