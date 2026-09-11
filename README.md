# HP 14s EasyEffects Audio Preset 🎧🔊

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/candraalief/hp-14s-fq2003au-easyeffects/pulls)
[![EasyEffects](https://img.shields.io/badge/EasyEffects-PipeWire-blue.svg)](https://github.com/wwmm/easyeffects)

A calibrated, high-fidelity **EasyEffects** audio preset with **Convolver (IRS)** crafted specifically for the **HP 14s Laptop series** (tested on HP 14s-fq2003au with Realtek ALC236).

Fixes the thin, hollow sound and chassis plastic vibration on Linux, giving deep bass, wider stereo soundstage, and clear vocals without distortion.

---

![Preset Preview](assets/convolver-preview.png)

## 🌟 Features

- **Wide Stereo Soundstage:** Powered by Convolver impulse response (*Razor Surround 48k Z-Edition*).
- **No Chassis Rattle:** Sub-bass cut at 75 Hz eliminates violent speaker buzzing on low notes.
- **Harmonic Bass Boost:** Psychoacoustic bass enhancer creates rich low-end feel without over-excursion.
- **Natural Dynamics:** Dynamic compressor smooths volume levels without sudden volume jumps (*no volume pumping*).
- **Speaker Protection:** Peak limiter at -0.5 dB guarantees zero audio clipping even at 100% volume.

---

## 🚀 Quick Install

Run this single command in your terminal:

```bash
git clone https://github.com/candraalief/hp-14s-fq2003au-easyeffects.git
cd hp-14s-fq2003au-easyeffects
./install.sh
```

The installer will copy the preset and required impulse response (`.irs`) file, then load it into EasyEffects automatically.

### Manual Install
If you prefer manual setup:
1. Copy `irs/*.irs` to `~/.local/share/easyeffects/irs/`
2. Copy `HP-14s-FQ2003AU.json` to `~/.local/share/easyeffects/output/`
3. Open EasyEffects → **Presets** → select **HP-14s-FQ2003AU** → click **Load**.

---

## 🧪 Audio Test

Test the tuning across all frequencies using the included script:

```bash
./audio-test.sh
```

---

## 💻 Tested Hardware

| Device | Audio Chipset | OS / Distro | Status |
| :--- | :--- | :--- | :---: |
| **HP 14s-fq2003au** | Realtek ALC236 | Fedora 41, Arch Linux | 🌟 Verified |
| **HP 14s (other variants)** | Realtek ALC236 / ALC269 | Linux (Kernel 6.x+) | 🟢 Compatible |

---

## 🤝 Contributing

Contributions are very welcome!
- **Tested on another HP laptop?** Let us know in an [Issue](https://github.com/candraalief/hp-14s-fq2003au-easyeffects/issues).
- **Want to add an alternative preset (Gaming, Cinema, Voice)?** Fork the repo and submit a Pull Request!

---

## 📄 License

MIT License © 2026 [Candra AAP](https://github.com/candraalief)
