local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.config.setup({
  store_selection_keys = "<Tab>"
})

ls.add_snippets("markdown", {
  -- Adds a changelog entry
	s("changelog", {
    t("- "), t("["), i(1, "FEATURE"), t("] "), i(2, "TEXT"), t(" ["), i(3, "Hidde Eertman"), t("]["), i(4, "hidde"), t("](https://github.com/nerds-and-company/"), i(5, "blocks/pulls/NUMBER"), t(")")
	}),
})

ls.add_snippets("all", {
  -- Import statement that I am never going to use
  s("import", fmt('import {} from "{}";', { i(1, "TEST"), rep(1) })),

  -- Specs!
  s("it", fmt([[
    it('{}', async () => {{
      createComponent();
      {}
    }});
  ]], { i(1, "Does something"), i(0) })),

  -- Specs 2.0
  s("describe", fmt([[
    describe('{}', () => {{
      {}
    }});
  ]], { i(1, "it!"), i(0) })),

  -- Console.log
  s("cl", fmt("console.log({});", {
    f(function(_, snip)
      return snip.env.TM_SELECTED_TEXT[1] or {}
    end, {0}),
  })),

  -- CSS varify something!
  s("cssvar", fmt('var(--{}, {})', {
    i(1),
    f(function(_, snip)
      return snip.env.TM_SELECTED_TEXT[1] or {}
    end, {}),
  })),

  -- Fuck ERB
  s("if", fmt([[
    <% if {} %>
      {}
    <% end %>
  ]], { i(1, "hidde is cool"), i(0) })),


  -- Create boilerplate for story
  s("story", fmt([[
    import {} from '{}';

    export default {{
      title: '{}',
      component: {},
      argTypes: {{}},
    }};

    const template = (args, {{ argTypes }}) => ({{
      props: Object.keys(argTypes),
      components: {{ {} }},
      template: `
        MY TEMPLATE!!
      `,
    }});

    export const Default = template.bind({{}});
    Default.args = {{
      {}
    }};
  ]], {
    i(1),
    i(2),
    i(3),
    rep(1),
    rep(1),
    i(0),
  }))
})
