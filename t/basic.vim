describe 'using default errorformat to parse output from gcc'
  before
    let &makeprg="cat t/samples/gcc.txt"
    set errorformat&
    make!
  end

  it 'populates the quickfix list with two items'
    Expect len(getqflist()) ==# 2
  end

  it 'parses line one'
    let item = getqflist()[0]
    Expect bufname(item['bufnr']) ==# 'wakeup.c'
    Expect item['lnum'] ==# 68
    Expect item['text'] ==# " error: conflicting types for 'generatePacket'"
  end

  it 'parses line two'
    let item = getqflist()[1]
    Expect bufname(item['bufnr']) ==# 'wakeup.h'
    Expect item['lnum'] ==# 3
    Expect item['text'] ==# " error: previous declaration of 'generatePacket' was here"
  end

end
