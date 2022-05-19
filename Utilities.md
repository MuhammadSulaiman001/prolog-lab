# Utilities

Write on the console:

    ?- nl. % new line, returns true.
    ?- write('a').
    ?- write(3).
    ?- X is 3 + 5, write(X).

Clear-console rule:

```
cls :- write('\e[2J').
```

% Single line comment 

/* Mutli-Line comment */

To reload the file into prolog: Use this command
```
?- make.
```

Assertion

```
?- assert(ite_student(ahmad)).
?- assert(happy(X) :- ite_student(X)).
?- happy(ahmad). % will return true
```

Retracting

```
?- retract(ite-student(ahmad)).
?- retract(happy(X) :- ite-student(X)).
?- happy(ahmad). % will return false
```


Close the command-line

```
halt.
```


Read user input example

```
write('Enter the first number: '), read(FirstNumber).
```

Negation

```
\+ rule.
not(rule).

```

Debugging
    
    Swi-Prolog -> Debug -> Graphical Debugger -> ?- trace. -> some query -> use the arrows to step in/over the code.


Check if predicate is defined using **`current_predicate()`** function

    ?- current_predicate(a/1). % predicate a/1 is not defined
        false
    ?- assert(a(10)). % define a/1
        true
    ?- current_predicate(a/1). % prolog recognizes it
        true


Unit Testing

- See [testing_demo](/testing_demo)


Conditional-expression `(if -> then; else)` beware about the syntax

    ?- 3 =\= 4 % numeric comparasion
        true
    ?- 4 =\= 4
        false
    ?- ahmad \= ahmad. % string comparasion
        false
    ?- ahmad \= khaled.
        true
    ?- ahmad = ahmad
        true
    ?- (b\=a -> A=1; A=0)
        A = 1
    ?- (a\=a -> A=1; A=0)
        A = 0

