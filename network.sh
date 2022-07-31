#!/bin/bash

# This script is a workaround for enterprise networks which do not work well with nmtui

# Might be useful:
# nmcli c s - list all configured connections, use to find SSID

HORIZONTALLINE="==================================================================================="
echo $HORIZONTALLINE
echo "                                    Setting up enterprise wifi for Linux"
echo $HORIZONTALLINE
echo "\n\n"
read -p "Enter your wifi name: " wifi_name
read -p "Enter your wifi ssid: " wifi_ssid
read -p "Enter your identity: " wifi_identity
read -p "Enter your password: " -s wifi_password

nmcli connection add \
 type wifi con-name $wifi_name ifname wlo1 ssid $wifi_name \
 wifi-sec.key-mgmt wpa-eap \
 802-1x.eap peap \
 802-1x.phase2-auth pap \
 802-1x.identity $wifi_identity \
 802-1x.password $wifi_password
echo $HORIZONTALLINE
