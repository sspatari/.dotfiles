return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      go = { "golangcilint" },
    }

    -- Debounced lint runner
    local function debounce_lint(ms)
      vim.defer_fn(function()
        if vim.bo.buftype ~= "" then
          return
        end
        lint.try_lint()
      end, ms)
    end

    -- Run lint on open, save, and when leaving insert mode (LSP-like without being too heavy)
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        -- Only for Go buffers
        if vim.bo.filetype ~= "go" then
          return
        end
        debounce_lint(400) -- tweak: 200-800ms
      end,
    })

    -- Manual trigger
    vim.api.nvim_create_user_command("Lint", function()
      lint.try_lint()
    end, {})
  end,
}
