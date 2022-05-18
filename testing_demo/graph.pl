cls :- write('\e[2J').

edge(a,b).
edge(b,c).
edge(c,d).

path(X,X).
path(X,Y) :-
	edge(X,Z),
    path(Z,Y).

reachable(X,Y) :-
    path(X,Y), !.
reachable(X,Y) :-
    path(Y,X), !.