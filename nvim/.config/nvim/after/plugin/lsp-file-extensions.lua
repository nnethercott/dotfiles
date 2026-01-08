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
    gotmpl = "helm",
    tmpl = "helm",
    tpl = "helm",
    tfstate = "json",
  },
})

-- mdx
vim.filetype.add({
  extension = {
    mdx = "markdown",
  },
})
