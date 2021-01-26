#!/usr/bin/env sh
set -e
exec java "$JAVA_OPTS" -jar "$@" \
--config-file=/home/burp/config/project_options.json \
--user-config-file=/home/burp/config/user_options.json \
<<EOF
y
$BURP_KEY
o
EOF