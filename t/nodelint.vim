describe 'use nodelint compiler to parse output from nodelint'
  before
    let &makeprg="cat t/samples/nodelint.txt"
    let &l:efm='%A'
    let &l:efm.='%f\, '
    let &l:efm.='line %l\, '
    let &l:efm.='character %c:'
    let &l:efm.='%m' . ','
    let &l:efm.='%Z%.%#' . ','
    let &l:efm.='%-G%.%#'
    make!
  end

  it 'populates the quickfix list with five items'
    Expect len(getqflist()) ==# 5
  end

  it 'parses item one'
    let item = getqflist()[0]
    Expect bufname(item['bufnr']) ==# 'fizzbuzz.js'
    Expect item['text']           ==# " Unexpected '++'."
    Expect item['lnum']           ==# 2
    Expect item['col']            ==# 22
  end

  it 'parses item two'
    let item = getqflist()[1]
    Expect bufname(item['bufnr']) ==# 'fizzbuzz.js'
    Expect item['text']           ==# " Expected '===' and instead saw '=='."
    Expect item['lnum']           ==# 3
    Expect item['col']            ==# 15
  end

end
