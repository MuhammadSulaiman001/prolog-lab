# Lectures4-5

### LECTURE3 REVISITED: [Issue #4](/../../issues/4)

Suppose we have the following dialogue:

* Ahmad says: "I do nothing"
* Dan says: "I do nothing"
* Bassel says: "Dan is guilty"
* Camal says: "Bassel is guilty"

Knowing that only one of them is honest, fix the following code to figure out who is the guilty one..

```prolog
guilty(Guilty):-
    member(Guilty, [ahmad, bassel, camal, dan]),
    (Guilty = ahmad -> Ahmad =1; Ahmad =0),
    (Guilty = dan  -> Bassel =1; Bassel =0),
    (Guilty = bassel  -> Camal =1; Camal =0),
    (Guilty \= dan -> Dan =1; Dan = 0),
    Ahmad + Bassel + Camal +Dan =:= 1, !.
```

Note: `(if -> then; else)` usage example can be fount in [Utilities.md](/Utilities.md)

---

## Exercises:

### **`len/2`**

Takes a list and returns the length of it, same as predefined length/2

```prolog
len([],0).
len([_|T],N)  :-  len(T,X),  N  is  X+1.
```

### **`concat/3`**

Concatenates two lists and put the result in 3rd parameter

```prolog
concat([],L,L).
concat([X1|L1],L2,[X1|L3]) :- concat(L1,L2,L3).
```

### **`a2b/2`**

Validates that parameter1 is a list of a's lenght N and parameter2 is list of b's of length N as well.

```prolog
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

### **`remove_item/3`**

Removes param1 from param2 if exists, put the resultant list in param3

```prolog
remove_item(X, [X], []).
remove_item(X,[X|L1], L1).
remove_item(X, [Y|L2], [Y|L1]) :- remove_item(X,L2,L1).
```

### **`parse/1`**

Suppose we have the following DFS automaton (for Syrians, images are not shown in github unless you run a VPN/Proxy 💔)

![automaton](/res/automaton.png)

We can model it with the following facts

```prolog
delta(0,a,1).
delta(0,b,0).
delta(1,a,1).
delta(1,b,2).
delta(2,a,2).
delta(2,b,2).
start(0).
final(2).
```

`parse/1` will take a string and tests whether it belongs to the language represented by the automaton or not..

```prolog
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

```prolog
?- parse([b,b,a,a,b,a,b]).
%    true
?- parse([b,b,a]).
%    false
```

## TODO (submit your solution [**here**](/../../issues/6), most of them were solved in the lab)

01. `is_even_length/1`
02. `sum_items_values/2`
03. `get_last_element/2`
04. `get_last_but_one/2`
05. `count_elements_less_than/3`
06. `get_max/2`
07. `get_element_at_position/3`
08. `insert_element_into_position/3` % index starts from 0
09. `split_at_index/4`
10. `duplicate_elements/2` % repeat the same element in-place
11. `remove_duplicates/2` % convert list into set (no item repetition)
12. `get_union/3` % no repetition
13. `get_intersection/3`
14. `my_reverse/2`
15. `is_symmetric/1`

## QUIZ (26-5-2022)

<p align="center">

    <img src="res/me-with-coffin-dancers.PNG" alt="drawing" width="400"/>
</p>

QUIZ1 [7 minutes]

```prolog
recommend(egypt, "www.google.com/song1").
recommend(syria, "www.google.com/song3").
recommend(iraq, "www.google.com/song1").

% ?- recommend(Song).
% Are you from egypt? [y/n]
%    n.
% Are you from syria? [y/n]
%    y.
% Song = www.google.com/song3

% SOLUTION

recommend(Song) :- recommend(X, Y), 
                   % format('are you from ~w?  [y,n]', [X]).
				   write('are you from '), write(X), write('? [y/n]: '), 
				   read(Ans), Ans = y, Song = Y.

```

QUIZ2. [14 minutes]

```prolog
% ?- inner_count_less_than([1,2,[2,1], 12, c, [33, 0]], 2, X).
% 	X = 3 (number of elements less than N = 2)

% SOLUTION

inner_count_less_than([], N, 0).
inner_count_less_than([H|T], N, Res) :- inner_count_less_than(T, N, Res1), 
        (is_list(H) -> 
                    inner_count_less_than(H, N, Res2), Res is Res1 + Res2;
                    (integer(H), H < N -> 
                                    Res is Res1 + 1; Res is Res1)
		).

% Note: this exercise is similar to count_less_than/3, which was well-explained in the class.
```

</p>

## Bonus

Prepare a demo to illustrate how prolog can be used in a real-life application (desktop app, web app, mobile app, etc..)

* you can choose whatever technology you want.

______________
*EOL*
