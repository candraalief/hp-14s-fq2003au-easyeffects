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

echo -e "${CYAN}=== HP 14s EasyEffects Preset Installer ===${NC}"

# 1. Check if EasyEffects is installed
if ! command -v easyeffects &>/dev/null && ! flatpak list | grep -q "com.github.wwmm.easyeffects"; then
    echo -e "${YELLOW}[!] EasyEffects is not installed.${NC}"
    echo -e "    Install it via: sudo dnf install easyeffects (Fedora) or sudo pacman -S easyeffects (Arch)"
fi

# 2. Check source preset
if [[ ! -f "$PRESET_FILE" ]]; then
    echo -e "${RED}[✗] Error: $PRESET_FILE not found!${NC}"
    exit 1
fi

# 3. Copy preset and impulse response files
echo -e "${GREEN}[*] Installing preset to $TARGET_OUTPUT_DIR...${NC}"
mkdir -p "$TARGET_OUTPUT_DIR" "$TARGET_IRS_DIR"
cp -v "$PRESET_FILE" "$TARGET_OUTPUT_DIR/"

if [[ -d "$SCRIPT_DIR/irs" ]]; then
    echo -e "${GREEN}[*] Installing impulse response (.irs) files to $TARGET_IRS_DIR...${NC}"
    cp -v "$SCRIPT_DIR/irs/"*.irs "$TARGET_IRS_DIR/" 2>/dev/null || true
fi

# 4. Load preset
if command -v easyeffects &>/dev/null; then
    echo -e "${GREEN}[*] Loading preset into EasyEffects...${NC}"
    easyeffects -l "$PRESET_NAME" 2>/dev/null && echo -e "${GREEN}[✓] Preset '$PRESET_NAME' loaded!${NC}" || true
fi

echo -e "${GREEN}✓ Done! Enjoy better sound on your HP 14s.${NC}"
