# shellscripts

A collection of shell scripts for Docker deployment, system administration, and automation tasks.

## Contents

### Docker/
- **RH-docker-install.sh** - Docker installation script for Red Hat/CentOS systems
- **Portainer/** - Docker-Portainer-Deploy.sh for deploying Portainer container management UI
- **ulogger/** - Docker-ulogger-Deploy.sh for deploying ulogger GPS tracking service

### Notes/
- **Bash.txt** - Bash scripting notes and tips
- **Wireshark.txt** - Wireshark usage documentation

### Reference/
- **continuous_backspace_not_working_work_around.sh** - Workaround script for terminal issues
- **process.sh** - Process management reference script
- **random-num-generator.sh** - Random number generation examples
- **serial_monitor.txt** - Serial monitor configuration notes
- **vnc.sh** - VNC setup reference script

### Scripts/
- **API-CapsToReal** - Tool for converting API caps to real format
- **backup_check_y2kz.sh** - Backup verification script
- **brightness.sh** - Screen brightness control script
- **check_io_y2kz.sh** - I/O monitoring script
- **gdd.sh** - Google Drive downloader script
- **no-ip-updater** - Dynamic DNS updater for No-IP service
- **Self-Extracting-Script/** - Self-extracting archive generator scripts

## Requirements

- Bash 4.0+
- Docker (for Docker deployment scripts)
- curl, wget (for network scripts)
- Standard Linux utilities

## Usage

```bash
# Make scripts executable
chmod +x Scripts/*.sh

# Run individual scripts
./Scripts/brightness.sh
./Scripts/backup_check_y2kz.sh
```
