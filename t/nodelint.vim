describe 'use nodelint compiler to parse output from nodelint'
  before
    compiler nodelint
    let &makeprg="cat t/samples/nodelint.txt"
    make!
  end

  it 'populates the quickfix list with five items'
    Expect len(getqflist()) ==# 5
  end

  it 'parses item one'
    let item = getqflist()[0]
    Expect bufname(item['bufnr']) ==# 'fizzbuzz.js'
    Expect item['text']           ==# "Unexpected '++'."
    Expect item['lnum']           ==# 2
    Expect item['col']            ==# 22
  end

  it 'parses item two'
    let item = getqflist()[1]
    Expect bufname(item['bufnr']) ==# 'fizzbuzz.js'
    Expect item['text']           ==# "Expected '===' and instead saw '=='."
    Expect item['lnum']           ==# 3
    Expect item['col']            ==# 15
  end

end
