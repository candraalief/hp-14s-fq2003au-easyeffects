#!/usr/bin/env bash
# Installer for HP 14s-fq2003au EasyEffects Audio Preset
# Author: Candra AAP (candraalief)

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PRESET_NAME="HP-14s-FQ2003AU"
PRESET_FILE="$SCRIPT_DIR/$PRESET_NAME.json"
TARGET_OUTPUT_DIR="$HOME/.local/share/easyeffects/output"
TARGET_IRS_DIR="$HOME/.local/share/easyeffects/irs"

echo -e "${CYAN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   HP 14s-fq2003au EasyEffects Preset Installer        ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

# 1. Check if EasyEffects is installed
if ! command -v easyeffects &>/dev/null && ! flatpak list | grep -q "com.github.wwmm.easyeffects"; then
    echo -e "${YELLOW}[!] EasyEffects is not installed on your system.${NC}"
    echo -e "    Please install it using your package manager:"
    echo -e "    - Fedora: ${CYAN}sudo dnf install easyeffects${NC}"
    echo -e "    - Arch/Manjaro: ${CYAN}sudo pacman -S easyeffects${NC}"
    echo -e "    - Ubuntu/Debian: ${CYAN}sudo apt install easyeffects${NC}"
    echo -e "    - Flatpak: ${CYAN}flatpak install flathub com.github.wwmm.easyeffects${NC}"
    echo ""
    read -p "Continue installation anyway? (y/n): " proceed
    if [[ "$proceed" != "y" && "$proceed" != "Y" ]]; then
        echo "Installation aborted."
        exit 1
    fi
fi

# 2. Check source preset file
if [[ ! -f "$PRESET_FILE" ]]; then
    echo -e "${RED}[✗] Error: $PRESET_FILE not found!${NC}"
    exit 1
fi

# 3. Create target directories and copy preset + IRS files
echo -e "${GREEN}[*] Copying preset to $TARGET_OUTPUT_DIR...${NC}"
mkdir -p "$TARGET_OUTPUT_DIR"
cp -v "$PRESET_FILE" "$TARGET_OUTPUT_DIR/"

if [[ -d "$SCRIPT_DIR/irs" ]]; then
    echo -e "${GREEN}[*] Copying impulse response (.irs) files to $TARGET_IRS_DIR...${NC}"
    mkdir -p "$TARGET_IRS_DIR"
    cp -v "$SCRIPT_DIR/irs/"*.irs "$TARGET_IRS_DIR/" 2>/dev/null || true
fi

# 4. Load preset if EasyEffects CLI is available
if command -v easyeffects &>/dev/null; then
    echo -e "${GREEN}[*] Applying preset via EasyEffects CLI...${NC}"
    if easyeffects -l "$PRESET_NAME" 2>/dev/null; then
        echo -e "${GREEN}[✓] Preset '$PRESET_NAME' loaded successfully!${NC}"
    else
        echo -e "${YELLOW}[i] EasyEffects is not currently running. It will be available in your preset list next time you open EasyEffects.${NC}"
    fi
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Installation Completed Successfully!        ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "You can now open EasyEffects and select ${CYAN}$PRESET_NAME${NC} under Output Presets."
echo ""

# 5. Offer audio test
if [[ -f "$SCRIPT_DIR/audio-test.sh" ]]; then
    read -p "Would you like to run the Audio Test Suite now? (y/n): " run_test
    if [[ "$run_test" == "y" || "$run_test" == "Y" ]]; then
        bash "$SCRIPT_DIR/audio-test.sh"
    fi
fi
