local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
    capabilities = lsp_capabilities,
    cmd = {
    --check man for clangd for more options
    "clangd",
    --[[
    This is for automatic header "completion" after running format.
    e.g. you're using std::cout, but have not explicitly included <iostream> in this file
    "--header-insertion=never",
    --]]
    "--header-insertion=iwyu",
    --[[ comma seperated list of gcc-like drivers for system includes.
        If std-headers are missing or you're using cross-compilers,
        add their paths here.
    --]]
    "--query-driver=/usr/bin/c++,",

    "--all-scopes-completion",

    -- offer more completion options to cmp_nvim
    "--completion-style=detailed",
    "--suggest-missing-includes",
    "--function-arg-placeholders",
    "--clang-tidy",
    },
})

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
