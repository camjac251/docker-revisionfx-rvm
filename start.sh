#!/bin/bash
echo "HOSTNAME"
hostname
echo "System ID:"
/sbin/rvlsysid

echo "Checking RVL Status"
/sbin/rvlstatus
echo "Running RVL Server"
/sbin/rvlserver &
