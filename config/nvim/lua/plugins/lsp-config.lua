return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      local lspconfig = require("lspconfig")

      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        cmd = { "/home/typecraft/.asdf/shims/ruby-lsp" }
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      local lspconfig = require('lspconfig')

      -- Configure pyright
      lspconfig.pyright.setup({
          on_attach = function(client, bufnr)
              -- Key mappings for LSP-related functions
              local opts = { noremap = true, silent = true }
              local buf_set_keymap = vim.api.nvim_buf_set_keymap

              buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
              buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
              buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
              buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
              buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          end,
          capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Optional: for autocompletion
          settings = {
              python = {
                  analysis = {
                      typeCheckingMode = "basic", -- Options: off, basic, strict
                      autoSearchPaths = true,
                      useLibraryCodeForTypes = true,
                  },
              },
          },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end,
  },
}
