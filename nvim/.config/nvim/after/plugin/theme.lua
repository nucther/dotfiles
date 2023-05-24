require("tokyonight").setup({
    style = "storm",
    light_style = "day",
    transparent = true,
})


vim.cmd.colorscheme("tokyonight")


require("lualine").setup({
    sections = {
        lualine_a = {'buffers'},
        lualine_b = {'mode'},
        lualine_c = {},
        lualine_x = {'diff','branch'},
        lualine_y = {'filetype'},
        luanine_z = {}
    }
})
