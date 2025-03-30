---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- config.debug = true
    config.sources = {
      --   null_ls.builtins.diagnostics.mypy.with {
      --     -- args = function(params)
      --     --   return {
      --     --     "--hide-error-codes",
      --     --     "--hide-error-context",
      --     --     "--no-color-output",
      --     --     "--show-absolute-path",
      --     --     "--show-column-numbers",
      --     --     "--show-error-codes",
      --     --     "--no-error-summary",
      --     --     "--no-pretty",
      --     --     params.temp_path,
      --     --   }
      --     -- end,
      --     prefer_local = function() return os.getenv "VIRTUAL_ENV" end,
      --     extra_args = function()
      --       -- local python_path = os.getenv "VIRTUAL_ENV" or "/usr"
      --       -- local current_dir = vim.fn.getcwd()
      --       -- local pyproject_path = current_dir .. "/pyproject.toml"
      --       local pyproject_path = "./pyproject.toml"
      --
      --       local args = {
      --         --   "--python-executable",
      --         --   python_path .. "/bin/python3",
      --       }
      --
      --       if vim.fn.filereadable(pyproject_path) == 1 then
      --         table.insert(args, "--config-file")
      --         table.insert(args, pyproject_path)
      --       end
      --
      --       return args
      --     end,
      --     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      --   },
    }
    return config -- return final config table
  end,
}
