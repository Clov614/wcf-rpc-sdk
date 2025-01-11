#!/bin/sh
# 容器启动初始化

# xRDP可能非正常关闭, 需清理pid文件
rm /var/run/xrdp.pid
rm /var/run/xrdp-sesman.pid
# 启动xRDP服务
/usr/sbin/xrdp
/usr/sbin/xrdp-sesman

# 启动注入器
echo "Starting injector..."
wine /root/injector.exe ${INJECTOR_PORT} ${INJECTOR_DEBUG} &

# Necesssary for docker
exec "$@"
