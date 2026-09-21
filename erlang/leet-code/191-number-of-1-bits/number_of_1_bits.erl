-module('number_of_1_bits').
-export([hamming_weight/1]).

% https://leetcode.com/problems/number-of-1-bits/
% First, convert the integer to it's binary representation in string
% After that, split the string into a list
% Convert the list of string into list of integer
% Count only the 1 presents

-spec convert_number_to_binary_string(N :: integer(), Acc :: string()) -> string().
convert_number_to_binary_string(N, Acc) when N =< 0 ->
    Acc;
convert_number_to_binary_string(N, Acc) ->
    NewNumber = N div 2,
    Rest = integer_to_list(N rem 2),
    convert_number_to_binary_string(NewNumber, Acc ++ Rest).

-spec hamming_weight(N :: integer()) -> integer().
hamming_weight(N) ->
    BinaryString = convert_number_to_binary_string(N, ""),
    CharList = [[C] || C <- BinaryString],
    NumberList = [list_to_integer(X) || X <- CharList],
    FilteredList = lists:filter(fun(E) -> E == 1 end, NumberList),
    lists:foldl(fun(E, Acc) -> E + Acc end, 0, FilteredList).
