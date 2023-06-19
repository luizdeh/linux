return {
  "Exafunction/codeium.vim",
  event = "BufReadPost",
  config = function()
    vim.keymap.set("i", "<A-o>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    vim.keymap.set("i", "<A-l>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<A-k>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<A-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}
