-module(lc012_integer_to_roman).
-export([int_to_roman/1]).

; https://leetcode.com/problems/integer-to-roman/description/
roman_dictionary() ->
    [{1000, "M"}, {900, "CM"}, {500, "D"},
     {400, "CD"}, {100, "C"}, {90, "XC"},
     {50, "L"}, {40, "XL"}, {10, "X"},
     {9, "IX"}, {5, "V"}, {4, "IV"},
     {1, "I"}].

% If number is greater than key, mantain the dictionary
% If not, remove the head from list, and pass the tail to the dictionary
translate(_, Number, Acc) when Number =< 0 ->
    Acc;
translate([], _, Acc) ->
    Acc;
translate(Dictionary, Number, Acc) ->
    [{Key, Value} | Tail] = Dictionary,
    if
	Number >= Key ->
	    translate(Dictionary, Number - Key, Acc ++ Value);
	true ->
	    translate(Tail, Number, Acc)
    end.

-spec int_to_roman(Num :: integer()) -> unicode:unicode_binary().
% As its expected a binary result, I need to translate string to binary
int_to_roman(0) ->
    <<>>;
int_to_roman(Num) ->
    Dictionary = roman_dictionary(),
    Result = translate(Dictionary, Num, ""),
    list_to_binary(Result).
