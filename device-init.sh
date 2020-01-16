#!/bin/bash

echo "Enter your device id: "
read device
udisksctl mount -b /dev/"$device"1
