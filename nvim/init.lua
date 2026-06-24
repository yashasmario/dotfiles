vim.g.mapleader = " "

-- highlighting when yanking so you know you yanked (idk i stole it from lazy)
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking',
    group = vim.api.nvim_create_augroup('kickstart-highlighting-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.guicursor = {
    "n-v-c:block",
    "i:block-blinkwait250-blinkon250-blinkoff250",
    "r-cr:hor20",
}

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false


-- you can use undo tree from the past(days)
vim.opt.swapfile = false
vim.opt.backup = false
local home = os.getenv("HOME") or os.getenv("USERPROFILE")
vim.opt.undodir = home .. "/.vim/undodir" 
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 10
vim.opt.colorcolumn = "100"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>cc", "mcggVG\"+y`c")

vim.o.statuscolumn = "%s%=%{v:relnum == 0 ? v:lnum : v:relnum}  "

-- bootstrapper
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = "\\"

require("lazy").setup("plugins")

vim.cmd[[colorscheme monoglow-z]]

vim.lsp.enable({'pyright', 'lua_ls', 'clangd', 'zls', 'ts_ls', 'gopls', 'tinymist', 'rust_analyzer'})

vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- or "■", "▎", etc
    },
    float = {
        border = "rounded",
    },
    update_in_insert = false,
})
