#!/usr/bin/env bash

# ~/.config/conky/scripts/check-connection.sh
# Copyright 2022 - Julio Jimenez Delgado
# MIT License

if ping -c 1 -4 -q "$1" > /dev/null 2>&1; then
  echo "[ OK ]"
else
  echo "[ -- ]"
fi
