# HP 14s-fq2003au EasyEffects Audio Preset 🎧🔊

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)](CONTRIBUTING.md)
[![EasyEffects](https://img.shields.io/badge/EasyEffects-8.0%2B-blue.svg)](https://github.com/wwmm/easyeffects)
[![PipeWire](https://img.shields.io/badge/Audio-PipeWire-red.svg)](https://pipewire.org/)
[![Hardware](https://img.shields.io/badge/Device-HP%2014s--fq2003au-orange.svg)]()

A finely-tuned, high-fidelity **EasyEffects** audio preset with **Convolution (IRS)** and a complete DSP master chain specifically crafted for the **HP 14s Laptop series** (specifically **HP 14s-fq2003au** with AMD Ryzen 5 5625U and Realtek ALC236 audio).

This project is open-source and ready for community expansion to support other HP laptop variants and alternative sound profiles.

---

## 🧐 The Problem with Default Linux Audio on HP 14s

On Windows, HP laptops rely on proprietary DTS / Realtek APO software to compensate for small laptop speakers. When switching to Linux (Fedora, Arch, Ubuntu, etc.), that processing is absent, resulting in:
- Thin, tinny, and hollow sound.
- Violent chassis vibration and buzzing (*plastic rattle*) when low bass notes are played.
- Severe distortion and harsh digital clipping when users try to manually boost the equalizer without proper digital headroom, compression, and brickwall limiting.

---

## ✨ The Complete Audio Architecture

This preset combines a calibrated **Convolution Impulse Response (FIR filter)** with a dedicated multi-stage DSP mastering pipeline:

![Convolver Preview](assets/convolver-preview.png)

### 🎛️ Complete Plugin Chain:

```mermaid
graph LR
    Input[Audio Source] --> Convolver["Convolver (Razor Surround 48k)"]
    Convolver --> Filter["High-Pass Filter (75Hz)"]
    Filter --> Bass["Bass Enhancer (Harmonics)"]
    Bass --> EQ["9-Band Precision EQ"]
    EQ --> Comp["Dynamic Compressor"]
    Comp --> AutoGain["AutoGain (-16 LUFS)"]
    AutoGain --> Limiter["Peak Limiter (-0.5 dB)"]
    Limiter --> Speaker["HP Laptop Speakers"]
```

1. **Convolver (Razor Surround 48k Z-Edition +50 Bass Low Latency):**
   - Applies an acoustic FIR impulse response giving a wide, room-filling stereo soundstage with punchy, resonant bass without phase distortion or audio latency (0.062s duration).
2. **Sub-Bass Cut (High-Pass Filter at 75 Hz):**
   - Eliminates useless frequencies below 75 Hz that small laptop speaker cones cannot physically reproduce, stopping chassis vibration (*rattling/buzzing*).
3. **Psychoacoustic Bass Enhancer:**
   - Generates upper harmonic overtones (60–140 Hz) that trick the human ear into hearing deep bass without over-excursion of the physical speaker drivers.
4. **9-Band Precision Equalizer:**
   - Calibrated EQ curve enhancing lower warmth (142 Hz), vocal presence (220 Hz, 338 Hz, 2.5 kHz), and crystal clear treble (10.7 kHz, 16.5 kHz) with calibrated pre-attenuation headroom.
5. **Dynamic Range Compressor (DRC):**
   - Smooths out dynamic range, bringing out subtle acoustic details in dialogue, music, and games while keeping sudden loud spikes controlled.
6. **Intelligent AutoGain (-16 LUFS):**
   - Automatically maintains consistent perceived loudness across YouTube, Spotify, games, and system media.
7. **Transparent Peak Limiter (-0.5 dB):**
   - Hermetic brickwall peak limiter acts as the ultimate safety shield, ensuring no audio clips or distorts, even at 100% volume.

---

## 🚀 Quick Installation

### Option 1: One-Line Automated Installer (Recommended)

Open your terminal and run:

```bash
git clone https://github.com/candraalief/hp-14s-fq2003au-easyeffects.git
cd hp-14s-fq2003au-easyeffects
./install.sh
```

The script will automatically:
1. Copy `HP-14s-FQ2003AU.json` and any community presets to `~/.local/share/easyeffects/output/`.
2. Copy `Razor Surround ((48k Z-Edition)) 4.Stereo +50 Bass Low Latency.irs` to `~/.local/share/easyeffects/irs/`.
3. Activate the preset immediately in EasyEffects.

---

### Option 2: Manual Installation

1. **Copy the IRS Kernel:**
   ```bash
   mkdir -p ~/.local/share/easyeffects/irs
   cp "irs/Razor Surround ((48k Z-Edition)) 4.Stereo +50 Bass Low Latency.irs" ~/.local/share/easyeffects/irs/
   ```

2. **Copy the Preset JSON:**
   ```bash
   mkdir -p ~/.local/share/easyeffects/output
   cp HP-14s-FQ2003AU.json ~/.local/share/easyeffects/output/
   ```

3. **Load in EasyEffects:**
   - Open **EasyEffects**.
   - Go to **Presets** → **Output**.
   - Select **`HP-14s-FQ2003AU`** and click **Load**.

---

## 🧪 Testing Your Audio

We included an automated frequency test suite to verify your audio:

```bash
./audio-test.sh
```

This runs:
- Sweep tone (100 Hz → 15,000 Hz)
- 142 Hz bass resonance test
- 220 Hz & 338 Hz low-mid stress test
- 1000 Hz baseline reference
- High treble harshness check (10.7 kHz & 16.5 kHz)
- Pink noise tonal balance
- Left/Right stereo channel test

---

## 💻 Hardware & Distro Compatibility

| Laptop Model | Audio Codec | Linux Distros Tested | Status | Notes |
| :--- | :--- | :--- | :---: | :--- |
| **HP 14s-fq2003au** | Realtek ALC236 | Fedora 41, Arch Linux | 🌟 Verified | Primary development device |
| **HP 14s-fqxxxx** (other models) | Realtek ALC236 | Any Linux | 🟢 Compatible | Same chassis & speakers |
| **HP 14s-dqxxxx** / **14s-dkxxxx** | Realtek ALC236 / ALC269 | Any Linux | 🟡 Needs Testing | [Submit Test Report](https://github.com/candraalief/hp-14s-fq2003au-easyeffects/issues/new?template=device_report.yml) |
| **HP Pavilion 14** / **HP 240 G8** | Realtek | Any Linux | 🟡 Needs Testing | [Submit Test Report](https://github.com/candraalief/hp-14s-fq2003au-easyeffects/issues/new?template=device_report.yml) |

> 📢 **Have another HP laptop model?** Help us expand this table! Submit your test results via the [Device Compatibility Issue Form](https://github.com/candraalief/hp-14s-fq2003au-easyeffects/issues/new?template=device_report.yml).

---

## 🤝 Community & Contributing

We welcome contributions from the community! You can contribute by:
- 🧪 **Testing on different HP laptops** and submitting compatibility reports.
- 🎛️ **Adding new presets** (e.g., Cinema/Movie, Podcast/Voice, Bass Boost, or model-specific tunings) in `community-presets/`.
- 🎼 **Sharing Impulse Response (.irs) kernels**.
- 🛠️ **Improving scripts and audio testing tools**.

Please read our [**Contributing Guide (CONTRIBUTING.md)**](CONTRIBUTING.md) and [**Code of Conduct**](CODE_OF_CONDUCT.md) before submitting a Pull Request.

---

## ⚙️ Best Practices & Troubleshooting

1. **Keep Physical Speaker as Default Sink:**
   Never set the virtual `easyeffects_sink` as your system's default device. Your physical laptop speaker should always be the default sink. EasyEffects will automatically hook into application streams.
   ```bash
   pactl set-default-sink alsa_output.pci-0000_03_00.6.HiFi__Speaker__sink
   ```
2. **HDMI Display Audio:**
   If you connect an external HDMI monitor without speakers, disable the HDMI audio profile in System Settings → Audio (or set it to `Off`) so it doesn't hijack audio output.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Developed with ❤️ by **[Candra AAP](https://github.com/candraalief)** and community contributors.
