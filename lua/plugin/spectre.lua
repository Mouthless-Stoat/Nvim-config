return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        open_cmd = "noswapfile bot new",
        mapping = {
            replace_cmd = { map = "<Nop>" },
            send_to_qf = { map = "<Nop>" },
            show_option_menu = {
                map = "<Leader>So",
                cmd = "<cmd>lua require('spectre').show_options()<CR>",
                desc = "[S]pectre [o]ptions",
            },
            run_current_replace = {
                map = "<Leader>Sr",
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                desc = "[S]pectre [r]eplace current line",
            },
            run_replace = {
                map = "<Leader>SR",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                desc = "[S]pectre [R]eplace all",
            },
            change_view_mode = { map = "<Nop>" },
            change_replace_sed = { map = "<Nop>" },
            change_replace_oxi = { map = "<Nop>" },
            toggle_ignore_case = {
                map = "<Leader>Sc",
                cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                desc = "[S]pectre toggle ignore [c]ase",
            },
            toggle_live_update = {
                map = "<Leader>Su",
                cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                desc = "[S]pectre toggle live [u]pdate",
            },
            resume_last_search = {
                map = "<Leader>Sl",
                cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
                desc = "[S]pectre resume [l]ast search",
            },

            toggleSpectre = {
                map = "<C-s>",
                cmd = "<cmd>lua require('spectre').toggle()<CR>",
                desc = "Toggle Spectre",
            },
        },
    },
    keys = {
        {
            "<Leader>S",
            function()
                require("spectre").toggle()
            end,
            desc = "Toggle [S]pectre",
        },
    },
}
