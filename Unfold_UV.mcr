/*
    Unfold UV - macro registration / launcher only.

    Installed runtime locations supported:
      <3ds Max scripts>\UnfoldUV\Unfold_UV.mse   (protected release)
      <3ds Max scripts>\UnfoldUV\Unfold_UV.ms    (development build)

    The MSE is preferred when both are present.
*/

macroScript UnfoldUV
category:"Unfold UV"
tooltip:"Unfold UV"
buttonText:"Unfold UV"
autoUndoEnabled:false
(
    local opener = undefined
    try(opener = RotateUV_Open)catch(opener = undefined)

    if opener == undefined do
    (
        local candidates = #()
        try(append candidates ((getDir #scripts) + "\\UnfoldUV\\Unfold_UV.mse"))catch()
        try(append candidates ((getDir #scripts) + "\\UnfoldUV\\Unfold_UV.ms"))catch()
        try(append candidates ((getDir #userScripts) + "\\UnfoldUV\\Unfold_UV.mse"))catch()
        try(append candidates ((getDir #userScripts) + "\\UnfoldUV\\Unfold_UV.ms"))catch()
        try(append candidates ((getDir #scripts) + "\\Unfold_UV.mse"))catch()
        try(append candidates ((getDir #scripts) + "\\Unfold_UV.ms"))catch()

        local loaded = false
        for c in candidates while not loaded do
        (
            if c != undefined and doesFileExist c do
            (
                try(fileIn c; loaded = true)catch(loaded = false)
            )
        )
        try(opener = RotateUV_Open)catch(opener = undefined)

        if opener == undefined do
        (
            messageBox "Unfold UV was not found on the 3ds Max script path.\n\nReinstall Unfold_UV_2026.mzp, or place Unfold_UV.mse/.ms in <scripts>\\UnfoldUV." title:"Unfold UV"
        )
    )

    if opener != undefined do opener()
)
