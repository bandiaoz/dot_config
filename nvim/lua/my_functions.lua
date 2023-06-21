local M = {}
local fmt = string.format
local tt = require'toggleterm'

local function termexec(cmd, num, go_back, open)
    tt.exec(cmd, num, nil, nil, nil, go_back, open)
end

function M.compile(toDebug)
    vim.cmd('write')
    local ft = vim.o.filetype
    local fnWEx = vim.fn.expand('%') -- filename with extension
    local fnWOEx = vim.fn.expand('%<')
    if ft == 'cpp' or ft == 'c' or ft == 'cc' then
        local debug_cmd="g++-11 -g -O0 -D_GLIBCXX_DEBUG_PEDANTIC -D_GLIBCXX_DEBUG -DLOCAL -std=c++17"
        if toDebug then
            vim.cmd(fmt('! %s %s -o %s', debug_cmd, fnWEx, fnWOEx))
            -- vim.cmd('!' .. debug_cmd .. fnWEx .. ' -o ' .. fnWOEx)
        else
            vim.cmd('!gcomp ' .. fnWOEx)
        end
    elseif ft == 'tex' then
        vim.cmd('VimtexCompile')
    end
    require'toggleterm.terminal'.get(1):is_open() -- move focus to terminal
end

M.compileAndRun = function (toTest)
    vim.cmd('write')
    local dir = vim.fn.expand('%:p:h')
    local ft = vim.o.filetype
    local fnWEx = vim.fn.expand('%') -- filename with extension
    local fnWOEx = vim.fn.expand('%<') -- filename without extension
    termexec("cd " .. dir, 1)
    if ft == 'cpp' or ft == 'c' or ft == 'cc' then
        if toTest then
            termexec(fmt('ccomp %s && cp_test %s', fnWOEx, fnWOEx), 1, false)
        else
            termexec(fmt('ccomp %s && ./%s', fnWOEx, fnWOEx), 1, false)
        end
    elseif ft == 'python' then
        termexec(fmt('python3 %s', fnWEx), 1)
    elseif ft == 'rust' then
        termexec('cargo run')
    end
end

function M.expand_cpp()
    vim.cmd('write')
    local ft = vim.o.filetype
    if ft == 'cpp' or ft == 'c' or ft == 'cc' then
        vim.cmd('!expand_cpp %')
    end
end

return M
