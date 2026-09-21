-module('reverse_bits').
-export([reverse_bits/1,
              convert_number_to_binary_string/1,
              reverse/1,
              convert_binary_int_to_decimal/1]).

% https://leetcode.com/problems/reverse-bits/

-spec convert_number_to_binary_string(N :: integer(), Acc :: string()) -> string().
convert_number_to_binary_string(N, Acc) when N =< 0 ->
    Acc;
convert_number_to_binary_string(N, Acc) ->
    NewNumber = N div 2,
    Rest = integer_to_list(N rem 2),
    convert_number_to_binary_string(NewNumber, Rest ++ Acc).

-spec convert_number_to_binary_string(N :: integer()) -> [string()].
convert_number_to_binary_string(N) ->
    Text = convert_number_to_binary_string(N, ""),
    BinString = string:right(Text, 32, $0),
    [[C] || C <- BinString].

-spec reverse(L :: [integer()], Acc :: [integer()]) -> [integer()].
reverse([], Acc) -> Acc;
reverse([H | T], Acc) ->
    reverse(T, [H | Acc]).

-spec reverse(L :: [integer()]) -> [integer()].
reverse(L) -> reverse(L, []).

-spec convert_binary_int_to_decimal(L :: [integer()], Acc :: integer()) -> integer().
convert_binary_int_to_decimal([], Acc) ->
    Acc;
convert_binary_int_to_decimal([H | T], Acc) ->
    convert_binary_int_to_decimal(T, Acc * 2 + H).

-spec convert_binary_int_to_decimal(L :: [integer()]) -> integer().
convert_binary_int_to_decimal(List) ->
    convert_binary_int_to_decimal(List, 0).

-spec reverse_bits(N :: integer()) -> integer().
reverse_bits(N) ->
    BinaryDigits = convert_number_to_binary_string(N),
    ReversedList = reverse([list_to_integer(X) || X <- BinaryDigits]),
    convert_binary_int_to_decimal(ReversedList).
