if exists("current_compiler")
  finish
endif
let current_compiler = "nodelint"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=
      \%A%f\\,\ line\ %l\\,\ character\ %c:\ %m,
      \%Z%.%#,
      \%-G%.%#

CompilerSet makeprg=NODE_DISABLE_COLORS=1\ nodelint\ %

