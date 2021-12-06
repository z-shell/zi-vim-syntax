A Vim syntax definition for Zinit commands in any file of type `zsh`.

# Installation

Load as a Vim plugin. E.g. when using vim-plug, add to `~/.vimrc`:

```vim
Plug 'z-shell/zinit-vim-syntax'
```

and then issue the `:PlugInstall` command.

## Manual Installation

To install the syntax copy the file `syntax/after/zsh.vim` under the path
`~/.vim/syntax/after`.

### Examples

The default theme:

![plastic](https://raw.githubusercontent.com/z-shell/zinit-vim-syntax/main/images/default.png)

The theme `flrnprz/plastic.vim`:

![plastic](https://raw.githubusercontent.com/z-shell/zinit-vim-syntax/main/images/plastic.png)

The theme `slate`:

![plastic](https://raw.githubusercontent.com/z-shell/zinit-vim-syntax/main/images/slate.png)

The theme `murphy`:

![plastic](https://raw.githubusercontent.com/z-shell/zinit-vim-syntax/main/images/murphy.png)

The theme `lucasprag/simpleblack`:

![plastic](https://raw.githubusercontent.com/z-shell/zinit-vim-syntax/main/images/simpleblack.png)

### TODO

1. Highlight user and plugin with different colors.
2. Make the `wait`'s distinctness controlled.
3. Make the syntax matching commands fully contained.
4. Fix bugs.
5. Other?
