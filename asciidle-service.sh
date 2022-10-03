#!/bin/bash

cat > /etc/systemd/system/asciidle.service << EOF

[Unit]

Description=Asciidle Service

[Service]

Type=simple

ExecStart=/bin/bash ~/.asciidle/idle.sh

[Install]

WantedBy=multi-user.target

EOF

systemctl enable asciidle.service
systemctl start asciidle.service
