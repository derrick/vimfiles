function! RunSpec(args)
  execute ":wa"
  if exists("b:rails_root") && filereadable(b:rails_root . "/script/spec")
  let spec = b:rails_root . "/script/spec"
  else
    let spec = "bundle exec rspec"
  endif
  let cmd = ":! " . spec . " % -cfn " . a:args
  execute cmd
endfunction

"map ,S :call RunSpec("-l " . <C-r>=line('.')<CR>)<CR>
"map ,s :call RunSpec("")<CR>

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :wa
    :silent !echo;echo;echo;echo;echo
    if exists("script/test")
      exec ":!script/test " . a:filename
    else
      exec ":!RACK_ENV=test bundle exec rspec -cb " . a:filename
    endif
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if !in_spec_file
      let in_spec_file = match(expand("%"), '_spec.js$') != -1
    end
    if !in_spec_file
      let in_spec_file = match(expand("%"), '_spec.coffee') != -1
    end
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>


