local ls = require('luasnip')
local parse_snippet = ls.parser.parse_snippet

return {
    parse_snippet('collapse', [[
{{< code language="" title="" isCollapsed="true" >}}
{{< /code >}}
    ]])
}
