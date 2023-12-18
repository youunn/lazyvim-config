local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local cmd = vim.fn.split([[
    git clone
      --filter blob:none
      https://github.com/folke/lazy.nvim.git
      --branch stable
  ]] .. lazypath)
  vim.system(cmd, {}, function() vim.schedule(vim.cmd.qa) end)
end
vim.opt.rtp:prepend(lazypath)

require "lazy".setup {
  {
    "LazyVim/LazyVim",
    priority = 1000,
    import = "lazyvim.plugins",
  },
  { import = "plugins" },
}
