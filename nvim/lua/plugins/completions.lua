return {
  -- Plugin para integración LSP con nvim-cmp
  { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help" },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Configuration principal de nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      --vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#FF0000" })

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            max_width = 50,
            --[[
            before = function(entry, vim_item) -- for tailwind css autocomplete
              if vim_item.kind == "Color" and entry.completion_item.documentation then
                local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
                if r then
                  local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
                  local group = "Tw_" .. color
                  if vim.fn.hlID(group) < 1 then
                    vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
                  end
                  vim_item.kind = "⬤"
                  vim_item.kind_hl_group = group
                  return vim_item
                end
              end
              vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
              return vim_item
            end,
            --]]
          }),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Integración de expansión de snippets con LuaSnip
          end,
        },
        window = {
          --completion = cmp.config.window.bordered(), -- Opcional: Ventanas con bordes para el autocompletado
          --documentation = cmp.config.window.bordered(), -- Opcional: Ventanas con bordes para la documentación
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Acepta la sugerencia al presionar Enter
        }),
        sources = cmp.config.sources({
          { name = "copilot", group_index = 2 },
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- Usar LuaSnip como fuente para el autocompletado
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
