local ls = require('luasnip')

local parse_snippet = ls.parser.parse_snippet

return {
    -- parse_snippet('bf', '\\textbf{$1}$0')
}, {
    s("bf", {t('\\textbf{'), i(1), t('}'), i(0)})
    -- parse_snippet('bf', '\\textbf{$1}$0')
}
