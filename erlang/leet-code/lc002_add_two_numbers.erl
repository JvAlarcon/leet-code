-module(lc002_add_two_numbers).
-export([add_two_numbers/2]).

% https://leetcode.com/problems/add-two-numbers
% The problem states that we need to sum the numbers of two lists and returns a linked list.
% But the problem gives us the spec with a record, so I need to handle the linked list with that record
-record(list_node, {val = 0 :: integer(),
                    next = null :: null | #list_node{}}).

-spec get_node_info(Node :: #list_node{} | null) -> #list_node{} | null.
get_node_info(null) ->
    {0, null};
get_node_info(#list_node{val = Value, next = Next}) ->
    {Value, Next}.

-spec add_elements(List1 :: #list_node{} | null, List2 :: #list_node{} | null, Carry :: integer(), Acc :: #list_node{} | null) -> #list_node{} | null.
add_elements(null, null, 0, Acc) ->
    Acc;
add_elements(List1, List2, Carry, Acc) ->
    {Value1, Next1} = get_node_info(List1),
    {Value2, Next2} = get_node_info(List2),
    Sum = Value1 + Value2 + Carry,
    Digit = Sum rem 10,
    NewCarry = Sum div 10,
    NewNode = #list_node{ val = Digit, next = Acc}, 
    add_elements(Next1, Next2, NewCarry, NewNode).

-spec reverse_list_node(ListNode :: #list_node{} | null, Acc :: #list_node{} | null) -> #list_node{} | null.
reverse_list_node(null, Acc) ->
    Acc;
reverse_list_node(#list_node{val = Value, next = Next}, Acc) ->
    reverse_list_node(Next, #list_node{val = Value, next = Acc}).

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
    InvertedResult = add_elements(L1, L2, 0, null),
    reverse_list_node(InvertedResult, null).
