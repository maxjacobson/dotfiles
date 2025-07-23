return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters_explicit = 1

    vim.g.ale_linters = {
      bash = { 'shellcheck' },
      eruby = { 'erblint' },
      fish = { 'fish', 'fish_indent' },
      mjml = { 'erblint' },
      ruby = { 'rubocop' },
      javascript = { 'eslint' },
      typescript = { 'eslint'},
      rust = { 'analyzer', 'cargo' },
      sh = { 'shellcheck' },
    }

    vim.g.ale_fixers = {
      css = { 'prettier' },
      fish = { 'fish_indent' },
      ruby = { 'rubocop', 'prettier' },
      javascript = { 'prettier' },
      jsx = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
      scss = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
    }

    vim.g.ale_ruby_rubocop_executable = "bin/rubocop"
    vim.g.ale_eruby_erblint_executable = "bin/erb_lint"
    vim.g.ale_rust_cargo_use_clippy = 1
    vim.g.ale_fix_on_save = 1
  end
}
