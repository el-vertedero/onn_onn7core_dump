#!/system/bin/sh

# 定义文件路径
SRC_FILE="/vendor/bin/rkp_factory_extraction_tool64"
SRC_JSON_FILE="/vendor/bin/cred.json"
DST_FILE="/data/local/tmp/rkp_factory_extraction_tool64"
DST_JSON_FILE="/data/local/tmp/cred.json"
OUTPUT_FILE="/data/local/tmp/csr.json"

# 检查源文件是否存在
if [ ! -f "$DST_JSON_FILE" ]; then
    log -p e -t "SkipSetupwizard hcn_remove" "Source file not found: $DST_JSON_FILE"
    exit 0
fi
rm "$DST_JSON_FILE"
log -p e -t "SkipSetupwizard hcn_remove" ": $DST_JSON_FILE"

if [ ! -f "$OUTPUT_FILE" ]; then
    log -p e -t "SkipSetupwizard hcn_remove" "Source file not found: $OUTPUT_FILE"
    exit 0
fi
rm "$OUTPUT_FILE"
log -p e -t "SkipSetupwizard hcn_remove" ": $OUTPUT_FILE"

exit 0
