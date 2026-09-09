return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        handlers = {
          function(server_name) lspconfig[server_name].setup({}) end,
        },
      })
    end
  },
}
