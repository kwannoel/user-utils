#!/usr/bin/env bash

# fast forward local config repositories

git -C ~/Helpers merge --ff-only origin/master
git -C ~/nixos-config merge --ff-only origin/master
git -C ~/.xmonad merge --ff-only origin/master
git -C ~/.doom.d merge --ff-only origin/master
