#!/system/bin/sh

# 定义文件路径
SRC_FILE="/vendor/bin/rkp_factory_extraction_tool64"
SRC_JSON_FILE="/vendor/bin/cred.json"
DST_FILE="/data/local/tmp/rkp_factory_extraction_tool64"
DST_JSON_FILE="/data/local/tmp/cred.json"
OUTPUT_FILE="/data/local/tmp/csr.json"

LOG_TAG="rkp_factory"

# 函数用于记录日志到logcat
log_message() {
	log -t "$LOG_TAG" "$1"
}

log -p e -t "SkipSetupwizard copy" "***copy start !!!"

echo "copy start !!!" >> /data/local/tmp/debug.txt
echo "copy file :$SRC_JSON_FILE" >> /data/local/tmp/debug.txt
# 检查源文件是否存在
if [ ! -f "$SRC_JSON_FILE" ]; then
	echo "rkp_factory Source file not found: $SRC_JSON_FILE" >> /data/local/tmp/debug.txt
    exit 0
fi

# 拷贝文件并设置777权限
cp "$SRC_JSON_FILE" "$DST_JSON_FILE"
if [ $? -eq 0 ]; then
	chmod 777 "$DST_JSON_FILE"
#	chown shell.shell "$DST_JSON_FILE"	
	echo "rkp_factory File copied and permissions set to 777 :$DST_JSON_FILE" >> /data/local/tmp/debug.txt
else
	echo "rkp_factory Failed to copy file :$SRC_JSON_FILE" >> /data/local/tmp/debug.txt
    exit 0
fi



# 检查源文件是否存在
if [ ! -f "$SRC_FILE" ]; then
	echo "rkp_factory Source file not found: $SRC_FILE" >> /data/local/tmp/debug.txt
    exit 0
fi

echo "copy file :$SRC_FILE" >> /data/local/tmp/debug.txt

cp "$SRC_FILE" "$DST_FILE"
if [ $? -eq 0 ]; then
    chmod 777 "$DST_FILE"
#    chown shell.shell "$DST_FILE"
	echo "rkp_factory File copied and permissions set to 777:$DST_FILE" >> /data/local/tmp/debug.txt
else
#    log -p e -t "rkp_factory" "Failed to copy file"
#	log_message "Failed to copy file"
	echo "rkp_factory Failed to copy file :$SRC_FILE" >> /data/local/tmp/debug.txt
    exit 0
fi


# 执行工具并生成JSON输出
"$DST_FILE" --output_format build+csr > "$OUTPUT_FILE"
if [ $? -eq 0 ]; then
 #   log -p i -t "rkp_factory" "Command executed successfully, output saved to $OUTPUT_FILE"
	chmod 777 "$OUTPUT_FILE"
	chown shell.shell "$OUTPUT_FILE"
	echo "rkp_factory Command executed successfully output saved to :$OUTPUT_FILE" >> /data/local/tmp/debug.txt
else
    log -p e -t "rkp_factory" "Command execution failed"
	echo "rkp_factory Command execution failed" >> /data/local/tmp/debug.txt
    exit 0
fi

exit 0
