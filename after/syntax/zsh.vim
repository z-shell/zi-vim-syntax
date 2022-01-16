" Copyright (c) 2019 Sebastian Gniazdowski
" Copyright (c) 2021 Salvydas Lukosius
"
" Syntax highlighting for ZI commands in any file of type `zsh'.
" It adds definitions for the ZI syntax to the ones from the existing zsh.vim definitions-file.

" Main ZI command.
" Should be the only TOP rule for the whole syntax.
syn match ZICommand '\(^\|\s\)zi\s'ms=e-5,me=e-1 skipwhite
            \ nextgroup=ZICommand,ZIIceCommand,ZIPluginCommand,ZISnippetCommand,ZIForCommand,ZIContinue,ZIIceWithParam,ZIIce

syn match ZICommand '\s\zi-turbo\s'ms=e-5,me=e-1 skipwhite
            \ nextgroup=ZIForCommand,ZIPluginCommand,ZISnippetCommand,ZIContinue,ZIIceWithParam,ZIIce

syn match ZICommand '\s\%(self-update\|update\|delete\|cd\|edit\|glance\|stress\|changes\|create\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(times\|zstatus\|report\|loaded\|list\|ls\|status\|recently\|bindkeys\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(clist\|completions\|cdisable\|cenable\|creinstall\|cuninstall\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(srv\|recall\|env-whitelist\|module\|add-fpath\|fpath\|run\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(csearch\|compinit\|cclear\|cdlist\|cdreplay\|cdclear\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(dtrace\|dstart\|dstop\|dunload\|dreport\|dclear\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(compile\|uncompile\|compiled\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(help\|man\)\>'ms=s+1 skipwhite contained
syn match ZICommand '\s\%(unload\)\>'ms=s+1 skipwhite contained

syn match ZIPluginCommand '\s\%(light\|load\)\s'ms=s+1,me=e-1 skipwhite contained nextgroup=ZIPlugin,ZIContinue
syn match ZISnippetCommand '\s\%(snippet\)\s'ms=s+1,me=e-1 skipwhite contained nextgroup=ZISnippet,ZIContinue
syn match ZIIceCommand '\sice\s'ms=s+1,me=e-1 skipwhite contained nextgroup=ZIIce,ZIIceWithParam
syn match ZIForCommand '\sfor\s'ms=s+1,me=e-1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue

syn cluster ZILine contains=ZIIce,ZIIceWithParam,ZIPlugin,ZISnippet,ZIForCommand

syn match ZIContinue '\s\\\s*$'ms=s+1,me=s+2 skipwhite contained skipnl
            \ nextgroup=@ZILine
" user/plugin or @user/plugin
syn match ZIPlugin '\s@\?\<[a-zA-Z0-9][a-zA-Z0-9_\-]*\/[a-zA-Z0-9_\-\.]\+\>'ms=s+1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue
" Shorthands
syn match ZISnippet '\s\%(OMZ[LPT]\?\|PZT[M]\?\)::[a-zA-Z0-9_\-\.\/]\+\>'ms=s+1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue
" URL
syn match ZISnippet '\s\%(http[s]\?\|ftp\):\/\/[[:alnum:]%\/_#.-]*\>'ms=s+1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue
" "$VAR" local path
syn match ZISnippet +\s"\$\<[a-zA-Z0-9_]\+[^"]*"+ms=s+1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue
" "${VAR}" local path
syn match ZISnippet +\s"\${\<[a-zA-Z0-9_]\+}[^"]*"+ms=s+1 skipwhite contained
            \ nextgroup=ZIPlugin,ZISnippet,ZIContinue

" Ices which takes a param enclosed in "
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(proto\|from\|ver\|bpick\|depth\|cloneopts\|pullopts\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(pick\|src\|multisrc\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(wait\|load\|unload\|if\|has\|subscribe\|on-update-of\|trigger-load\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(mv\|cp\|atclone\|atpull\|atinit\|atload\|atdelete\|make\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(as\|id-as\|compile\|nocompile\|service\|bindmap\|wrap-track\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(extract\|subst\|autoload\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(wrap\|ps-on-unload\|ps-on-update\)"+ skip=+\\"+ end=+"+ skipwhite contained

" ZI packages
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(param\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam

" Added by the existing annexes
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(fbin\|sbin\|gem\|node\|pip\|fmod\|fsrc\|ferc\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(dl\|patch\|submods\|cargo\|dlink\|dlink0\)"+ skip=+\\"+ end=+"+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceDoubleQuoteParam

syn match ZIIceDoubleQuoteParam +[^"]*+ contained

" Ices that takes a param enclosed in '
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(proto\|from\|ver\|bpick\|depth\|cloneopts\|pullopts\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(pick\|src\|multisrc\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(wait\|load\|unload\|if\|has\|subscribe\|on-update-of\|trigger-load\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(mv\|cp\|atclone\|atpull\|atinit\|atload\|atdelete\|make\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(as\|id-as\|compile\|nocompile\|service\|bindmap\|wrap-track\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(extract\|subst\|autoload\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(wrap\|ps-on-unload\|ps-on-update\)'+ skip=+\\'+ end=+'+ skipwhite contained

" ZI packages
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(param\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam

" Added by the existing annexes
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(fbin\|sbin\|gem\|node\|pip\|fmod\|fsrc\|ferc\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam
syn region ZIIceWithParam matchgroup=ZIIce start=+\s\%(dl\|patch\|submods\|cargo\|dlink\|dlink0\)'+ skip=+\\'+ end=+'+ skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
            \ contains=ZIIceSingleQuoteParam

syn match ZIIceSingleQuoteParam +[^']*+ contained

" Ices that doens't take a param
syn match ZIIce '\s\%(teleid\|svn\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(wait\|cloneonly\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(silent\|lucid\|notify\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(blockf\|nocompletions\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(run-atpull\|nocd\|make\|countdown\|reset\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s!\?\%(sh\|bash\|ksh\|csh\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(id-as\|nocompile\|reset-prompt\|trackbinds\|aliases\|light-mode\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue
syn match ZIIce '\s\%(is-snippet\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue

" Ices that doens't take a param, from ZI packages
syn match ZIIce '\s\%(pack\|git\|null\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue

" Ices that doens't take a param, added by the existing annexes
syn match ZIIce '\s\%(notest\|rustup\|default-ice\|skip\|debug\)\>'ms=s+1 skipwhite contained
            \ nextgroup=@ZILine,ZIContinue

" Additional Zsh and ZI functions
syn match ZshAndZIFunctions '\<\%(compdef\|compinit\|zpcdreplay\|zpcdclear\|zpcompinit\|zpcompdef\)\>'

" highlights
hi def link ZICommand             Statement
hi def link ZICommand             Title
hi def link ZIIceCommand          Title
hi def link ZIPluginCommand       Title
hi def link ZISnippetCommand      Title
hi def link ZIForCommand          zshRepeat
" hi def link ZIContinue            zshOperator
hi def link ZIPlugin              Macro
hi def link ZISnippet             Macro
hi def link ZIIce                 Type
hi def link ZIIceDoubleQuoteParam Special
hi def link ZIIceSingleQuoteParam Special
hi def link ZshAndZIFunctions     Keyword
