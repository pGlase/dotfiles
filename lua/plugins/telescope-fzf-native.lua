--note: I seem to misunderstand something about Lazy.vim
--After loading, execute 
--:Lazy build telescope-fzf-native
return {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim'},
}