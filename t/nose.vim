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
    let valid_count = 0
    for item in getqflist()
      if item['valid'] ==# 1
        let valid_count = valid_count + 1
      endif
    endfor
    Expect valid_count ==# 2
  end

  it 'parses line six'
    let item = getqflist()[5]
    Expect bufname(item['bufnr']) ==# 'links/tests.py'
    Expect item['text']           ==# "test_foo"
    Expect item['lnum']           ==# 5
  end

  it 'parses line fourteen'
    let item = getqflist()[13]
    Expect bufname(item['bufnr']) ==# 'links/tests.py'
    Expect item['text']           ==# "test_bar"
    Expect item['lnum']           ==# 8
  end

end
