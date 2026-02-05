return {
  servers = {
    { name = "cssls" },
  },
  formatters = {
    css  = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
  },
  linters = {
    css  = { "stylelint" },
    scss = { "stylelint" },
    less = { "stylelint" },
  },
}
