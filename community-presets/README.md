# 🌐 Community Presets Directory

This directory is dedicated to alternative audio presets created and tested by the community!

## 📁 File Structure
Place your preset `.json` files here using the following convention:
```
community-presets/
├── <Model>-<ProfileName>.json
└── ...
```

Example:
- `HP-14s-DQxxxx-Cinema.json`
- `HP-Pavilion-14-WarmBass.json`

## 🎛️ How to Contribute Your Preset
1. Check the [Contribution Guidelines](../CONTRIBUTING.md).
2. Ensure your preset has a **Peak Limiter** enabled to prevent speaker damage.
3. Test your preset thoroughly using `../audio-test.sh`.
4. If your preset relies on a Convolver `.irs` kernel, place the kernel file in the `irs/` directory.
5. Open a Pull Request on GitHub!
