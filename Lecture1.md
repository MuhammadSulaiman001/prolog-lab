# Lecture1


## Facts

    john_is_cold.
    raining.


## Predicates

    eats(fred,oranges).
    eats(fred,apple).
    travel(ahmad, place1, place2, train).


## Natural Language -> prolog


- example1:

Cindy likes everything that Bill likes

    likes(cindy, Something):- likes(bill, Something).

- example2:

Caitlin likes everything that is green

    likes(caitlin, Something):- green(Something).

- example3:

If human(X) then mortal(X):

    moral(X) :- human(X).


## Variables
    ?- eats(fred,FoodItem). 
    ?- eats(X, Y).

Use `;` to investigate more solutions if exist.

## Recursion

```
parent(abo_abo_abo_ahmad, abo_abo_ahmad).
parent(abo_abo_ahmad, abo_ahmad).
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
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(Z,Y), ancestor(X,Z).
```
Query:

```
?- ancestor(abo_abo_abo_ahmad, ahmad).
?- ancestor(abo_abo_abo_ahmad, Ahmad).
```

## Utilities

- % Single line comment 
- /* Mutli-Line comment */
- Clear-console rule:

```
cls :- write('\e[2J').
```
- To reload the file into prolog: Use this command
```
?- make.
```

__________
*EOL*