% Question 1. Implement sum/3.
% Example
% ?- sum(4, 10, Res)
% 	Res = 14

% Question 2. Implement is_positive_sum/1.
% Examples
% ?- is_positive_sum([1, 2, 3, -7]).
% 	false
% ?- is_positive_sum([1, 2, 3, -6, 1]).
% 	true

% Question 3. Given the following rules

map(X, @) :- X < 10.
map(X, *) :- X >= 10.

% Implement encrypt/2.
% Example
% ?- encrypt([2, 15, 5, 8], Res).
% 	Res = [@, *, @, @].

% Solutions

sum(N1, N2, Sum) :- Sum is N1 + N2.

get_sum([], 0).
get_sum([H|T], Sum) :- get_sum(T, TSum), Sum is TSum + H.
is_positive_sum(List) :- get_sum(List, Sum), Sum > 0.
% Or: you can use predefinde sum_list/2.. is_positive_sum(List) :- sum_list(List, Sum), Sum > 0.

encrypt([], []).
encrypt([H|T], Res) :- encrypt(T, Res1), map(H, HEncrypted), Res = [HEncrypted|Res1].