#!/bin/bash
PACKAGE="python3"   # e.g. httpd, mysql, vlc, firefox

# Check if package is installed
if rpm -qi $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed."
    rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
else
    # Try dpkg for Debian/Ubuntu-based systems
    if dpkg -l $PACKAGE &>/dev/null; then
        echo "$PACKAGE is installed."
        dpkg -l $PACKAGE | grep -E 'Version|Description'
    else
        echo "$PACKAGE is NOT installed."
    fi
fi

echo ""
echo "========================================"
echo "   📦 FOSS Package Philosophy Report"
echo "========================================"

# Case statement that prints a one-line philosophy note based on package name
case $PACKAGE in
    httpd)
        echo "Apache: The web server that built the open internet." ;;
    mysql)
        echo "MySQL: open source at the heart of millions of apps." ;;
    python3)
        echo "Python: A free, open-source language powering science, web, and AI worldwide." ;;
    python)
        echo "Python: Simple, readable, and open — the world's most popular programming language." ;;
    vlc)
        echo "VLC: A free and open-source multimedia player that plays almost anything." ;;
    firefox)
        echo "Firefox: Mozilla's open-source browser championing privacy and the free web." ;;
    git)
        echo "Git: The open-source version control system behind modern software collaboration." ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to the free software ecosystem." ;;
esac

echo "========================================"
echo ""
echo "🔓 License Philosophy:"
echo "   Open-source software gives users the freedom to"
echo "   use, study, modify, and distribute the software."
echo "   Python is licensed under the PSF License — OSI approved."
echo "========================================"