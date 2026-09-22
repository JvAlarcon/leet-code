-module(lc013_roman_to_integer).
-export([roman_to_int/1]).

% https://leetcode.com/problems/roman-to-integer/description/

roman_dictionary() ->
    List = [{"M", 1000}, {"D", 500}, {"C", 100},
            {"L", 50}, {"X", 10}, {"V", 5},
            {"I", 1}],    
    maps:from_list(List).

% Split the input string into a list
% Iterate through the char list, not dictionary
% If the current letter value is less than the next letter value, subtract and return the tail list
% Otherwise, sum it and return the tail list
% When the input list if empty, return the accumulator
translate(_, [], Acc) ->
    Acc;
translate(Dictionary, CharList, Acc) ->
    [CurrentHead | CurrentTail] = CharList,
    NextHead = case CurrentTail of
		   [Next | _] -> Next;
		   [] -> empty
	       end,
    CurrentNumber = maps:get(CurrentHead, Dictionary),
    NextNumber = maps:get(NextHead, Dictionary, 0),
    if
	CurrentNumber < NextNumber ->
	    [_ | NextTail] = CurrentTail,
	    translate(Dictionary, NextTail, Acc + (NextNumber - CurrentNumber));
	true ->
	     translate(Dictionary, CurrentTail, Acc + CurrentNumber)
    end.

%TODO add error message when roman token does not exists

-spec roman_to_int(S :: unicode:unicode_binary()) -> integer().
roman_to_int(S) ->
    String = unicode:characters_to_list(S),
    Dictionary = roman_dictionary(),
    CharList = [[C] || C <- String],
    translate(Dictionary, CharList, 0).
