return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-go",
    "haydenmeade/neotest-jest",
  },
  config = function()
    local status_ok, neotest = pcall(require, "neotest")
    if not status_ok then
      return
    end

    neotest.setup({
      adapters = {
        require("neotest-jest"),
        require("neotest-go"),
        require("neotest-plenary"),
      },
    })
  end,
}
