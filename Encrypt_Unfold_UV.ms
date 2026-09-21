/*
    Unfold UV - one-time release encryption helper.

    Run this file INSIDE 3ds Max from the repository root.
    It encrypts Unfold_UV.ms with Autodesk MAXScript encryption and creates
    Unfold_UV.mse beside it. Upload/commit the .mse when you want GitHub
    Actions to produce the protected release MZP.
*/
(
    local thisFile = getSourceFileName()
    local root = if thisFile != undefined and thisFile != "" then getFilenamePath thisFile else ""
    local src = root + "Unfold_UV.ms"
    local out = root + "Unfold_UV.mse"

    if root == "" then
    (
        messageBox "Could not determine the repository folder. Save this script to the repository root and run it again." title:"Unfold UV Encryption"
    )
    else if not doesFileExist src then
    (
        messageBox ("Unfold_UV.ms was not found:\n\n" + src) title:"Unfold UV Encryption"
    )
    else
    (
        try
        (
            if doesFileExist out do deleteFile out
            encryptScript src version:1
            if doesFileExist out then
            (
                messageBox (
                    "Encryption complete.\n\nCreated:\n" + out +
                    "\n\nKeep Unfold_UV.ms private. The protected MZP will distribute Unfold_UV.mse instead."
                ) title:"Unfold UV Encryption"
            )
            else
            (
                messageBox "3ds Max did not create Unfold_UV.mse. Check the MAXScript Listener for the encryption error." title:"Unfold UV Encryption"
            )
        )
        catch
        (
            messageBox ("Encryption failed.\n\n" + getCurrentException()) title:"Unfold UV Encryption"
        )
    )
)
