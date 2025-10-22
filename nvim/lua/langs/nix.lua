return {
  servers = {
    { name = "nixd" },
  },
  formatters = {
    nix = { "alejandra" },
  },
  linters = {
    nix = { "statix" },
  },
}
