return {
  "ludovicchabant/vim-gutentags",
  config = function()
    -- Default root markers already include .git; add .jj so gutentags works
    -- in non-colocated jj repos, where there is no .git directory. This runs
    -- after the plugin has already appended its defaults, so extend, don't
    -- overwrite
    vim.g.gutentags_project_root = vim.list_extend(
      vim.g.gutentags_project_root or {},
      { ".jj" }
    )

    -- Store tags files in a central cache instead of inside each project,
    -- which also sidesteps the difference between .git and .jj repos
    vim.g.gutentags_cache_dir = vim.fn.stdpath("cache") .. "/gutentags"
    vim.fn.mkdir(vim.g.gutentags_cache_dir, "p")

    -- Index only files each VCS tracks. Without this gutentags recurses over
    -- everything, and fd can't help as a plain command here because it only
    -- respects .gitignore when a .git directory exists, which jj repos lack
    vim.g.gutentags_file_list_command = {
      markers = {
        [".git"] = "git ls-files",
        [".jj"] = "jj file list",
      },
    }
  end
}
