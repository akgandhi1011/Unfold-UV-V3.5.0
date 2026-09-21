# Unfold UV V3.5.0

Professional UV utility for Autodesk 3ds Max 2026.

## Runtime architecture

- `Unfold_UV.mse` or `Unfold_UV.ms` - 3ds Max UI and UV operations
- `Unfold_UV.mcr` - MacroScript launcher / Customize User Interface action
- `RotateUV_AutoSeam.exe` - compiled automatic seam planner
- `RotateUV_AlignBounds.png` + `RotateUV_AlignBounds_Mask.png` - alignment button icons
- 3ds Max native Unfold3D - performs the UV solve

There is only one external worker EXE.

## Drag-and-drop MZP installation

GitHub Actions produces an MZP installer.

Drag `Unfold_UV_2026.mzp` onto a 3ds Max 2026 viewport. The package installs the runtime to:

`<3ds Max system scripts>\UnfoldUV\`

With a default 3ds Max 2026 installation this is normally:

`C:\Program Files\Autodesk\3ds Max 2026\scripts\UnfoldUV\`

A small startup loader is also installed to:

`C:\Program Files\Autodesk\3ds Max 2026\scripts\Startup\UnfoldUV_Startup.ms`

Because `Program Files` is Windows-protected, the first installation may require starting 3ds Max with **Run as administrator**. After installation, normal use does not require administrator rights.

The tool registers under:

`Customize User Interface > Category: Unfold UV`

## Protected release (.mse)

Autodesk's supported MAXScript source-protection format is `.mse`.

1. Keep this source repository private.
2. Clone/download it to a machine with 3ds Max 2026.
3. In 3ds Max choose `Scripting > Run Script` and run `Encrypt_Unfold_UV.ms` from the repository root.
4. 3ds Max creates `Unfold_UV.mse` beside `Unfold_UV.ms`.
5. Add `Unfold_UV.mse` to the repository/release input and run the GitHub workflow again.
6. GitHub produces `Unfold_UV_2026.mzp` containing the encrypted `.mse`, not the editable `.ms`.

The workflow also produces `Unfold_UV_2026_DEV.mzp` for internal testing. The DEV package contains the plain `.ms` and should not be distributed when source protection matters.

### Important protection note

`.mse` hides MAXScript source from normal editing, while the seam algorithm is already compiled into the C++ EXE. It is source protection, not an absolute anti-reverse-engineering guarantee. If this GitHub repository is public, the plain `.ms` and `.cpp` source are public regardless of MZP encryption. Use a **private repository** for proprietary code.

## GitHub build

Open:

`Actions > Build Unfold UV V3.5.0 > Run workflow`

The artifact is:

`Unfold-UV-V3.5.0-Windows`

It contains:

- `Unfold_UV_2026_DEV.mzp` always
- `Unfold_UV_2026.mzp` when `Unfold_UV.mse` exists
- README / change notes

## Source files

- `src/autoseam_worker.cpp` - AutoSeam worker source
- `Unfold_UV.ms` - editable development source
- `Unfold_UV.mcr` - MacroScript launcher
- `Encrypt_Unfold_UV.ms` - one-time encryption helper to run inside 3ds Max
- `installer/` - MZP installation control files
- `.github/workflows/build-windows.yml` - Windows EXE + MZP builder

