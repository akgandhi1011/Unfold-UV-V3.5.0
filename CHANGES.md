# Unfold UV - Changes

## V3.5.0

- Product/display name changed to **Unfold UV**.
- Added complete drag-and-drop `.mzp` installer pipeline.
- MZP installs runtime under the 3ds Max system scripts folder in `UnfoldUV`.
- Added startup MacroScript registration loader.
- Added `Unfold_UV.mcr` launcher that prefers encrypted `Unfold_UV.mse` over development `Unfold_UV.ms`.
- Added `Encrypt_Unfold_UV.ms` helper for Autodesk MAXScript encryption.
- GitHub Actions now creates a DEV MZP automatically and a protected release MZP whenever `Unfold_UV.mse` is present.
- Removed duplicate embedded MacroScript registration / development auto-open from the main `.ms`; registration is owned by the `.mcr`.
- AutoSeam C++ algorithm is unchanged from V3.4 worker source.
- UV tool functions and UI layout are otherwise retained from V3.4.3.
