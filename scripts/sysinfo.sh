#!/usr/bin/env bash
# sysinfo.sh — print basic system information.
# Used as a Linux scripting exercise for the DevOps intern final.

set -euo pipefail

echo "=============================="
echo "  DevOps Intern — sysinfo.sh  "
echo "=============================="
echo

echo "[1] Current user:"
whoami
echo

echo "[2] Current date:"
date
echo

echo "[3] Disk usage (df -h):"
df -h
echo

