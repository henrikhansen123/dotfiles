vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.linebreak = true
vim.opt.visualbell = true
vim.opt.shortmess:append("I")
vim.cmd.colorscheme("evening")

-- Recursive search
vim.opt.path:append("**")

-- Display all matching files when tab-completing
vim.opt.wildmenu = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Keymaps
vim.keymap.set("n", "[b", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { silent = true })

vim.keymap.set("n", "<leader>l", ":ls<CR>:b ")

vim.keymap.set("n", "<leader>cl", ":!pdflatex ")
vim.keymap.set("n", "<leader>pd", ":!pdflatex main<CR>")

-- Shell
vim.opt.shell = "C:/PROGRA~1/Git/bin/bash.exe"
vim.opt.shellcmdflag = "-c"
vim.opt.shellxquote = ""

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-fugitive",
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "sioyek"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    },

    -- Quarto
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
        },
        opts = {
            lspFeatures = {
                enabled = true,
                languages = { "r", "python" },
                diagnostics = { enabled = true, triggers = { "BufWritePost" } },
                completion = { enabled = true },
            },
            codeRunner = {
                enabled = true,
                default_method = "slime",
            },
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("pyright", {})
            vim.lsp.config("r_language_server", {})
            vim.lsp.enable("pyright")
            vim.lsp.enable("r_language_server")
        end,
    },

    -- Completion menu
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = { { name = "nvim_lsp" } },
            })
        end,
    },

    -- Code runner
    {
        "jpalardy/vim-slime",
        init = function()
            vim.g.slime_target = "neovim"
            vim.g.slime_no_mappings = true
        end,
    },

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	}
})

-- Vimtex settings
vim.g.vimtex_quickfix_open_on_warning = 0

-- Quarto keymaps
local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })


-- Be able to use clipboard
vim.opt.clipboard = "unnamedplus"
