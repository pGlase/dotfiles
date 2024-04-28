local lsp_zero = require("lsp-zero")
lsp_zero.preset('recommended')
lsp_zero.setup()
lsp_zero.ensure_installed({"clangd"})
require('lspconfig').clangd.setup{}
--[[
    for cross-compilers, we need to do:
        1) provide compile_commands.json via Ninja or make
            'cmake -G ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=1 (...) ..'
        2) Create a symlink to the root dir for the compile_commands
            ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
        3) Might tell clangd to NOT use the system compiler/STL headers, but our cross-compiler(s) with
            --query-driver=/path/to/mygcc
--]]