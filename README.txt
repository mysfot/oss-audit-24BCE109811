Linux Open-Source Scripts Collection
====================================

This folder contains a series of Bash shell scripts demonstrating various Linux system administration tasks and open-source software concepts. These scripts are designed for educational purposes, particularly for learning about open-source software auditing, package management, and system monitoring.

Scripts Overview:
-----------------

1. one.sh - Open Source Audit Script
   - Displays system information including Linux distribution, kernel version, user details, uptime, and current date/time
   - Shows information about open-source licenses
   - Configurable student name and software choice variables

2. two.sh - FOSS Package Philosophy Report
   - Checks if a specified package is installed on the system
   - Provides philosophical notes about various open-source packages
   - Demonstrates package management concepts

3. three.sh - Directory and Python Config Audit
   - Audits permissions and sizes of important system directories
   - Checks for Python-related configuration and installation directories
   - Useful for system administration and Python environment verification

4. four.sh - Log File Analyzer
   - Analyzes log files for specific keywords (default: "error")
   - Includes retry logic for empty files
   - Demonstrates file processing and text analysis in Bash

5. five.sh - Open Source Manifesto Generator
   - Interactive script that generates a personal open-source manifesto
   - Prompts for user input about favorite tools and beliefs
   - Creates a formatted text file with the manifesto

Usage Instructions:
-------------------

1. Make sure you have execute permissions on the scripts:
   chmod +x *.sh

2. Run each script individually:
   ./one.sh
   ./two.sh
   ./three.sh /path/to/logfile [keyword]
   ./four.sh
   ./five.sh

Note: Some scripts may require root privileges for certain operations, and package availability may vary between different Linux distributions.

Requirements:
-------------
- Bash shell
- Standard Linux utilities (uname, whoami, uptime, grep, cut, etc.)
- Package managers (rpm, dpkg) for package checking
- Python environment for related audits

Author: Ayush Patel
License: GNU General Public License (GPL) v2