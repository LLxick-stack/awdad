#!/bin/bash
cd /opt/vpn2
./vpn_checker

DATE=$(date +'%d.%m.%Y %H:%M')
HEADER="#profile-title: LLxickVPN
#support-url: https://t.me/LLxick2
#profile-update-interval: 1
#announce: UPD: $DATE | обновление каждые 15 мин | тгк @LLxickVPN
"

for f in vpn.txt vpn_renamed.txt vpn_base64.txt vpn_renamed_base64.txt bobi_vpn.txt bobi_vpn_lite.txt bobi_vpn_base64.txt countries/*.txt; do
    [ -f "$f" ] && sed -i '/^#/d' "$f" && echo "$HEADER$(cat $f)" > "$f"
done

git add -A
git commit -m "update $DATE"
git push
