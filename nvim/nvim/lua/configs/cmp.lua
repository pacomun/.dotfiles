--@diagnostic disable: missing-fields
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local M = {}

function M.setup()
    -- REQUIRED - you must spedify a snippet engine.
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.choice_active() then
                    luasnip.change.choice(1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping.select_prev_item(),

            ["<C-y>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },

            ["<c-space>"] = cmp.mapping.complete(),
        },

        sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
        },
    })

    cmp.even:on("confirm_done", cmp_autopairs.on_confirm_done {map_char = { tex = "" }})

    --Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the 'git' sources if [you were installed it](https://github.com/...)
        }, {
                { name = 'buffer' },
        })
    })

    -- require("cmp_git").setup()

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
    })


end

return M
