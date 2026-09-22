-module(lc003_longest_substring).
-export([length_of_longest_substring/1]).

% https://leetcode.com/problems/longest-substring-without-repeating-characters/

% I will need an auxiliary list to get the streak
% If the current element is not member of the auxiliary list, add to the list and save the result in an accumulator
% If not, reset the auxiliary list
% Return the function with the Tail of the character list, the auxiliary list and the accumulator
-spec count_length(CharList :: [string()], Streak :: [string()], StreakLength :: integer(), LongestLength :: integer()) -> integer().
count_length([], _, StreakLength, LongestLength) ->
    if
       StreakLength > LongestLength -> StreakLength;
       true -> LongestLength
    end;
count_length([HeadCL | TailCL], Streak, StreakLength, LongestLength) ->
    case lists:member(HeadCL, Streak) of
    false ->
        CurrentLength = StreakLength + 1,
        Length = if 
                    CurrentLength > LongestLength -> CurrentLength;
		    true -> LongestLength
		end,
        count_length(TailCL, [HeadCL | Streak], CurrentLength, Length);
   true ->
        Length =  if 
                    StreakLength > LongestLength -> StreakLength;
		    true -> LongestLength
		end,
        Kept = lists:takewhile(fun(E) -> E =/= HeadCL end, Streak),
        NewStreak =[HeadCL | Kept],
        NewStreakLen = length(NewStreak),
        count_length(TailCL, NewStreak, NewStreakLen, Length)
    end.

-spec count_length(CharList :: [string()]) -> integer().
count_length(CharList) ->
    count_length(CharList, [], 0, 0).

-spec length_of_longest_substring(S :: unicode:unicode_binary()) -> integer().
length_of_longest_substring(S) ->
    String = unicode:characters_to_list(S),
    CharList = [[C] || C <- String],
    count_length(CharList).
