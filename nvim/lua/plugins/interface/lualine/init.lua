M = {}
M.load = function ()
    require('lualine').setup {
        sections = {
            lualine_a = {
                {
                    'fileformat',
                    symbols = {
                        unix = '', -- e712
                        dos = '',  -- e70f
                        mac = '',  -- e711
                    }
                },
                'mode'
            },
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        }
    }
end

return M
