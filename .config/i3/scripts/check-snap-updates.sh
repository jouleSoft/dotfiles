#!/usr/bin/env bash

/usr/bin/snap refresh --list|grep -v -e Version | wc -l
