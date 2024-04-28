return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    config = function()
        require "configs.telescope"
    end, 
        dependencies = { 'nvim-lua/plenary.nvim' },
    }
