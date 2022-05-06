# vim & tmux my-settings
Generate .vimrc or init.vim and .tmux.conf.

## How to use
The following requirements must be met to run shell scripts.

- node
- npm
- vim or neovim
- tmux
- vim-jetpack

### vim8
A .vimrc file is created in the current directory.
```
./install-vim.sh
```

### neovim
A init.vim file is created in the current directory.
```
./install-nvim.sh
```

### tmux 
A .tmux.conf file is created in the current directory.
```
./install-tmux.sh
```

### Setup
Run the following commands before you start using it.

1. Bash SETTINGS
```:bash
echo 'export TERM=xterm-color' >> .bash_profile
```
```:bash
source ~/.bash_profile
```

2. Install Plug-in for vim or neovim
```
:JetpackSync
```

3. Coc SETTINGS
```
:CocConfig
```

```:json
{
  "coc.preferences.formatOnType": true,
  "suggest.noselect": false,
  "suggest.keepCompleteopt": true,
  "coc.preferences.formatOnSaveFiletypes": [
    "dart"
  ],
  "languageserver": {
    "efm": {
      "command": "efm-langserver",
      "args": [],
      "filetypes": ["vim", "eruby", "markdown", "YAML"]
    }
  },
  "svelte.enable-ts-plugin": true
}
```

## Plug-ins in use
- [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
- [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
- [mattn/vim-lexiv](https://github.com/mattn/vim-lexiv)
- [lambdalisue/fern.vim](https://github.com/lambdalisue/fern.vim)
- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [yaegassy/coc-volar-tools](https://github.com/yaegassy/coc-volar-tools)
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim)

## License
this repository is MIT-licensed.
