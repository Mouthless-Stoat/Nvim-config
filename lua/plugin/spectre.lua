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
                map = "<leader>So",
                cmd = "<cmd>lua require('spectre').show_options()<CR>",
                desc = "[S]pectre [o]ptions",
            },
            run_current_replace = {
                map = "<leader>Sr",
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                desc = "[S]pectre [r]eplace current line",
            },
            run_replace = {
                map = "<leader>SR",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                desc = "[S]pectre [R]eplace all",
            },
            change_view_mode = { map = "<Nop>" },
            change_replace_sed = { map = "<Nop>" },
            change_replace_oxi = { map = "<Nop>" },
            toggle_ignore_case = {
                map = "<leader>Sc",
                cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                desc = "[S]pectre toggle ignore [c]ase",
            },
            toggle_live_update = {
                map = "<leader>Su",
                cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                desc = "[S]pectre toggle live [u]pdate",
            },
            resume_last_search = {
                map = "<leader>Sl",
                cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
                desc = "[S]pectre resume [l]ast search",
            },

            toggleSpectre = {
                map = "<leader>SS",
                cmd = "<cmd>lua require('spectre').toggle()<CR>",
            },
        },
    },
    keys = {
        {
            "<leader>S",
            function()
                require("spectre").toggle()
            end,
            desc = "Replace in files (Spectre)",
        },
    },
}
