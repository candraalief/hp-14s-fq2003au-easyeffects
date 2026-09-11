# Contributing to HP EasyEffects Audio Presets 🎧

Thank you for your interest in improving the audio experience on HP laptops running Linux! Community contributions are what make this project better for everyone.

---

## 🌟 Ways You Can Contribute

1. **Submit Device Compatibility Reports:**
   - Test this preset on other HP laptop models (e.g., HP 14s-dq, HP 14s-dk, HP 14s-em, HP Pavilion, HP Victus, HP Envy) and different Linux distributions (Fedora, Arch, Ubuntu, Debian, openSUSE, etc.).
   - Let us know if it works well or needs adjustments via the **Device Compatibility** issue template.

2. **Submit Alternative / New Presets:**
   - Create sound profiles tailored for different purposes (e.g., *Cinema / Movie*, *Podcast / Vocal*, *High Bass*, or *Flat / Audiophile*).
   - Submit presets tuned specifically for other HP models into `community-presets/`.

3. **Share Impulse Response (.irs / .wav) Kernels:**
   - If you found or measured a high-quality impulse response for laptop speakers, share it along with source attribution.

4. **Improve Tooling & Scripts:**
   - Enhance `install.sh`, create uninstallers, or expand `audio-test.sh`.

5. **Fix Bugs or Improve Documentation:**
   - Report audio clipping, distortion, or configuration issues.
   - Improve setup guides, translations, or troubleshooting tips.

---

## 🛠️ Contribution Guidelines for Presets

To ensure every user gets a safe, pleasant, and rattle-free listening experience, all submitted presets must follow these guidelines:

### 1. Zero Clipping & Speaker Protection
- Laptop speakers are delicate. Any preset submitted **must not** produce digital clipping or severe speaker bottom-out at 100% system volume.
- Always include a **Peak Limiter** at the end of the processing chain (recommended threshold: `-0.5 dB` to `-1.0 dB`).
- Filter out sub-bass frequencies below 70–80 Hz with a High-Pass filter to prevent violent chassis vibration.

### 2. Audio Testing Requirement
- Before submitting a preset, verify it by running the automated frequency test suite:
  ```bash
  ./audio-test.sh
  ```
- Listen carefully across the frequency sweep (100 Hz to 15,000 Hz) to ensure no buzzing, clicking, or harsh distortion.

### 3. File Naming Conventions
- Put community presets in the `community-presets/` folder.
- Follow the naming format: `<Model>-<ProfileName>.json`
  - Examples:
    - `community-presets/HP-14s-DQxxxx-Cinema.json`
    - `community-presets/HP-Pavilion-14-WarmBass.json`
- If your preset requires an Impulse Response (`.irs` / `.wav`), place the kernel in `irs/` and reference it accurately in the JSON file.

### 4. Attribution & License
- If you use an impulse response kernel or tuning curve made by another creator, provide credit and link to the source in the preset metadata or documentation.
- All contributions are licensed under the [MIT License](LICENSE).

---

## 🚀 How to Submit a Pull Request

1. **Fork the repository** on GitHub.
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/<your-username>/hp-14s-fq2003au-easyeffects.git
   cd hp-14s-fq2003au-easyeffects
   ```
3. **Create a new branch**:
   ```bash
   git checkout -b preset/my-new-tuning
   ```
4. **Export your preset from EasyEffects**:
   - In EasyEffects: Go to **Presets** → **Output** → Click save icon or copy from `~/.local/share/easyeffects/output/<your-preset>.json`.
5. **Add your files**:
   - Place preset JSON into `community-presets/`.
   - Place any custom `.irs` into `irs/`.
6. **Commit and push**:
   ```bash
   git add .
   git commit -m "feat(preset): add HP 14s Cinema preset by @your-username"
   git push origin preset/my-new-tuning
   ```
7. **Open a Pull Request** using the provided PR template.

---

## 💬 Discussions & Questions
Have ideas, questions, or want to discuss DSP tuning curves? Feel free to open an Issue or Discussion. We're excited to build the best Linux audio experience for HP laptops together!
