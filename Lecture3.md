# Lecture3

### LECTURE2 REVISITED: [Issue #2](/../../issues/2)

## Exercise 1:

The term in Fibonacci Series is defined as the sum of the previous 2 terms' values, i.e: `1,1,2,3,5,8,13,...`

Define `fib/2` , where the first parameter is the term index (starts from 1), the second parameter is the term value. 

```prolog
% Sample Queries:
?- fib(4, Res)
    Res = 3
?- fib(5, Res)
    Res = 5
?- fib(6, Res)
    Res = 8
```

## Exercise 2:

Given a directed graph like the following:

```prolog
% facts
link(node1, node2).
link(node1, node3).
link(node2, node3).
link(node2, node5).
link(node2, node6).
```

    

Define `connection_valid/2` , to check if there is a connection between two nodes.

```prolog
% Sample Queries:
?- connection_valid(node1, node6).
    true
?- connection_valid(node3, node5).
    false
```

_______

## Exercises

### **`meter_2_killo/2`**

```prolog
meter_2_killo(Killo, Meter) :- Meter is Killo * 1000;
```

### **`calc_distance/3`**

```prolog
calc_distance(Speed, Time, Distance) :- Distance is Speed * Time.
```

### **`calc_distance/2`**

```prolog
car_speed(blue_car, 50).
stopwatch(blue_car, 10).

calc_distance(Car, Distance) :- car_speed(Car, Speed), stopwatch(Car, Time),
                                calc_distance(Speed, Time, Distance).

% ?- calc_distance(blue_car, Distance).
    Distance = 500.
```

### **`dist/3`** Euclidean distance between two points

sqrt/2 is predefined, try ?- sqrt(25, X). in the command-line.

```prolog
distance(point(X, Y), point(X1,Y1), Res) :- 
                Z1 is X-X1, Z2 is Y-Y1, 
                Z3 is Z1*Z1, Z4 is Z2*Z2, 
                Z5 is Z3+Z4, 
                sqrt(Z5,Res).

% ?- distance(point(0, 0), point(3, 4), X).  
%    X = 5.
```

### **`is_natural/3`**

```prolog
is_natural(0).
is_natural(X):- X > 0, X1 is X - 1, is_natural(X1).
```

### **`gcd/3`** Greatest Common Divisor

Definition: GCD of two non-zero integers is the largest positive integer that divides the numbers without a remainder.
if a=b, then GCD is a.
If b=0, then GCD is a.
Else, GCD(a, b) = GCD(b, c), where c = a modulo b

```prolog
gcd(X1,0,X1).
gcd(X1,X1,X2).
gcd(X1,X2,Y) :- X1<X2 , gcd(X2,X1,Y).
gcd(X1,X2,Y) :- X3 is mod(X1, X2), gcd(X2,X3,Y), !.

% ?- gcd(25, 20, Res).
%        Res = 5.
```

### **`run/0`** read user input and format the output

```prolog
% ?- write('Enter the first number: '), read(FirstNumber).

run :-  write('Enter the first number: '), read(FirstNumber), 
        write('Enter the second number: '), read(SecondNumber),  

        Plus is FirstNumber + SecondNumber,
        format('~w + ~w = ~w', [FirstNumber, SecondNumber, Plus]), nl,

        Minus is FirstNumber - SecondNumber,
        format('~w - ~w = ~w', [FirstNumber, SecondNumber, Minus]), nl,

        Mult is FirstNumber * SecondNumber,
        format('~w x ~w = ~w', [FirstNumber, SecondNumber, Mult]), nl,

        Div is FirstNumber / SecondNumber,
        format('~w / ~w = ~w', [FirstNumber, SecondNumber, Div]).

% ?- run.
```

## Lists

```prolog
?- L = [mia,  [vincent,  jules],  [tom,  wife(tom)], 2, true, []]

?- [Head|Tail] = [mia,  tom,  julie,  mike].

?- [_,X,_,Y|_]  =  [[],  dead(z),  [2,  [b,  c]],  [],  Z]. 

?- is_list([ahmad]).

?- reverse([ahmad, khaled, 1, 2]).

?- member(ahmad,[1,2,3, ahmad]).

?- member(X,[1,2,3, ahmad]).

?- length([1,2,3, ahmad], X).

?- same_length([1,2,3], [1,2,a]).

?- append([1,2,3], [a, b, c], X).

?- append(Left, [1,2,3],[a,b,1,2,3]).

?- append(Left, Right ,[a,b,1,2,3]).

?- sort([1,3,2], X).

```

______________
*EOL*
