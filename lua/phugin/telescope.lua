return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<Leader>sf", "<cmd>Telescope find_files hidden=true<CR>", desc = "Search Files"}
    }
}