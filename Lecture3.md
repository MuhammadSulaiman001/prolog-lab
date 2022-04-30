# Lecture3

### LECTURE2 REVISITED: [Issue #2] (/../../issues/2)

Exercise1:

The term in Fibonacci Series is defined as the sum of the previous 2 terms' values, i.e 1,1,2,3,5,8,13,..

Define fib/2, where the first parameter is the term index (starts from 1), the second parameter is the term value. 

    % Sample Queries:
    ?- fib(4, Res)
        Res = 3
    ?- fib(5, Res)
        Res = 5
    ?- fib(6, Res)
        Res = 8

Exercise2:

Given a directed graph like the following:

    % facts
    link(node1, node2).
    link(node1, node3).
    link(node2, node3).
    link(node2, node5).
    link(node2, node6).
    
Define connection_valid/2, to check if there is a connection between two nodes.

    % Sample Queries:
    ?- connection_valid(node1, node6).
        true
    ?- connection_valid(node3, node5).
        false

_______

Upcoming..