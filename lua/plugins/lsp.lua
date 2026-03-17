return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ruby LSP
        solargraph = {
          cmd = { "solargraph", "stdio" },
          filetypes = { "ruby" },
          settings = {
            solargraph = {
              diagnostics = true,
              completion = true,
              hover = true,
              formatting = true,
            },
          },
        },
        -- C/C++ LSP
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--query-driver=/usr/bin/g++",
            "--all-scopes-completion",
            "--completion-style=detailed",
          },
          filetypes = { "c", "cpp" },
        },
        -- Python LSP
        pylsp = {
          cmd = { vim.fn.expand("$HOME") .. "/.local/bin/pylsp" },
          settings = {
            pylsp = {
              plugins = {
                pyright = { enable = true },
                pycodestyle = { enabled = true },
                rope_fold = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
