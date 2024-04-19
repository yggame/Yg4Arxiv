import "scripts/config" as cfg;

let title = params[0];
let authors = params[1];

title.trim();

let title_rg = RegexCaseInsensitive(`(?P<key>(${cfg::title_rg}))`);
let titles_model_rg = RegexCaseInsensitive(`(?P<key>(${cfg::titles_model_rg}))`);
let titles_type_rg = RegexCaseInsensitive(`(?P<key>(${cfg::titles_type_rg}))`);
let titles_method_rg = RegexCaseInsensitive(`(?P<key>(${cfg::titles_method_rg}))`);

let authors_rg = RegexCaseInsensitive(`(?P<key>(${cfg::authors_rg}))`);

let title = titles_type_rg.replace_all(title,"<span class=\"highlight-title\">$key</span>");
let title = titles_model_rg.replace_all(title,"<span class=\"highlight-title2\">$key</span>");
let title = titles_method_rg.replace_all(title,"<span class=\"highlight-title3\">$key</span>");

let authors = authors.map(|v|authors_rg.is_match(v));
let title = if true in authors {
    "<span class=\"highlight-title\">★</span> " + title
} else {
    "☆ " + title
};

title
