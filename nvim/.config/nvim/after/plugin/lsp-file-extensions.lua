-- jinja
vim.filetype.add({
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
})

-- terraform and helmfile
vim.filetype.add({
  extension = {
    tmpl = "helm",
    tpl = "helm",
    tfstate = "json",
  },
  pattern = {
    [".*%.gotmpl"] = function(path)
      if path:match("helmfile") then
        return "yaml"
      end
      return "helm"
    end,
  },
})

-- mdx
vim.filetype.add({
  extension = {
    mdx = "markdown",
  },
})
