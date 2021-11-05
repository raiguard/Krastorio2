hook global WinSetOption filetype=lua %{
    hook window BufWritePre .* format
}
