--
-- require("mason-lspconfig").setup({
--     ensure_installed = { "sql-formatter" },
-- })

-- Formatter setup
require('formatter').setup({
    logging = false,
    filetype = {
        sql = {
            function()
                return {
                    exe = "sql-formatter",
                    args = {"--language", "sql"},
                    stdin = true
                }
            end
        }
    }
})
