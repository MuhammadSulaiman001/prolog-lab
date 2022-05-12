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
?- assert(ite-student(ahmad)).
?- assert(happy(X) :- ite-student(X)).
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