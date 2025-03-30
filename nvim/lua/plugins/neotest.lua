if true then return {} end
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  output = {
    enter = true,
  },
  keys = {
    {
      "<leader>tr",
      function() require("neotest").run.run() end,
      desc = "Run test",
    },
    {
      "<leader>tR",
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "Run all tests",
    },
    {
      "<leader>tl",
      function() require("neotest").run.run_last() end,
      desc = "Run last test",
    },
    {
      "<leader>tS",
      function() require("neotest").run.stop() end,
      desc = "Stop test",
    },
    {
      "<leader>ts",
      function() require("neotest").summary.toggle() end,
      desc = "Toggle test summary panel",
    },
    {
      "<leader>to",
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle test output panel",
    },
    {
      "<leader>tp",
      function() require("neotest").output.open { enter = true } end,
      desc = "Peek test",
    },
    {
      "[n",
      function() require("neotest").jump.prev { status = "failed" } end,
      desc = "Previous failed test",
    },
    {
      "]n",
      function() require("neotest").jump.next { status = "failed" } end,
      desc = "Next failed test",
    },
  },
}
