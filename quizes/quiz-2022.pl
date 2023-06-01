% Implement get_numbers/2

% Example.
% ?- get_numbers([a,b,1,2,c,q,4,1], Numbers).
%	Numbers = [1,2,4,1].

% Q2- get_avg/2, hint: you can either use get_numbers/2 or not!

% Example.
% ?- get_avg([a,b,1,2,c,q,4,1], Result).
%	Result = 2

% Solutions

% get_numbers/2

get_numbers([], []).
get_numbers([H|T], [H|Numbers]) :- integer(H), get_numbers(T, Numbers), !.
get_numbers([H|T], Numbers) :- get_numbers(T, Numbers), !.

% get_avg/2

% Solution 1 (if you solve get_numbers/2, you can create sum/2, then use them in one call to solve get_avg/2)

sum([], 0).
sum([H|T], Sum) :- sum(T, TSum), Sum is TSum + H.

get_avg_solution2(List, Result) :- get_numbers(List, ListOfNumbers), sum(ListOfNumbers, Sum), 
								   length(ListOfNumbers, Length), 
								   Result is Sum / Length.

% Solution 2 (without using get_numbers/2)

get_avg(List, Result) :- get_avg(List, 0, 0, Result).
get_avg([], Sum, Count, Result) :- Result is Sum / Count.
get_avg([H|T], Sum, Count, Result):- integer(H), NewCount is Count + 1, NewSum is Sum + H, get_avg(T, NewSum, NewCount, Result), !.
get_avg([H|T], Sum, Count, Result):- get_avg(T, Sum, Count, Result), !.