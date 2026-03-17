return {
  -- This is usually the main colorscheme used in Omarchy forks
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      -- Try to read current Omarchy theme from symlink/file
      local theme_file = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
      local colorscheme = "catppuccin-mocha"   -- fallback

      if vim.fn.filereadable(theme_file) == 1 then
        -- Very simple parsing – adjust depending on real format
        local lines = vim.fn.readfile(theme_file)
        for _, line in ipairs(lines) do
          if line:match("catppuccin%-frappe") then
            colorscheme = "catppuccin-frappe"
            break
          elseif line:match("catppuccin%-macchiato") then
            colorscheme = "catppuccin-macchiato"
            break
          elseif line:match("catppuccin%-latte") then
            colorscheme = "catppuccin-latte"
            break
          end
        end
      end

      vim.cmd.colorscheme(colorscheme)
    end,
  },
}
