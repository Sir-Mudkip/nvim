local HEADERS = {
  neovim = [[
████ ██████           █████      ██   
               ███████████             █████                            
               █████████ ███████████████████ ███   ███████████  
              █████████  ███    █████████████ █████ ██████████████  
             █████████ ██████████ █████████ █████ █████ ████ █████  
           ███████████ ███    ███ █████████ █████ █████ ████ █████ 
          ██████  █████████████████████ ████ █████ █████ ████ ██████

 ]],
}
-- Dashboard configuration and startup screen customization
-- Contains Snacks.nvim dashboard setup with UpHill Solutions branding and custom theming
return {
  -- Snacks: Multi-purpose UI and utility plugin with dashboard and word highlighting
  -- Custom dashboard with UpHill Solutions branding and enhanced word navigation
  {
    "folke/snacks.nvim",
    opts = {
      ---@class snacks.dashboard.Config
      dashboard = {
        sections = {
          ---@diagnostic disable-next-line: assign-type-mismatch
          { padding = 1, align = "center", text = { HEADERS.neovim, hl = "header" } },
          ---@diagnostic disable-next-line: assign-type-mismatch
          { padding = 2, align = "center", hl = "Identifier" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      words = { enabled = true },
      styles = {
        snacks_image = {
          relative = "editor",
          col = -1,
        },
      },
      image = {
        enabled = true,
        force = true,
        doc = {
          enabled = true,
          inline = false,
          float = true,
          max_width = 100,
          max_height = 60,
          win_config = function(width, height)
            return {
              relative = "editor",
              style = "minimal",
              border = "rounded",
              row = vim.o.lines - height - 1,
              col = vim.o.columns - width - 1,
              width = width,
              height = height,
            }
          end,
        },
        img_dirs = {
          vim.fn.expand("~") .. "/Documents/Pentesting Notes/Pasted Images",
          vim.fn.expand("~") .. "/Documents/Pentesting Notes",
        },
        resolve = function(file, src)
          local absolute_paths = {
            vim.fn.expand("~") .. "/Documents/Pentesting Notes/Pasted Images/" .. vim.fn.fnamemodify(src, ":t"),
            vim.fn.expand("~") .. "/Documents/Pentesting Notes/" .. vim.fn.fnamemodify(src, ":t"),
            vim.fn.expand("~") .. "/Pictures/Screenshots/" .. vim.fn.fnamemodify(src, ":t"),
          }
          for _, path in ipairs(absolute_paths) do
            if vim.fn.filereadable(path) == 1 then
              return path
            end
          end
          return nil
        end,
      },
    },
  },
}
