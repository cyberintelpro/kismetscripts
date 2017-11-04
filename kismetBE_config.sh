#!/bin/bash
# A script to configure kismet bleeding edge


&& read -p 'Set Kismet Username: ' uservar \
&& read -sp 'Set Kismet Password: ' passwd \
&& sudo sh -c "echo 'httpd_username=$uservar' >> /usr/local/etc/kismet_httpd.conf" \
&& sudo sh -c "echo 'httpd_password=$passwd' >> /usr/local/etc/kismet_httpd.conf" \
&& iwconfig 2>/dev/null | grep -o "^\w*" \
&& read -p 'Which wireless interface do you want to use? ' winterface \
&& read -p 'What do you want to name the selected wireless? ' winame \
&& sudo sh -c "echo 'source=$winterface:name=$winame' >> /usr/local/etc/kismet.conf" \
&& hciconfig  2>/dev/null | grep -o "^\w*"
