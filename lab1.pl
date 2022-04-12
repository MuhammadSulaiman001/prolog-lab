cls :- write('\e[2J'). % clear the console

/*To reload the file into prolog: Use make. */

/* 
- Facts:

john_is_cold.
raining.

- Predicates:

eats(fred,oranges).
eats(fred,t_bone_steaks).

- Variables:

% ?- eats(fred,FoodItem). % Use ; to investigate more solutions

*/

/*

Cindy likes everything that Bill likes
likes(cindy, Something):- likes(bill, Something).

Caitlin likes everything that is green
likes(caitlin, Something):- green(Something).

If human(X) then mortal(X):
moral(X) :- human(X).

*/

/*

hates(tom , jerry).
?- hates(tom,jerry).  true
?-hates(tom, Who).
?-hates(X, Y).
*/

/*
p(a,b).
p(b,c).
?-P(a, X), p(X,c).
*/

/*
parent(abo_ahmad, ahmad).
parent(um_ahmad, ahmad).
parent(abo_ahmad, hamida).
male(ahmad).
male(tarek).
male(omar).
female(salma).
female(samira).
female(hamida).

father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
child(X,Y) :- parent( Y,X).
daughter(X,Y) :- child(X,Y), female(X).
son(X,Y) :- child(X,Y), male(X).
sibling(X,Y) :- parent(Z,X),parent(Z,Y),X\=Y.
sister(X,Y):-     sibling(X,Y), female(X).
uncle (X,Y):- parent(Z,Y), brother(Z,X),
grandfather(X,Y):- male(X),    parent(X,Z),    parent(Z,Y).

ancestor(X,Y):- parent(Z,Y), ancestor(X,Z).
ancestor(X,Y):- parent(X,Y).

*/


