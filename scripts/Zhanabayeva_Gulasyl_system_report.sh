#!/bin/bash
LOG="$(dirname "$0")/../logs/Zhanabayeva_Gulasyl_system_report.log"

{
  echo "===== SYSTEM REPORT ====="
  echo "Student: Gulasyl Zhanabayeva"
  echo "Date and time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "User: $(whoami)"
  echo "OS and kernel: $(uname -a)"
  echo "--- CPU ---"
  echo "Cores: $NUMBER_OF_PROCESSORS"
  grep -m1 "model name" /proc/cpuinfo
  echo "--- Memory ---"
  grep -E "MemTotal|MemFree|MemAvailable" /proc/meminfo
  echo "--- Disk usage ---"
  df -h
  echo "--- Available disk space (current dir) ---"
  df -h . | awk 'NR==2 {print "Available: " $4}'
  echo
} | tee -a "$LOG"
