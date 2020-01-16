#!/bin/bash

echo "Enter device to be removed:"
read device
udisksctl unmount -b /dev/"$device"1
udisksctl power-off -b /dev/$device
