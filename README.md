**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Requirements

- Neovim >= 0.8

# Installation

1) luarocks

```
brew install luarocks

luarocks --version

```

2) ast-grep (https://github.com/ast-grep/ast-grep)
```
brew install ast-grep

```

2) rg (https://github.com/BurntSushi/ripgrep) 

```
brew install ripgrep

```

3) fd (https://github.com/sharkdp/fd)

```
brew install fd

```

4) Codeium (https://github.com/Exafunction/codeium.nvim)
```
:Codeium Auth
```

5) rest.vim (https://github.com/rest-nvim/rest.nvim)

#### Change to LuaJIT
```
brew install LuaJIT

brew unlink lua

brew link --overwrite luajit

```
#### Install parser
```
:TSIntall http

```

# Ref

https://github.com/nvim-telescope/telescope-live-grep-args.nvim
