# Lectures4-5


### LECTURE3 REVISITED: [Issue #4](/../../issues/4)

Suppose we have the following dialogue:

```
Ahmad says: "I do nothing"
Dan says: "I do nothing"
Bassel says: "Dan is guilty"
Camal says: "Bassel is guilty"
```

Knowing that only one of them is honest, fix the following code to figure out who is the guilty one..

```
guilty(Guilty):-
    member(Guilty, [ahmad, bassel, camal, dan]),
    (Guilty = ahmad -> Ahmad =1; Ahmad =0),
    (Guilty = dan  -> Bassel =1; Bassel =0),
    (Guilty = bassel  -> Camal =1; Camal =0),
    (Guilty \= dan -> Dan =1; Dan = 0),
    Ahmad + Bassel + Camal +Dan =:= 1, !.
```

Note: `(if -> then; else)` syntax is explained in [Utilities.md](/Utilities.md)

___________

## Exercises:

**len/2**

Takes a list and returns the length of it, same as predefined length/2

```
len([],0). 
len([_|T],N)  :-  len(T,X),  N  is  X+1.
```

**concat/3**

Concatenates two lists and put the result in parameter3
```
concat([],L,L).
concat([X1|L1],L2,[X1|L3]) :- concat(L1,L2,L3).
```

**a2b/2**

Validates that parameter1 is a list of a's lenght N and parameter2 is list of b's of length N as well.

```
a2b([],[]).
a2b([a|Ta],[b|Tb])  :-  a2b(Ta,Tb).
/*
?- a2b([a,a,a,a],[b,b,b,b]).
    True.
?- a2b([a,a,a,a],[b,b,b]).
    False.
?= a2b([a,c,a,a],[b,b,5,4]).
    False.
/*
```

**remove_item/3**

Removes param1 from param2 if exists, put the resultant list in param3

```
remove_item(X, [X], []).
remove_item(X,[X|L1], L1).
remove_item(X, [Y|L2], [Y|L1]) :- remove_item(X,L2,L1).
```

**parse/1**

Suppose we have the following DFS automaton

![automaton](/res/automaton.png)

We can model it with the following facts

```
delta(0,a,1).   
delta(0,b,0).
delta(1,a,1).
delta(1,b,2).
delta(2,a,2).
delta(2,b,2).
start(0).
final(2).
```

parse/1 will take a string and tests whether it belongs to the language represented by the automaton or not.. 

```
% you can remove the write() instructions.. they are used just for logging..

trans(X,[]) :- 
      final(X),
      write(X),
      write('  '),
      write([]), nl.

trans(X,[A|B]) :- 
      delta(X,A,Y),   /*  X ---A---> Y */
      write(X),
      write('  '),
      write([A|B]),
      nl,
      trans(Y,B).  

parse(L) :- start(S), 
            trans(S,L).

 
```

Examples:

```
?- parse([b,b,a,a,b,a,b]).
    true
?- parse([b,b,a]).
    false
```

## TODO

- get_last_element/2
- get_last_but_one/2 (i.e. the element before the last element)
- reverse/2
- is_symmetric/1
- insert_at_position/3
- get_Nth_item/3
- sort_list_of_numbers/2
- is_even_length/1
- get_union/3
- get_max/2
- split_at_index/4
- sum_items_values/2
- get_intersection/3


## QUIZ (26-5-2022)

<p align="center">
    <img src="res/me-with-coffin-dancers.PNG" alt="drawing" width="400"/>
</p>

## Bonus

Prepare a demo to illustrate how prolog can be used in a real-life application (desktop app, web app, mobile app, etc..) 
- you can choose whatever technology you want