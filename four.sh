#!/bin/bash
LOGFILE=$1
KEYWORD=${2:-"error"}    # Default keyword is 'error'
COUNT=0
RETRY=0
MAX_RETRIES=3
# ─── Check if file argument was provided ───
if [ -z "$LOGFILE" ]; then
    echo "========================================"
    echo "  ⚠️  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    echo "========================================"
    exit 1
fi
# ─── Check if file exists ───
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi
echo "========================================"
echo "       📋 Log File Analyzer"
echo "========================================"
echo "  📂 File    : $LOGFILE"
echo "  🔍 Keyword : $KEYWORD"
echo "========================================"
echo ""
# ─── do-while style retry if file is empty ───
# In bash, do-while is simulated using: while true; do ... [break condition]
while true; do
    RETRY=$((RETRY + 1))
    if [ -s "$LOGFILE" ]; then
        echo "✅ File has content. Starting analysis..."
        break
    else
        echo "⚠️  File '$LOGFILE' is empty. Retry attempt $RETRY of $MAX_RETRIES..."
        sleep 1
    fi

    if [ $RETRY -ge $MAX_RETRIES ]; then
        echo "❌ File is still empty after $MAX_RETRIES retries. Exiting."
        exit 1
    fi
done
echo ""
# ─── Main while-read loop: count keyword matches ───
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"
# ─── Summary ───
echo "========================================"
echo "         📊 Analysis Summary"
echo "========================================"
echo "  Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "========================================"
echo ""
# ─── Print last 5 matching lines using tail + grep ───
echo "========================================"
echo "   🔎 Last 5 lines matching '$KEYWORD':"
echo "========================================"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    echo "  ℹ️  No matching lines found for '$KEYWORD'."
else
    echo "$MATCHES" | tail -5 | while IFS= read -r LINE; do
        echo "  ➤ $LINE"
    done
fi
echo "========================================"
echo ""
# ─── Python-specific: check pip or python log references ───
echo "========================================"
echo "   🐍 Python-Related Log Entries"
echo "========================================"
PY_COUNT=$(grep -ic "python" "$LOGFILE" 2>/dev/null || echo 0)
echo "  ➤ 'python' mentioned : $PY_COUNT time(s)"

LAST_PY=$(grep -i "python" "$LOGFILE" 2>/dev/null | tail -3)
if [ -n "$LAST_PY" ]; then
    echo "  ➤ Last 3 Python entries:"
    echo "$LAST_PY" | while IFS= read -r LINE; do
        echo "     → $LINE"
    done
else
    echo "  ℹ️  No Python-related entries found."
fi
echo "========================================"