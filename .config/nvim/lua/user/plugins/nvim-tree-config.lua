require("nvim-tree").setup{
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
}
