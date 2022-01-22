hook global WinSetOption filetype=lua %{
    hook window BufWritePre .* format
}

hook global WinSetOption filetype=(factorio-changelog|ini) %{
    hook window BufWritePost .* spell
}
