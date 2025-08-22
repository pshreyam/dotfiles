return {
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
              virt_text = true,
              virt_text_pos = "eol",
              delay = 1000, -- milliseconds
              ignore_whitespace = false,
              virt_text_priority = 100,
              use_focus = true,
            },
            current_line_blame_formatter = "\t\t<author>, <author_time:%R> - <summary>",
            on_attach = function(bufnr)
              local gs = package.loaded.gitsigns
              local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
              end
              map("n", "<leader>gbl", gs.blame_line, "Blame Line")
              map("n", "<leader>gbf", gs.blame, "Blame Buffer")
              map("n", "<leader>hi", gs.preview_hunk_inline, "Preview Hunk Inline")
            end,
        },
    },
}

