# `ZINIT-VIM-SYNTAX`

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-blue?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [`ZINIT-VIM-SYNTAX`](#zinit-vim-syntax)
  - [Installation](#installation)
    - [Manual Installation](#manual-installation)
  - [Examples](#examples)
  - [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

A Vim syntax definition for Zinit commands in any file of type `zsh`.

## Installation

Load as a Vim plugin. E.g. when using vim-plug, add to `~/.vimrc`:

```vim
Plug 'z-shell/zinit-vim-syntax'
```

and then issue the `:PlugInstall` command.

### Manual Installation

To install the syntax copy the file `syntax/after/zsh.vim` under the path
`~/.vim/syntax/after`.

## Examples

The default theme:

![plastic](https://raw.githubusercontent.com/zinit-zsh/zinit-vim-syntax/main/images/default.png)

The theme `flrnprz/plastic.vim`:

![plastic](https://raw.githubusercontent.com/zinit-zsh/zinit-vim-syntax/main/images/plastic.png)

The theme `slate`:

![plastic](https://raw.githubusercontent.com/zinit-zsh/zinit-vim-syntax/main/images/slate.png)

The theme `murphy`:

![plastic](https://raw.githubusercontent.com/zinit-zsh/zinit-vim-syntax/main/images/murphy.png)

The theme `lucasprag/simpleblack`:

![plastic](https://raw.githubusercontent.com/zinit-zsh/zinit-vim-syntax/main/images/simpleblack.png)

## TODO

1. Highlight user and plugin with different colors.
2. Make the `wait`'s distinctness controlled.
3. Make the syntax matching commands fully contained.
4. Fix bugs.
5. Other?
