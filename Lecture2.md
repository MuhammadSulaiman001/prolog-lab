# Lecture2

LECTURE1 REVISITED [Issue #1](/MuhammadSulaiman001/prolog-lab/issues/1)

Write the following sentences in prolog syntax:
1. ahmad likes everything omar likes.
2. human is mammal.
3. ahmad hits the ball with his rod.
4. if somebody studies he will succeed.
5. X hates everybody who loves dogs or hates cats.
6. X hates everybody who loves dogs and hates cats.
7. X loves everybody who has money and is pretty.
8. Who ate my pizza?
_______


## Unification

| Fact | Query | Unified? |
| ---- | ---- | ----|
| eats(fred, tomatoes) | eats(Whom, What)  | yes: Whom = fred and What = tomatoes |
| eats(fred, Food) | eats(Person, jim) | yes: Person = fred and Food = jim |
| cd(29, beatles, sgt_pepper). | cd(A, B, help) | no: sgt_pepper and help do not unify |
| f(X, a) | f(a, X) | yes: X = a |
| likes(jane, X) | likes(X, jim) | no: X can not be bound to both jane and jim
| f(X, Y) | f(P, P) | yes: X = P and Y = P. |
| f(foo, L) | f(A1, A1) | yes:  A1 = foo and A1 = L. Hence L = foo |
|  | k(s(g), t(k))  =  k(X, t(Y)). | yes: X = s(g) and Y = k |
|  | k(s(g), Y)  =  k(X, t(k)). | yes: X = s(g)  and Y = t(k) | 
   

## Recursion

1. Stopping Criteria

        rec_rule(0, 1):- true.

2. Recursive Call (mentioning)

    2.1 Direct 

        rec_rule(X,Y):- some_rule(Z,Y), rec_rule(X,Z).

    2.2 Indirect

        rec_rule(X,Y):- some_rule(Z,Y).
        some_rule(X, Y):- some_rule2(X), some_rule3(X), some_rule4(Y), rec_rule(X, Y).

### Example:

```
parent(abo_abo_abo_ahmad, abo_abo_ahmad).
parent(abo_abo_ahmad, abo_ahmad).
parent(abo_ahmad, ahmad).

ancestor(X,Y):- parent(X,Y). % Stopping criteria
ancestor(X,Y):- parent(Z,Y), ancestor(X,Z). % recursive call

?- ancestor(abo_abo_abo_ahmad, ahmad).
```

## Data types

1. Atoms: `ahmad`

2. Numbers: `1`

3. Variables: `Ahmad`

4. Predicates: `line(point(X1,Y1),point(X2,Z2)).`

### S. Assessment

1. Validate that some line is vertical.
2. Validate that some line is horizontal.

```
vertical(line(point(X,Y),point(X,Z))). 
horizontal(line(point(X,Y),point(Z,Y))).

?- vertical(line(point(0,0), point(0,10))).
?- vertical(line(point(0,0), point(10,0))).
?- horizontal(line(point(0,0), point(0,10))).
?- horizontal(line(point(0,0), point(10,0))).
?- vertical(line(point(0,0), point(10,10))).
?- horizontal(line(point(0,0), point(10,10))).
``` 

## Arithmetic

    ?- 8  is  6+2.
    ?- 12  is  6*2.
    ?- 4  is  6-2.
    ?- -2  is  6-8.
    ?- 3  is  6/2.
    ?- 3  is  7/2.
    ?- 1  is  mod(7,2).
    ?- X  is  6+2. 
    ?- R  is  mod(7,2). 

### S. Assessment

Write some rule that takes a number, add 3 to it, double it and output the result.

     add_3_and_double(X,Y) :-  Y is (X+3) * 2.

     ?- add_3_and_double(2,X). 

## Comparing Integers

    ?- 2 < 4. 
    ?- 2 =< 4. 
    ?- 4 =< 4. 
    ?- 4 =:= 4. 
    ?- 4 =\= 5. 
    ?- 4 =\= 4. 
    ?- 4 >= 4. 
    ?- 4 > 2. 
    ?- 2 < 4+1. 
    ?- 2+1 < 4. 
    ?- 2+1 < 3+2.

### Notes:

    ?- 4 = 4. % true bcz unification held
    ?- 2+2 = 4. % see..
    ?- 2+2 =:= 4. % this is a valid one


## S. Assessment

What is the output?

    ?-  X  =  3,  X  <  4.
    ?-  X  =  b,  X  <  4.

Write a suitable rule to:

1. Add X to Y and put result in Z

    <details>
    <summary>Solution</summary>

        Add(X,Y, Z):- Z is X + Y.

    </details>

2. Sum on numbers from 0 to X

    <details>
    <summary>Solution</summary>

        sum(0,0).
        sum(X,Y):-X>0,X1 is X-1, sum(X1,Y1),Y is Y1+X.
    </details>

3. Factorial

    <details>
    <summary>Solution</summary>

        factorial(0,1).
        factorial(X,Y):-X>0, X1 is X -1, factorial(X1,Y1), Y is Y1*X.

    </details>

4. Generate the N-th element of the Fibonacci series

    <details>
    <summary>Solution</summary>

    ```
        fib(0, 0).
        fib(1, 1).
        fib(N, F) :-  N > 1,  N1 is N - 1,  N2 is N - 2,  fib(N1, F1),  fib(N2, F2),  F is F1 + F2.
    ```

    </details>

Given a directed graph like the following:

    link(node1, node2).
    link(node1, node3).
    link(node2, node3).
    link(node2, node5).
    link(node2, node6).
    
Write a suitable rule to check if there is a connection between node1 and node6.

<details>
  <summary>Solution</summary>

    connection_valid(From, To) :- link(From, To).
    connection_valid(From, To) :- link(From, Temp_Node), connection_valid(Temp_Node, To), !.

</details>


______________
*EOL*