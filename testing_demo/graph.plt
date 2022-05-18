:- begin_tests(graph).
:- include(graph).

test(1) :-
    reachable(a,a).
test(2) :-
    reachable(a,d).
test(3) :-
    reachable(d,a).
test(4) :-
    not(reachable(d,m)).
	

:- end_tests(graph).