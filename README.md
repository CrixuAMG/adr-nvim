<h1 align="center">adr-nvim</h1>

<p align="center">
  Architecture Decision Records for Neovim
  <br><br>
  <a href="https://github.com/dj95/adr-nvim/releases">
    <img alt="latest version" src="https://img.shields.io/github/v/tag/dj95/adr-nvim.svg?sort=semver" />
  </a>
  <br><br>
  This is a plugin that helps to create architecture decision records (ADR) within neovim. It provides
  a selection from templates and creates a new file in the *docs/* directory of your project. The
  plugin comes with a template heavily inspired by <a href="https://github.com/adr/madr/blob/develop/template/adr-template.md">https://github.com/adr/madr/blob/develop/template/adr-template.md</a>.
</p>

## 🚀 Installation

Install the plugin with a plugin manager of your choice. Here are two examples:

**lazy.nvim**

```lua
{
  'dj95/adr-nvim',
  opts = {},
}
```

**Plug**

```lua
Plug 'dj95/adr-nvim'
```

## ⚙️ Configuration

After the installation you can configure the plugin by adding the following to your `init.lua`:

```lua
require('adr').setup({
    template_dir = "~/adr-templates",
})
```

If not `template_dir` is specified the default templates within this repository will be used.

Then create a keybinding, that calls `require('adr').create_from_template()`.

```lua
map("n", "<leader>na", require('adr').create_from_template())
```

## 🤝 Contributing

If you are missing features or find some annoying bugs please feel free to submit an issue or a bugfix within a pull request :)

## 📝 License

© 2024 Daniel Jankowski

This project is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
