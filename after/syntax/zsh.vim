" Copyright (c) 2019 Sebastian Gniazdowski
" Copyright (c) 2021 Salvydas Lukosius
"
" Syntax highlighting for ZI commands in any file of type `zsh'.
" It adds definitions for the ZI syntax to the ones from the existing zsh.vim definitions-file.

" Main ZI command.
" Should be the only TOP rule for the whole syntax.
syntax match ZICommand     /\<\%(zi\|zi-turbo\)\>\s/me=e-1
            \ skipwhite
            \ nextgroup=ZISubCommands,ZIPluginSubCommands,ZISnippetSubCommands
            \ contains=ZISubCommands,ZIPluginSubCommands,ZISnippetSubCommands

" TODO: add options for e.g. light
syntax match ZISubCommands /\s\<\%(ice\|compinit\|env-whitelist\|cdreplay\|cdclear\|update\)\>\s/ms=s+1,me=e-1
            \ contained

syntax match ZIPluginSubCommands /\s\<\%(light\|load\)\>\s/ms=s+1,me=e-1
            \ skipwhite nextgroup=ZIPlugin1,ZIPlugin2,ZIPlugin3
            \ contains=ZIPlugin1,ZIPlugin2,ZIPlugin3

syntax match ZISnippetSubCommands /\s\<\%(snippet\)\>\s/ms=s+1,me=e-1
            \ skipwhite
            \ nextgroup=ZISnippetShorthands1,ZISnippetShorthands2
            \ contains=ZISnippetShorthands1,ZISnippetShorthands2

" "user/plugin"
syntax match ZIPlugin1 /\s["]\%([!-_]*\%(\/[!-_]\+\)\+\|[!-_]\+\)["]/ms=s+1,hs=s+2,he=e-1
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" 'user/plugin'
syntax match ZIPlugin2 /\s[']\%([!-_]*\%(\/[!-_]\+\)\+\|[!-_]\+\)[']/ms=s+1,hs=s+2,he=e-1
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" user/plugin
syntax match ZIPlugin3 /\s\%([!-_]*\%(\/[!-_]\+\)\+\|[!-_]\+\)/ms=s+1,me=e+2 
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" OMZ:: or PZT::
" TODO: 'OMZ:: or 'PZT::
syntax match ZISnippetShorthands1 /\s\<\%(\%(OMZ\|OMZP\|OMZL\|OMZT\|PZT\)\>::\|\)/hs=s+1,he=e-2
            \ contained
            \ skipwhite
            \ nextgroup=ZISnippetUrl1,ZISnippetUrl2
            \ contains=ZISnippetUrl1,ZISnippetUrl2

" "OMZ:: or "PZT::
syntax match ZISnippetShorthands2 /\s["]\%(\%(OMZ\|OMZP\|OMZL\|OMZT\|PZT\)\>::\|\)/hs=s+2,he=e-2
            \ contained
            \ skipwhite
            \ nextgroup=ZISnippetUrl3,ZISnippetUrl4
            \ contains=ZISnippetUrl3,ZISnippetUrl4

syntax match ZISnippetUrl3 /\<\%(http:\/\/\|https:\/\/\|ftp:\/\/\|\$HOME\|\/\)[!-_]\+\%(\/[!-_]\+\)*\/\?["]/he=e-1
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" TODO: Fix ZITrailingWhiteSpace not matching
syntax match ZISnippetUrl4 /\%(\%(OMZ\|OMZP\|OMZL\|OMZT\|PZT\)::\)[!-_]\+\%(\/[!-_]\+\)*\/\?["]/hs=s+5,he=e-1
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" http://… or https://… or ftp://… or $HOME/… or /…
" TODO: Fix $HOME/… and /… not matching
syntax match ZISnippetUrl1 /\<\%(http:\/\/\|https:\/\/\|ftp:\/\/\|\$HOME\|\/\)[!-_]\+\%(\/[!-_]\+\)*\/\?/
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

" TODO: Fix ZITrailingWhiteSpace not matching
syntax match ZISnippetUrl2 /\<\%(\%(OMZ\|OMZP\|OMZL\|OMZT\|PZT\)::\)[!-_]\+\%(\/[!-_]\+\)*\/\?/hs=s+5
            \ contained
            \ nextgroup=ZITrailingWhiteSpace
            \ contains=ZITrailingWhiteSpace

syntax match ZITrailingWhiteSpace /[[:space:]]\+$/ contained

" TODO: differentiate the no-value ices
" TODO: use contained
syntax match ZIIceSubCommand /\sice\s/ms=s+1,me=e-1 nextgroup=ZIIceModifiers
syntax match ZIIceModifiers  /\s\<\%(svn\|proto\|from\|teleid\|bindmap\|cloneopts|\pullopts|id-as\|depth\|if\|wait\|load\|pack\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(unload\|blockf\|on-update-of\|subscribe\|pick\|bpick\|src\|as\|ver\|silent\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(lucid\|notify\|mv\|cp\|atinit\|atclone\|atload\|atpull\|nocd\|run-atpull\|has\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(cloneonly\|make\|service\|trackbinds\|multisrc\|compile\|nocompile\|extract\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(nocompletions\|reset-prompt\|wrap-track\|reset\|aliases\|sh\|bash\|ksh\|csh\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(\\!sh\|!sh\|\\!bash\|!bash\|\\!ksh\|!ksh\|\\!csh\|!csh\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(blockf\|silent\|lucid\|cloneonly\|nocd\|run-atpull\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(\|sh\|\!sh\|bash\|\!bash\|ksh\|\!ksh\|csh\|\!csh\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(nocompletions\|aliases\|trigger-load\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(light-mode\|is-snippet\|countdown\|ps-on-unload\|ps-on-update\)\>/ms=s+1
syntax match ZIIceModifiers  /\s\<\%(binary\|null\|debug\|install\|subst\|autoload\|opts\|param\|git\)\>/ms=s+1

" Include also ices added by the existing annexes
syntax match ZIIceModifiers  /\s\<\%(test\|zman\|submod\|dl\|patch\|fbin\|sbin\|fsrc\|ferc\|fmod\|gem\|node\|rustup\|cargo\)\>/ms=s+1
        
" Additional Zsh and ZI functions
syntax match ZshAndZIFunctions     /\<\%(compdef\|compinit\|zicdreplay\|zicdclear\|zicompinit\|zicompdef\)\>/

" Link
highlight def link ZshAndZIFunctions    Keyword
highlight def link ZICommand            Statement
highlight def link ZISubCommands        Title
highlight def link ZIPluginSubCommands  Title
highlight def link ZISnippetSubCommands Title
highlight def link ZIIceModifiers       Type
highlight def link ZISnippetShorthands1 Keyword
highlight def link ZISnippetShorthands2 Keyword
highlight def link ZIPlugin1            Macro
highlight def link ZIPlugin2            Macro
highlight def link ZIPlugin3            Macro
highlight def link ZISnippetUrl1        Macro
highlight def link ZISnippetUrl2        Macro
highlight def link ZISnippetUrl3        Macro
highlight def link ZISnippetUrl4        Macro
highlight def link ZITrailingWhiteSpace Error
