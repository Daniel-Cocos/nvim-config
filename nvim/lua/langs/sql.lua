return {
	servers = {
		{
			name = "sqls",
			opts = {
				root_dir = function(fname)
					local util = require("lspconfig.util")
					return util.root_pattern(".sqls.yml", ".git")(fname) or util.path.dirname(fname)
				end,
			},
		},
	},
	formatters = {
		sql = { "sql_formatter", "pg_format" },
		mysql = { "sql_formatter", "pg_format" },
		plsql = { "sql_formatter", "pg_format" },
	},
	linters = {
		sql = { "sqlfluff" },
		mysql = { "sqlfluff" },
		plsql = { "sqlfluff" },
	},
}
