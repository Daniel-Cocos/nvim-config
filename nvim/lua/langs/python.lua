return {
  servers = {
    { name = "pyright" },
  },
  formatters = {
    python = { "black" },
  },
  linters = {
    python = { "ruff" },
  },
}
