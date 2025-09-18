#!/bin/bash
# Quick benchmark script to measure shell startup time

echo -n "ZSH startup: "
time ( zsh -i -c exit ) 2>&1 | grep real | awk '{print $2}'