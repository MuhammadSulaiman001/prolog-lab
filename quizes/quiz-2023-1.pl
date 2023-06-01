% Question 1. Implement average/3
% Example:
% ?- average(4, 10, Res)
% 	Res = 7

% Question 2. Implement is_zero_sum/1
% Examples:
% ?- is_zero_sum([1, 2, 3, -6]).
% 	true
% ?- is_zero_sum([1, 2, 3, -6, 1]).
% 	false

% Question 3. Implement encrypt/2 (hint: use `char_code/2` to get the integer denoting the corresponding character)
% ?- encrypt([p, r, o, l, o, g], Res).
% 	Res = [112, 114, 111, 108, 111, 103].

% Solutions:

average(N1, N2, Res) :- Res is (N1 + N2)/2.

get_sum([], 0).
get_sum([H|T], Sum) :- get_sum(T, TSum), Sum is TSum + H.
is_zero_sum(List) :- get_sum(List, Sum), Sum =:= 0. % or Sum = 0
% Or: you can use predefinde sum_list/2.. is_zero_sum(List) :- sum_list(List, Sum), Sum =:= 0.

encrypt([], []).
encrypt([H|T], Res) :- encrypt(T, Res1), char_code(H, HEncrypted), Res = [HEncrypted|Res1].