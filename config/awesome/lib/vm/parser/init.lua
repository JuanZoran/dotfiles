require 'color'
local new = require 'data'
local sub = string.sub
local priority = {
    ['('] = 1,
    [')'] = 1,
    ['|'] = 2,
    ['^'] = 3,
    ['*'] = 4,
}

---Do pre-process on regular expression
---@param str string
---@return queue
local pre_process = function(str)
    -- INFO : Add concat operator
    local q = new.queue()
    local concat_operator = '^'
    local function should_concat()
        local back = q:back()
        return not priority[back] or back == '*'
    end

    for i = 1, #str do
        local char = sub(str, i, i)
        local not_operator = not priority[char]

        if q:empty() then
            assert((char == '(' or not_operator), 'Invalid regular expression')
            q:push(char)
        else
            if (char == '(' or not_operator) and should_concat() then
                q:push(concat_operator)
            end

            q:push(char)
        end
    end

    -- for k, v in pairs(q) do
    --     print(k, v)
    -- end
    -- print('================')

    -- INFO : To PostFix
    local st = new.stack()
    local result = new.queue()
    while not q:empty() do
        local char = q:pop()

        if not priority[char] then
            result:push(char)
        else
            if char == '(' then
                st:push(char)
            elseif char == ')' then
                -- INFO :This will invoke assert failed when st empty
                while st:top() ~= '(' do
                    result:push(st:pop())
                end

                st:pop()
            else
                while not st:empty() and priority[st:top()] >= priority[char] do
                    result:push(st:pop())
                end
                st:push(char)
            end
        end
    end

    while not st:empty() do
        result:push(st:pop())
    end

    return result
end

-- Convert Postfix expression into NFA
---@param postfix_queue queue
local function toNFA(postfix_queue)
    local st = new.stack()
    local strategy = {
        ['^'] = function()
            local nfa1 = st:pop()
            local nfa2 = st:pop()

            st:push(nfa1:concat(nfa2))
        end,
        ['*'] = function()
            st:top():closure()
        end,

        ['|'] = function()
            local nfa1 = st:pop()
            local nfa2 = st:pop()

            st:push(nfa1:union(nfa2))
        end,
    }
    while not postfix_queue:empty() do
        local char = postfix_queue:pop()
        local not_operator = not priority[char]

        if not_operator then
            st:push(new.nfa(char))
        else
            strategy[char]()
        end
    end


    assert(st.size == 1, 'Invalid regular expression')
    return st:top()
end


-- Convert NFA into DFA


-- Convert DFA into Minimized DFA


-- Convert Minimized DFA into DFA table


local RE = io.read()
-- local q = pre_process(RE)
pretty_print_table(toNFA(pre_process(RE)))
