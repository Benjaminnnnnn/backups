local opts = {
  cmdline = {
    format = {
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = "50%",
      },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = false,
      silent = true,
    },
    signature = {
      enabled = false,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
    {
      view = "split",
      filter = { event = "msg_show", min_height = 20 },
    },
    {
      filter = { event = "notify", find = "No information available" },
      opts = { skip = true },
    },
    {
      view = "cmdline",
      filter = { event = "msg_showmode" },
    },
  },
}

return opts
