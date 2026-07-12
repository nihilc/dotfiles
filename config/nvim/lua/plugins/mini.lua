return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    --- Mini
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.icons").setup()
    require("mini.notify").setup()

    --- Mini Diff
    local MiniDiff = require("mini.diff")
    MiniDiff.setup({ view = { style = "sign" } })
    vim.keymap.set("n", "<leader>gp", MiniDiff.toggle_overlay, { desc = "Git Overlay Preview" })
    vim.keymap.set("n", "<leader>ga", "ghgh", { remap = true, desc = "Git Apply Hunk" })
    vim.keymap.set("n", "<leader>gr", "gHgh", { remap = true, desc = "Git Reset Hunk" })
    vim.keymap.set("x", "<leader>ga", "gh", { remap = true, desc = "Git Apply Hunk" })
    vim.keymap.set("x", "<leader>gr", "gH", { remap = true, desc = "Git Reset Hunk" })

    --- Mini Files
    local MiniFiles = require("mini.files")
    MiniFiles.setup({
      options = { permanent_delete = false },
      windows = { preview = false, width_preview = 100 },
    })
    -- Keymaps
    vim.keymap.set("n", "<leader>e", function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
      MiniFiles.reveal_cwd()
    end, { desc = "Explorer (current file)" })
    vim.keymap.set("n", "<leader>E", function()
      MiniFiles.open(nil, false)
    end, { desc = "Explorer (cwd)" })
    -- Local Keymaps
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(e)
        local buf = e.data.buf_id
        vim.keymap.set("n", "<tab>", function()
          MiniFiles.config.windows.preview = not MiniFiles.config.windows.preview
          MiniFiles.refresh({ windows = { preview = MiniFiles.config.windows.preview } })
        end, { desc = "Toggle Preview", buf = buf })
        vim.keymap.set("n", "gx", function()
          vim.ui.open(MiniFiles.get_fs_entry().path)
        end, { desc = "Open File (OS)", buf = buf })
        vim.keymap.set("n", "<leader>yy", function()
          local file_path = MiniFiles.get_fs_entry().path
          if file_path == nil then
            vim.notify("no file or directory selected", vim.log.levels.WARN)
            return
          end
          local cmd = string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.shellescape(file_path))
          local result = vim.fn.system(cmd)
          if vim.v.shell_error ~= 0 then
            vim.notify("failed to copy: " .. result, vim.log.levels.ERROR)
            return
          end
          vim.notify(vim.fn.fnamemodify(file_path, ":t"), vim.log.levels.INFO)
          vim.notify("copied file to system clipboard", vim.log.levels.INFO)
        end, { desc = "Copy File to Clipboard", buf = buf })
        vim.keymap.set("n", "<leader>yp", function()
          local file_path = MiniFiles.get_fs_entry().path
          if file_path == nil then
            vim.notify("No file or directory selected", vim.log.levels.WARN)
            return
          end
          local cmd = string.format("wl-copy '%s'", vim.fn.shellescape(file_path))
          local result = vim.fn.system(cmd)
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to copy: " .. result, vim.log.levels.ERROR)
            return
          end
          vim.notify(file_path, vim.log.levels.INFO)
          vim.notify("Copied file path to system clipboard", vim.log.levels.INFO)
        end, { desc = "Copy Path to Clipboard", buf = buf })
        vim.keymap.set("n", "<leader>yz", function()
          local file_path = MiniFiles.get_fs_entry().path
          if file_path == nil then
            vim.notify("No file or directory selected", vim.log.levels.WARN)
            return
          end
          local file_name = vim.fn.fnamemodify(file_path, ":t")
          local file_parent_dir = vim.fn.fnamemodify(file_path, ":h")
          local zip_path = string.format("/tmp/%s_%s.zip", file_name, os.date("%Y%m%d_%H%M%S"))
          -- Create zip file
          local zip_cmd = string.format(
            "cd %s && zip -r %s %s",
            vim.fn.shellescape(file_parent_dir),
            vim.fn.shellescape(zip_path),
            vim.fn.shellescape(file_name)
          )
          local zip_result = vim.fn.system(zip_cmd)
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to create zip file: " .. zip_result, vim.log.levels.ERROR)
            return
          end
          -- Copy zip to clipboard
          local copy_cmd = string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.shellescape(zip_path))
          local copy_result = vim.fn.system(copy_cmd)
          if vim.v.shell_error ~= 0 then
            vim.notify("Failed to copy zip file to clipboard: " .. copy_result, vim.log.levels.ERROR)
            return
          end
          vim.notify(zip_path, vim.log.levels.INFO)
          vim.notify("Zipped and copied to clipboard: ", vim.log.levels.INFO)
        end, { desc = "Copy Zipped to Clipboard", buf = buf })
      end,
    })

    --- Mini Picker
    local MiniPick = require("mini.pick")
    local MiniExtra = require("mini.extra")
    MiniPick.setup()
    MiniExtra.setup()
    -- Files
    vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { desc = "Find Grep Live" })
    -- Help
    vim.keymap.set("n", "<leader>ht", MiniPick.builtin.help, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>hk", MiniExtra.pickers.keymaps, { desc = "Help Keymaps" })
    -- lsp, diagnostic
    vim.keymap.set("n", "<leader>d", MiniExtra.pickers.diagnostic, { desc = "Diagnostics" })
    vim.keymap.set("n", "grR", function()
      MiniExtra.pickers.lsp({ scope = "references" })
    end, { desc = "Lsp References (mini.pick)" })
    vim.keymap.set("n", "grI", function()
      MiniExtra.pickers.lsp({ scope = "implementation" })
    end, {desc = "Lsp Implementation (mini.pick)"})

    --- Mini Sessions
    local MiniSessions = require("mini.sessions")
    MiniSessions.setup()
    vim.keymap.set("n", "<leader>sa", function()
      MiniSessions.write(vim.fn.input("Session name: "))
    end, { desc = "Sessions Add" })
    vim.keymap.set("n", "<leader>ss", function()
      MiniSessions.select("read")
    end, { desc = "Sessions Select" })
    vim.keymap.set("n", "<leader>sd", function()
      MiniSessions.select("delete")
    end, { desc = "Session Delete" })

    --- Mini Stater
    local MiniStarter = require("mini.starter")
    MiniStarter.setup({
      items = {
        MiniStarter.sections.sessions(5, true),
        MiniStarter.sections.recent_files(4, true),
        MiniStarter.sections.recent_files(4, false),
        MiniStarter.sections.builtin_actions(),
      },
      content_hooks = {
        MiniStarter.gen_hook.aligning("center", "center"),
        MiniStarter.gen_hook.adding_bullet(),
        MiniStarter.gen_hook.indexing("all", { "Sessions", "Builtin actions" }),
      },
      footer = "",
    })
  end,
}
