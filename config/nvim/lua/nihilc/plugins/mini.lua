local autocmd = require("nihilc.autocmd")
local keymaps = require("nihilc.keymaps")
return {
  -- Appearance
  {
    "nvim-mini/mini.starter",
    version = "*",
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        items = {
          starter.sections.sessions(5, true),
          starter.sections.recent_files(4, true),
          starter.sections.recent_files(4, false),
          starter.sections.builtin_actions(),
        },
        content_hooks = {
          starter.gen_hook.aligning("center", "center"),
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing("all", { "Sessions", "Builtin actions" }),
        },
        footer = "Type query to filter items\n<esc> resets query\n<c-c> closes this buffer",
      })
    end,
  },
  { "nvim-mini/mini.icons", version = "*", opts = {} },
  { "nvim-mini/mini.indentscope", version = "*", opts = { symbol = "│" } },

  -- Workflow
  {"nvim-mini/mini.extra", version = "*", opts = {}},
  {
    "nvim-mini/mini.pick",
    version = "*",
    config = function()
      require("mini.pick").setup()
      -- Change vim.ui.select to MiniPick.ui_select()
      vim.ui.select = function(items, opts, on_choice)
        start_opts = { window = { config = { width = 60, height = 10 } } }
        return MiniPick.ui_select(items, opts, on_choice, start_opts)
      end
      -- Set Global Keymaps
      keymaps.set({
        { desc = "Find Files", lhs = "<leader>ff", rhs = "<cmd>Pick files<cr>" },
        { desc = "Find Buffer", lhs = "<leader>fb", rhs = "<cmd>Pick buffers<cr>" },
        { desc = "Find Grep Live", lhs = "<leader>fg", rhs = "<cmd>Pick grep_live<cr>" },
        {
          desc = "Find Word",
          lhs = "<leader>fw",
          rhs = function()
            local word = vim.fn.expand("<cword>")
            MiniPick.builtin.grep({ pattern = word }, { source = { name = string.format("Grep: %s", word) } })
          end,
        },
        {
          desc = "Find WORD",
          lhs = "<leader>fW",
          rhs = function()
            local word = vim.fn.expand("<cWORD>")
            MiniPick.builtin.grep({ pattern = word }, { source = { name = string.format("Grep: %s", word) } })
          end,
        },
        { desc = "Help Tags", lhs = "<leader>ht", rhs = "<cmd>Pick help<cr>" },
        { desc = "Help Keymaps", lhs = "<leader>hk", rhs = "<cmd>Pick keymaps<cr>" },
        -- { desc = "", lhs = "", rhs = "" },
      })
    end,
  },
  {
    "nvim-mini/mini.files",
    version = "*",
    config = function()
      require("mini.files").setup({
        options = {
          use_as_default_explorer = true,
          permanent_delete = false,
        },
        windows = {
          preview = false,
          max_number = math.huge,
          width_focus = 50,
          width_nofocus = 15,
          width_preview = 50,
        },
      })
      -- Set Global Keymaps
      keymaps.set({
        {
          desc = "Open mini.files (current file or cwd)",
          lhs = "<leader>e",
          rhs = function()
            local buf_name = vim.api.nvim_buf_get_name(0)
            local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
            MiniFiles.open(path)
            MiniFiles.reveal_cwd()
          end,
        },
        {
          desc = "Open mini.files (cwd)",
          lhs = "<leader>E",
          rhs = function()
            MiniFiles.open()
          end,
        },
      })
      -- Set Buffer Keymaps
      autocmd.create("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf = args.data.buf_id
          keymaps.set({
            {
              desc = "Open File in OS",
              lhs = "gx",
              rhs = function()
                vim.ui.open(MiniFiles.get_fs_entry().path)
              end,
              opts = { buffer = buf, remap = true },
            },
            {
              desc = "Copy to Clipboard",
              lhs = "<leader>yy",
              rhs = function()
                local file_path = MiniFiles.get_fs_entry().path
                if file_path == nil then
                  vim.notify("No file or directory selected", vim.log.levels.WARN)
                  return
                end
                local cmd = string.format("wl-copy --type text/uri-list 'file://%s'", vim.fn.shellescape(file_path))
                local result = vim.fn.system(cmd)
                if vim.v.shell_error ~= 0 then
                  vim.notify("Failed to copy: " .. result, vim.log.levels.ERROR)
                  return
                end
                vim.notify(vim.fn.fnamemodify(file_path, ":t"), vim.log.levels.INFO)
                vim.notify("Copied file to system clipboard", vim.log.levels.INFO)
              end,
              opts = { buffer = buf, remap = true },
            },
            {
              desc = "Copy Path to Clipboard",
              lhs = "<leader>yp",
              rhs = function()
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
              end,
              opts = { buffer = buf, remap = true },
            },
            {
              desc = "Zip and Copy to Clipboard",
              lhs = "<leader>yz",
              rhs = function()
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
              end,
              opts = { buffer = buf, remap = true },
            },
          })
        end,
      })
    end,
  },
  {
    "nvim-mini/mini.sessions",
    version = "*",
    config = function()
      require("mini.sessions").setup({
        force = { delete = true },
      })
      keymaps.set({
        {
          desc = "Session New",
          lhs = "<leader>sn",
          rhs = function()
            MiniSessions.write(vim.fn.input("Session name: "))
          end,
        },
        {
          desc = "Session Read",
          lhs = "<leader>sr",
          rhs = function()
            MiniSessions.select("read")
          end,
        },
        {
          desc = "Session Delete",
          lhs = "<leader>sd",
          rhs = function()
            MiniSessions.select("delete")
          end,
        },
      })
    end,
  },
}
