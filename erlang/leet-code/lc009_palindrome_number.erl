-module(lc009_palindrome_number).
-export([is_palindrome/1]).

% https://leetcode.com/problems/palindrome-number/description/

-spec list_of_digits(L :: integer(), Acc :: [integer()]) -> [integer()].
list_of_digits(0, Acc) -> Acc;
list_of_digits(Number, Acc) -> 
    list_of_digits(Number div 10, [Number rem 10 | Acc]).

-spec list_of_digits(L :: integer()) -> [integer()].
list_of_digits(Number) when Number < 10 -> [Number];
list_of_digits(Number) -> list_of_digits(Number, []).

% I could use lists:reverse, but I think it's better to create my own reverse function
-spec reverse(L :: [integer()], Acc :: [integer()]) -> [integer()].
reverse([], Acc) -> Acc;
reverse([H | T], Acc) ->
    reverse(T, [H | Acc]).

-spec reverse(L :: [integer()]) -> [integer()].
reverse(L) -> reverse(L, []).

-spec is_palindrome(X :: integer()) -> boolean().
is_palindrome(X) when X < 0 -> false; % Any negative number is not a palindrome
is_palindrome(0) -> true; % Zero is palindrome
is_palindrome(X) ->
    Digits = list_of_digits(X),
    ReverseDigits = reverse(Digits),
    % Here I should not sort the list, because I want to compare the order of the list. If I sort it, then every combination will be palindrome.
    Digits =:= ReverseDigits.
