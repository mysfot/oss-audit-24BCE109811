#!/bin/bash
echo "Answer three questions to generate your manifesto."
echo ""
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"
echo "========================================"  > $OUTPUT
echo "       MY OPEN SOURCE MANIFESTO"         >> $OUTPUT
echo "========================================"  >> $OUTPUT
echo ""                                          >> $OUTPUT
echo "Date: $DATE"                               >> $OUTPUT
echo ""                                          >> $OUTPUT
echo "I believe in the power of open-source software." >> $OUTPUT
echo "Every day, I rely on $TOOL — a tool built"       >> $OUTPUT
echo "freely by the community, for the community."     >> $OUTPUT
echo ""                                                 >> $OUTPUT
echo "To me, freedom means $FREEDOM."                  >> $OUTPUT
echo "Open source embodies that — the freedom to use," >> $OUTPUT
echo "study, modify, and share software without limits.">> $OUTPUT
echo ""                                                 >> $OUTPUT
echo "One day, I will build $BUILD and release it"     >> $OUTPUT
echo "freely, just as Python was shared with the world">> $OUTPUT
echo "under the open PSF License."                     >> $OUTPUT
echo ""                                                 >> $OUTPUT
echo "  — $(whoami)"                                   >> $OUTPUT
echo "========================================"         >> $OUTPUT

echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
cat $OUTPUT