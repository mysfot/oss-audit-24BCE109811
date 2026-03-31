#!/bin/bash
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
echo "========================================"
echo "       Directory Audit Report"
echo "========================================"
echo ""

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "📁 $DIR"
        echo "   ➤ Permissions : $PERMS"
        echo "   ➤ Size        : $SIZE"
        echo "----------------------------------------"
    else
        echo "⚠️  $DIR does not exist on this system"
        echo "----------------------------------------"
    fi
done

echo ""
echo "========================================"
echo "   🐍 Python Software Config Audit"
echo "========================================"
echo ""

# Python-related config/install directories to check
PYTHON_DIRS=(
    "/usr/lib/python3"
    "/usr/lib/python3.12"
    "/usr/local/lib/python3.12"
    "/etc/python3"
    "/usr/bin/python3"
)

for PDIR in "${PYTHON_DIRS[@]}"; do
    if [ -e "$PDIR" ]; then
        PERMS=$(ls -ld "$PDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$PDIR" 2>/dev/null | cut -f1)
        echo "✅ Found: $PDIR"
        echo "   ➤ Permissions : $PERMS"
        echo "   ➤ Size        : $SIZE"
        echo "----------------------------------------"
    else
        echo "❌ Not found: $PDIR"
        echo "----------------------------------------"
    fi
done

echo ""
echo "========================================"
echo "   🔍 Python Executable Info"
echo "========================================"
PYTHON_BIN=$(which python3 2>/dev/null)
if [ -n "$PYTHON_BIN" ]; then
    echo "   ➤ Python Binary   : $PYTHON_BIN"
    echo "   ➤ Version         : $(python3 --version 2>&1)"
    PERMS=$(ls -ld "$PYTHON_BIN" | awk '{print $1, $3, $4}')
    echo "   ➤ Permissions     : $PERMS"
else
    echo "   ⚠️  python3 is not found in PATH"
fi
echo "========================================"