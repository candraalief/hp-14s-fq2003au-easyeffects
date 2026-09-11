#!/bin/bash
# Audio Test Suite for HP 14s-fq2xxx
# Tests different frequency ranges to identify issues with your EasyEffects preset

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║      Audio Test Suite for HP 14s Laptop      ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Set your volume to ~50% before starting.${NC}"
echo -e "Each test plays for 3 seconds. Listen for distortion, clipping, or rattling."
echo ""
read -p "Press Enter to start..."

# Test 1: Frequency sweep (low to high)
echo ""
echo -e "${GREEN}[Test 1/7] Frequency Sweep: 100Hz → 15000Hz${NC}"
echo -e "  Listen for: crackling, distortion, or sudden volume jumps"
speaker-test -t sine -f 100 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 500 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 1000 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 3000 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 8000 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 15000 -l 1 -p 1 2>/dev/null &
PID=$!; sleep 1; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Did you hear distortion at any frequency? (y/n): " ans1
echo ""

# Test 2: Bass stress test (where your preset boosts the most)
echo -e "${GREEN}[Test 2/7] Bass Stress Test: 142Hz (your +8dB band)${NC}"
echo -e "  Listen for: speaker rattling, buzzing, or muddy/boomy sound"
speaker-test -t sine -f 142 -l 1 -p 3 2>/dev/null &
PID=$!; sleep 3; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Did the bass sound clean or distorted? (clean/distorted): " ans2
echo ""

# Test 3: Low-mid stress test (220Hz and 338Hz - your +9dB bands!)
echo -e "${RED}[Test 3/7] LOW-MID STRESS: 220Hz & 338Hz (your +9dB bands - DANGER ZONE)${NC}"
echo -e "  Listen for: CLIPPING, buzzing, or the sound breaking up"
speaker-test -t sine -f 220 -l 1 -p 3 2>/dev/null &
PID=$!; sleep 3; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 338 -l 1 -p 3 2>/dev/null &
PID=$!; sleep 3; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Did 220Hz or 338Hz clip/distort? (y/n): " ans3
echo ""

# Test 4: Mid range (should be clean)
echo -e "${GREEN}[Test 4/7] Mid Range: 1000Hz (reference tone)${NC}"
echo -e "  This should sound clean - it's your baseline"
speaker-test -t sine -f 1000 -l 1 -p 3 2>/dev/null &
PID=$!; sleep 3; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Was this clean? (y/n): " ans4
echo ""

# Test 5: High frequency test (your +7.14dB at 16.5kHz)
echo -e "${YELLOW}[Test 5/7] High Treble: 10700Hz & 16500Hz (your boosted bands)${NC}"
echo -e "  Listen for: harshness, sibilance, or piercing quality"
speaker-test -t sine -f 10700 -l 1 -p 2 2>/dev/null &
PID=$!; sleep 2; kill $PID 2>/dev/null; wait $PID 2>/dev/null
speaker-test -t sine -f 16500 -l 1 -p 2 2>/dev/null &
PID=$!; sleep 2; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Was the treble harsh or ok? (harsh/ok): " ans5
echo ""

# Test 6: Pink noise (tests overall tonal balance)
echo -e "${GREEN}[Test 6/7] Pink Noise (overall balance test)${NC}"
echo -e "  Listen for: should sound like even static/rain, not boomy or harsh"
speaker-test -t pink -l 1 -p 3 2>/dev/null &
PID=$!; sleep 3; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Did the noise sound balanced, boomy, or harsh? (balanced/boomy/harsh): " ans6
echo ""

# Test 7: Left/Right channel test
echo -e "${GREEN}[Test 7/7] Stereo Channel Test${NC}"
echo -e "  Verify left and right speakers work correctly"
speaker-test -t wav -c 2 -l 1 -p 3 2>/dev/null &
PID=$!; sleep 6; kill $PID 2>/dev/null; wait $PID 2>/dev/null

read -p "Did you hear left and right correctly? (y/n): " ans7

# Summary
echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║              TEST RESULTS SUMMARY            ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
echo -e "  Frequency sweep distortion:  $ans1"
echo -e "  Bass 142Hz:                  $ans2"
echo -e "  Low-mid 220/338Hz clipping:  $ans3"
echo -e "  Mid 1000Hz baseline:         $ans4"
echo -e "  High treble harshness:       $ans5"
echo -e "  Pink noise balance:          $ans6"
echo -e "  Stereo channels:             $ans7"
echo ""
echo -e "${YELLOW}════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}Known issues in your AudioCandra preset:${NC}"
echo -e "  ${RED}⚠ Band 0 (142Hz): +8dB  — too high for tiny speakers${NC}"
echo -e "  ${RED}⚠ Band 1 (220Hz): +9dB  — VERY likely clipping${NC}"
echo -e "  ${RED}⚠ Band 2 (338Hz): +9dB  — VERY likely clipping${NC}"
echo -e "  ${RED}⚠ Band 8 (16.5kHz): +7.14dB — excessive treble boost${NC}"
echo -e "  ${RED}⚠ No high-pass filter — sub-bass wastes speaker energy${NC}"
echo -e "  ${RED}⚠ No compressor — dynamics are uncontrolled${NC}"
echo -e "${YELLOW}════════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}Tip: Run this test again after switching presets to compare!${NC}"
