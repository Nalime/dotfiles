require("luasnip.session.snippet_collection").clear_snippets("cpp")

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local opt = require("luasnip.nodes.optional_arg")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
    s("for", fmt(
        "for (int {} = {}; {} < {}; ++{})",
        {
            i(1, "_"),
            i(2, "LOWER"),
            rep(1),
            i(3, "UPPER"),
            rep(1),
        }
    )),
    s("for0", fmt(
        "for (int {} = 0; {} < {}; ++{})",
        {
            i(1, "_"),
            rep(1),
            i(2, "UPPER"),
            rep(1),
        }
    )),
    s("for1", fmt(
        "for (int {} = 1; {} <= {}; ++{})",
        {
            i(1, "_"),
            rep(1),
            i(2, "UPPER"),
            rep(1),
        }
    )),
    s("rof", fmt(
        "for (int {} = {} - 1; {} >= {}; --{})",
        {
            i(1, "_"),
            i(2, "UPPER"),
            rep(1),
            i(3, "LOWER"),
            rep(1),
        }
    )),
    s("rof0", fmt(
        "for (int {} = {} - 1; {} >= 0; --{})",
        {
            i(1, "_"),
            i(2, "UPPER"),
            rep(1),
            rep(1),
        }
    )),
    s("rof1", fmt(
        "for (int {} = {}; {} > 0; --{})",
        {
            i(1, "_"),
            i(2, "UPPER"),
            rep(1),
            rep(1),
        }
    )),
    s("iv", fmt(
        [[
            vector<{}> {}({});
            for (auto& x : {}) cin >> x;
        ]],
        {
            i(1, "TYPE"),
            i(2, "a"),
            i(3, "SIZE"),
            rep(2),
        }
    )),
    s("ov", fmt(
        [[
            for (int i = 0; i < sz({}); ++i) {{
                cout << {}[i] << " \n"[i + 1 == sz({});
            }}
        ]],
        {
            i(1, "a"),
            rep(1),
            rep(1),
        }
    )),
    s("inv", fmt(
        [[
            vector<{}> inv({});
            inv[1] = 1;
            for (int i = 2; i < sz(inv); ++i) {{
                inv[i] = {} - {} / i * inv[{} % i] % {};
            }}
        ]],
        {
            i(1, "ll"),
            i(2, "SIZE"),
            i(3, "kMod"),
            rep(3),
            rep(3),
            rep(3),
        }
    )),
    s("fact", fmt(
        [[
            vector<{}> fact({});
            fact[0] = 1;
            for (int i = 1; i < sz(fact); ++i) {{
                fact[i] = fact[i - 1] * i % {};
            }}
        ]],
        {
            i(1, "ll"),
            i(2, "SIZE"),
            i(3, "kMod"),
        }
    )),
    s("finv", fmt(
        [[
            vector<{}> finv({});
            finv[0] = 1;
            for (int i = 1; i < sz(finv); ++i) {{
                finv[i] = finv[i - 1] * inv[i] % {};
            }}
        ]],
        {
            i(1, "ll"),
            i(2, "SIZE"),
            i(3, "kMod"),
        }
    )),
    s("sz", fmt(
        "int(size({}))",
        {
            i(1),
        }
    )),
    s("max", fmt(
        "numeric_limits<{}>::max()",
        {
            i(1, "streamsize"),
        }
    )),
    s("min", fmt(
        "numeric_limits<{}>::min()",
        {
            i(1, "TYPE"),
        }
    )),
    s("mod1", {t("constexpr int kMod = 1e9 + 7;")}),
    s("mod9", {t("constexpr int kMod = 998244353;")}),
}
