#!/bin/bash
################################################################
# Project       : OTHER                                        #
# Description   : Generate masked self extracting shell script # 
# NOTE          : USE AT YOUR OWN RISK -                       #
#                  The output can be easily reversed           #
# Originated by : VAISHNAV PP  [https://github.com/Y2kz]       #
# Date          : 06-09-2024                                   #
################################################################

# Check if both the input script and output script names are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <script_to_embed> <output_script_name>"
    exit 1
fi

# Name of the input script to be embedded
SCRIPT_TO_EMBED="$1"

# Name of the output self-extracting script
OUTPUT_SCRIPT="$2"

# Generate a random UUID to uniquely identify the temporary directory and script
UUID=$(uuidgen || cat /proc/sys/kernel/random/uuid)

# Begin generating the self-extracting script (this part handles extraction and cleanup)
cat << EOF > "$OUTPUT_SCRIPT"
#!/bin/bash

# Generate a random UUID to ensure a unique temporary directory
UUID=\$(uuidgen || cat /proc/sys/kernel/random/uuid)

# Create a temporary directory using the generated UUID
mkdir -p /tmp/Y2kz-slfExt-\$UUID

# Extract the embedded archive (all content after the marker) and unpack it into the temporary directory
sed '0,/^#__HERE_Y2kz_CODE_HERE__#$/d' \$0 | tar zx -C /tmp/Y2kz-slfExt-\$UUID/ 2>/dev/null

# Execute the extracted script and pass the UUID as a parameter
sh /tmp/Y2kz-slfExt-\$UUID/Y2kz-run-ldr.sh \$UUID

# Clean up by removing the temporary directory after execution
rm -fr /tmp/Y2kz-slfExt-\$UUID/

# Exit the script
exit

#__HERE_Y2kz_CODE_HERE__#
EOF

# Create the loader script that will execute the embedded script
cat << EOF > "Y2kz-run-ldr.sh"
#!/bin/bash

# Retrieve the UUID passed to this script
UUID="\$1"
if [ -z "\$UUID" ]; then
    echo "UUID is required!"
    exit 1
fi

# Create the temporary directory using the UUID
mkdir -p /tmp/Y2kz-slfExt-\$UUID

# Execute the embedded script and pass the UUID as a parameter
sh /tmp/Y2kz-slfExt-\$UUID/${SCRIPT_TO_EMBED} \$UUID

# Clean up by removing the temporary directory after execution
rm -rf /tmp/Y2kz-slfExt-\$UUID/
EOF

# Create a tar.gz archive containing the input script and the loader script
tar czf archive_${UUID}.tar.gz "$SCRIPT_TO_EMBED" "Y2kz-run-ldr.sh"

# Append the tar.gz archive to the self-extracting script
cat archive_${UUID}.tar.gz >> "$OUTPUT_SCRIPT"

# Make the output script executable
chmod +x "$OUTPUT_SCRIPT"

# Clean up by removing the temporary files
rm -f "Y2kz-run-ldr.sh" "archive_${UUID}.tar.gz"

# Inform the user that the self-extracting script has been successfully created
echo "Self-extracting script generated: $OUTPUT_SCRIPT"
