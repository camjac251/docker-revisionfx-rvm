#!/bin/bash
echo "HOSTNAME"
hostname

/sbin/rvlsysid

echo "Checking RVL Status"
/sbin/rvlstatus
echo "Running RVL Server"
/sbin/rvlserver -noservice
