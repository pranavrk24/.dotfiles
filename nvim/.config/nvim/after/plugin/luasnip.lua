local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- CPP
-- stylua: ignore
ls.add_snippets("cpp", {
  s("cp", {
    t({"#include<bits/stdc++.h>", ""}),
    t({"using namespace std;", "", ""}),
    t({"int main() {", ""}),
    t({"  ios::sync_with_stdio(false);", ""}),
    t({"  cin.tie(0);", "", "  "}),
    i(0),
    t({"", "  return 0;", ""}),
    t({"}"}),
  })
})
