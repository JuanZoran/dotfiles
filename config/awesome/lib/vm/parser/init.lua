require 'color'
local new_stack = (function()
    ---@class stack
    ---@field size number
    ---@field [integer] any
    local mt = {
        ---Pop the top element of the stack
        ---@param self stack
        ---@return any _ The top element
        pop = function(self)
            assert(not self:empty(), 'Stack is empty')

            local size = self.size
            local value = self[size]
            self[size] = nil
            self.size = size - 1
            return value
        end,

        ---Peek the top element of the stack
        ---@param self stack
        ---@return any _ The top element
        top = function(self)
            return self[self.size]
        end,

        ---Push an element into the stack
        ---@param self stack
        ---@param value any _ The element to push
        push = function(self, value)
            self.size = self.size + 1
            self[self.size] = value
        end,

        ---Check if the stack is empty
        ---@param self stack
        ---@return boolean _ True if the stack is empty
        empty = function(self)
            return self.size == 0
        end,
    }
    mt.__index = mt

    ---Stack constructor
    ---@return stack
    return function()
        return setmetatable({
            size = 0,
        }, mt)
    end
end)()

-- Convert RE into Postfix expression
---@param str string Regular Expression
local function toPostfix(str)
    local postfix = ''
    local st = new_stack()
    local priority = {
        ['('] = 1,
        ['|'] = 2,
        ['*'] = 4,
    }

    for i = 1, #str do
        local char = str:sub(i, i)
        if char == '(' then
            st:push(char)
        elseif char == ')' then
            while not st:empty() and st:top() ~= '(' do
                postfix = postfix .. st:pop()
            end

            if st:top() == '(' then
                st:pop()
            end

        elseif priority[char] then
            while not st:empty() and (priority[st:top()] or -1) >= priority[char] do
                postfix = postfix .. st:pop()
            end

            st:push(char)
        else
            st:push(char)
        end
    end

    while not st:empty() do
        postfix = postfix .. st:pop()
    end
    return postfix
    --     local char = str:sub(i, i)
    --     if char == '(' then
    --         table.insert(stack, char)
    --     elseif char == ')' then
    --         while stack[#stack] ~= '(' do
    --             postfix = postfix .. stack[#stack]
    --             table.remove(stack)
    --         end
    --         table.remove(stack)
    --     elseif priority[char] then
    --         while priority[stack[#stack]] and priority[stack[#stack]] >= priority[char] do
    --             postfix = postfix .. stack[#stack]
    --             table.remove(stack)
    --         end
    --         table.insert(stack, char)
    --     else
    --         postfix = postfix .. char
    --     end
    -- end
    -- while #stack > 0 do
    --     postfix = postfix .. stack[#stack]
    --     table.remove(stack)
    -- end
    -- return postfix
end

-- Convert Postfix expression into NFA


-- Convert NFA into DFA


-- Convert DFA into Minimized DFA


-- Convert Minimized DFA into DFA table


local RE = io.read()
local postfix = toPostfix(RE)
print('Parse result: ' .. postfix)
