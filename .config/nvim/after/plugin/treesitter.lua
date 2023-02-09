require('nvim-treesitter.configs').setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        'python', 'rust', 'lua', 'help',
        'cpp', 'c', 'css', 'html', 'json',
        'javascript', 'bash'
    },

    indent = {
        enable = false
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    auto_install = true,

    -- List of parsers to ignore installing
    ignore_install = {},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
