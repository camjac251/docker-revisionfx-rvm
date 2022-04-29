#!/bin/bash
echo "HOSTNAME"
hostname
echo "IP ADDRESS:"
hostname -i

export RLM_LICENSE=/opt/rlm/licenses

# Store the licese file inside the container for later reuse.
#cp /opt/rlm/licenses/foundry_float.lic /opt/foundry_float.lic

# Output info
echo "N" | /usr/local/foundry/LicensingTools7.3/FoundryLicenseUtility -d
#echo "N" | /usr/local/foundry/LicensingTools7.3/FoundryLicenseUtility -i
#echo "N" | /usr/local/foundry/LicensingTools7.3/FoundryLicenseUtility -n
#echo "N" | /usr/local/foundry/LicensingTools7.3/FoundryLicenseUtility -v

# Run the license server directly with the copied license file.

echo "Y" | /usr/local/foundry/LicensingTools7.3/bin/RLM/rlm.foundry -iai
