-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "pyright",
        "ruff_lsp",
      })
      opts.handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
          require("astronvim.utils.lsp").setup(server_name)
        end,
        --
        ["ruff_lsp"] = function()
          require("lspconfig").ruff_lsp.setup {
            init_options = {
              settings = {
                args = {
                  "--extend-select=W",
                },
              },
            },
            on_attach = function(client, bufnr)
              -- disable hover in favor of pyright
              client.server_capabilities.hoverprovider = false
            end,
          }
        end,
      }
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
