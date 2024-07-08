This is the Neovim config I personally use.
 
It has been created by closely following chris@machine's YouTube series "Neovim from Scratch", hence it is pretty much identical to **[LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)**.

# Installation
This config requires >= Neovim v0.8.0. Please upgrade if you're on an earlier version of the editor.

Clone the repository into the correct location (make a backup your current nvim directory if you want to keep it).
```
git clone https://github.com/alemarostica/my-neovim-config.git ~/.config/nvim
```
Run ```nvim``` in your terminal and wait for the plugins to be installed. You will notice treesitter pulling in a bunch of language parsers the next time you open Neovim.

**NOTE** [Mason](https://github.com/williamboman/mason.nvim) is used to install and manage LSP servers, DAP servers, linters, and formatters via the `:Mason` command.

This config assumes that you have Nerd Fonts v3.0.0 or higher. If you are using an older version then please update your [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) otherwise there will be missing or wrong glyphs

# Dependencies
This specific config requires a number of binaries installed on the device to support LSP, formatting alnd linting. Namely:
- asmfmt
- asm-lsp
- bash-language-server
- black
- clangd
- clang-format
- cmake-language-server
- cmakelang
- codelldb
- cpplint
- cpptools
- csharp-language-server
- dockerfile-language-server
- eslint_d
- flake8
- json-lsp
- jsonlint
- lua-language-server
- luacheck
- prettier
- pyright
- rust-analyzer
- rust-tools
- shellcheck
- shfmt
- stylua
- yaml-language-server
- yamllint

Good luck figuring out which one is installed in which way.

**NOTE** make sure you have [node](https://nodejs.org/en/) installed.

Also run ```:checkhealth``` and setup everything according to the results.
