# --- Variables ---
STUDENT_NAME="Ayush Patel"        # Fill in your name
SOFTWARE_CHOICE="Python"         # Fill in your chosen software

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
HOME_DIR=$HOME
CURRENT_DATE=$(date "+%A, %B %d %Y %H:%M:%S")
LICENSE="GNU General Public License (GPL) v2"

# --- Display ---
echo "   Open Source Audit — $STUDENT_NAME"
echo ""
echo "  🐧 Linux Distribution : $DISTRO"
echo "  🔧 Kernel Version     : $KERNEL"
echo ""
echo "  👤 User               : $USER_NAME"
echo "  🏠 Home Directory     : $HOME_DIR"
echo ""
echo "  ⏱  Uptime             : $UPTIME"
echo "  📅 Date & Time        : $CURRENT_DATE"
echo ""
echo "  📜 Open-Source License: $LICENSE"
echo ""
echo "  Software Choice: $SOFTWARE_CHOICE"