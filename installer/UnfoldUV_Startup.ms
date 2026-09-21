/* Unfold UV startup macro registration. */
try
(
    local mcrPath = (getDir #scripts) + "\\UnfoldUV\\Unfold_UV.mcr"
    if doesFileExist mcrPath do fileIn mcrPath
)
catch()
