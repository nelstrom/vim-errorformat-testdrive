if exists("current_compiler")
  finish
endif
let current_compiler = "nose"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%A\ %f\ line\ %l\ in\ %m
CompilerSet makeprg=nose\ %
