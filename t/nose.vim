function! ValidItems()
    return filter(getqflist(), "v:val['valid'] ==# 1")
endfunction

describe 'use nose compiler to parse output from nose'
  before
    compiler nose
    let &makeprg="cat t/samples/nose.txt"
    make!
  end

  it 'populates the quickfix list with 23 items'
    Expect len(getqflist()) ==# 23
  end

  it 'populates the quickfix list with 2 valid items'
    Expect len(ValidItems()) ==# 2
  end

  it 'parses line six'
    let item = ValidItems()[0]
    Expect bufname(item['bufnr']) ==# 'links/tests.py'
    Expect item['text']           ==# "test_foo"
    Expect item['lnum']           ==# 5
  end

  it 'parses line fourteen'
    let item = ValidItems()[1]
    Expect bufname(item['bufnr']) ==# 'links/tests.py'
    Expect item['text']           ==# "test_bar"
    Expect item['lnum']           ==# 8
  end

end
