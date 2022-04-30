# Lecture2

### LECTURE1 REVISITED 

[Issue #1](/../../issues/1)

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

## Data types

1. Atoms: ahmad, true.

2. Numbers: 1

3. Variables: Ahmad

4. Predicates: line(point(X1,Y1),point(X2,Z2)).


## Unification

| Query | Unified? |
| ---- | ----|
| eats(fred, tomatoes) = eats(Whom, What)  | yes: Whom = fred and What = tomatoes |
| eats(fred, Food) = eats(Person, jim) | yes: Person = fred and Food = jim |
| cd(29, beatles, sgt_pepper). = cd(A, B, help) | no: sgt_pepper and help do not unify |
| f(X, a) = f(a, X) | yes: X = a |
| likes(jane, X) = likes(X, jim) | no: X can not be bound to both jane and jim
| f(X, Y) = f(P, P) | yes: X = P and Y = P. |
| f(foo, L) = f(A1, A1) | yes:  A1 = foo and A1 = L. Hence L = foo |
| k(s(g), t(k))  =  k(X, t(Y)). | yes: X = s(g) and Y = k |
| k(s(g), Y)  =  k(X, t(k)). | yes: X = s(g)  and Y = t(k) | 
| [a, b, c]  =  X. | yes: X = [a, b, c] | 
| [a, b, c]  =  [X, Y, Z]. | yes: X = a, Y = b and Z = c |
| 3 = 3. | yes |
| 3 = 2 + 1. | no |
| 3 =:= 2 + 1. | yes, so '=' is a unification operator whereas =:= is the numeric quality operator. |


### Assessment

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


Keep in mind that you can use the template/rule for either exploration or validation.

- exploration: R  is  mod(7,2). 
- validation:  1  is  mod(7,2). 

### Assessment

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

Remember:

    ?- 4 = 4. % true, not because 4 equals 4, but because string 4 matches with string 4, like a = a.
    ?- 2+2 = 4. % so this will return false..
    ?- 2+2 =:= 4. % this is a valid arithmetic


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

## Assessment

What is the output?

    ?-  X  =  3,  X  <  4.
    ?-  X  =  b,  X  <  4.

Write a suitable rule to:

1. add/3, add X to Y and put result in Z

    <details>
    <summary>Solution</summary>

        add(X,Y, Z):- Z is X + Y.

    </details>

2. abs/2, Absolute value of X, put the result in Y

    <details>
    <summary>Solution</summary>

        abs(X, Y):- X >= 0, Y is X; Y is -X.

    </details>

3. my_print/1, print the numbers from 0 to N

    <details>
    <summary>Solution</summary>
        
        my_print(0) :- write(0).
        my_print(N) :- N1 is N - 1, my_print(N1), write(N), nl. % this will print the numbers from 0 to N
        /*
            but if the recursive call executed after the write instruction, then the numbers will be printed in descending order (from N to 0)
            my_print(N) :- write(N), nl, N1 is N - 1و my_print(N1). % this will print the numbers from N to 0
        */
       
    </details>

4. sum/2, Sum on numbers from 0 to N, put the result in Res

    <details>
    <summary>Solution</summary>
        
        % sum the numbers from 0 to N-1 then add N to the result.
        sum(0, 0).
        sum(N, Res):-N > 0, N1 is N-1, sum(N1, Res1), Res is Res1 + N.
    </details>

5. mult/2, do X * Y recursivly and but the result in Z

    <details>
    <summary>Solution</summary>
        
        mult(X,0, 0).
        mult(0,X, 0).
        mult(X,Y, Z):- X > 0, Y > 0,  Y1 is Y-1, mult(X, Y1, Z1), Z is Z1 + X.
    </details>

6. Factorial

    <details>
    <summary>Solution</summary>

        factorial(0,1).
        factorial(X,Y) :- X>0, X1 is X -1, factorial(X1,Y1), Y is Y1*X.

    </details>

______________
*EOL*