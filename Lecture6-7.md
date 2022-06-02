# Lecture6-7

### LECTURES 4-5 REVISITED: [Issue #7](/../../issues/7)

**`tag/2`**

Assign the correct label to a given point, the correct label = the label of the nearest point. 

Bonus: assign `unknown` in cases similar to `tag([3,-1], Label).`

```prolog
point([3,7], male).
point([3,-2], male).
point([0,0], female).
point([3,0], female).
point([3,3], female).
point([6,0], female).

% Sample queries
% ?- tag([4,6], Label).
%    Label = male.
% ?- tag([0,-10], Label).
%    Label = male.
% ?- tag([1,1], Label).
%    Label = female.
% ?- tag([3,0], Label).
%    Label = female.
% ?- tag([3,-1], Label). % bonus
%    Label = unkown.
```

---
# CUT

Example 1.

```prolog
teaches(dr_fred, history).
teaches(dr_fred, english).
teaches(dr_fred, drama).
teaches(dr_fiona, physics).	         	
studies(alice, english).
studies(angus, english).
studies(amelia, drama).
studies(alex, physics).

/*
?- teaches(dr_fred, Course), studies(Student, Course).
?- teaches(dr_fred, Course), !, studies(Student, Course).
?- teaches(dr_fred, Course), studies(Student, Course), !.
*/
```

Example 2.

```prolog
a(X) :- b(X), !, c(X). % what happened without cut?
b(1).
b(2).
b(3).
c(2).

% ?- a(X).
```

Example 3.

### **`max/3`** 

```prolog
% rule :- condition, !, then_part. % ! affects the left-hand side as well
% rule :- else_part.

max(X,Y,Y):- X =< Y. 
max(X,Y,X):- X > Y.

% ?- max(3,4,Max). 
%   X = 4 ;
%   false.

max(X,Y,Y) :- X =< Y, !. 
max(X,Y,X) :- X > Y.

% Let's squeez it a little bit..

max(X,Y,Y) :- X =< Y,!. 
max(X,Y,X).

% but we will have another issue, try the following!
% ?- max(2,3,2).
%   true.

% it should return false.. the result should be 3

% Because any query with the same number in first and last parameter will return true due to unification!

% So we have to prevent prolog from entering the second max/3 via making sure it hits the CUT ! in the first max/3.. but why it didn't hit it at first?

% Because of the unification, once it sees the second and last parameters are not the same: it does not go to the right hand side at all..

% We might use a trick of introducing a third variable to avoid such a problem...

max(X,Y,Z) :- X =< Y,!, Z = Y.
max(X,Y,X).

% ?- max(2,3,2).
%   false.

% Now it works fine.. because Z = Y will return false, and the second max/3 will not be hit due to the CUT ! being executed.

```
Example 4.

### **`split/3`** 

Splits a list of integers into two lists: one containing the positive ones (and zero), the other containing the negative ones.

```prolog
split1([],[],[]).
split1([H|T], [H|P], N) :- H >= 0, split1(T,P,N).
split1([H|T], P, [H|N]) :- H < 0, split1(T,P,N).

/*
?- split([3,4,-5,-1,0,4,-9],P,N).
    P  =  [3,4,0,4] ,
    N  =  [-5,-1,-9];
    false
*/

% eliminate the false thing, use !

split2([],[],[]).
split2([H|T], [H|P], N) :- H>=0, !, split2(T,P,N).
split2([H|T], P, [H|N]) :- split2(T,P,N).

/*
?- split([3,4,-5,-1,0,4,-9],P,N).
    P  =  [3,4,0,4] ,
    N  =  [-5,-1,-9].

But again, a validation issue..

?- split([3,4,-5,-1,0,4,-9],[4,0,4],[3, -5,-1,-9]).
    true.
*/

split3([],[],[]).
split3([H|T], P, N) :- H>=0, !, split3(T,P1,N), P = [H|P1].
split3([H|T], P, [H|N]) :- split3(T,P,N).

/*
?- split([3,4,-5,-1,0,4,-9],[4,0,4],[3, -5,-1,-9]).
    false.
*/

% SOLVED.
```

**Notes on `!` **
1. Always succeeds.
2. Prevents unwanted backtracking.
3. Should not be used generously, use it only for a reason.

# Negation as Failure

Example 1. (command-line example)

```prolog
% between/3 ensures looping over the first-second numbers..

% ?- between(1,3,N), format("line ~w\n", [N]). 
% you have to hit ; to get the next result,, can you make it automated? i.e. can you enforce the backtracking?

% these are the same..
% ?- between(1,3,N), format("line ~w\n", [N]), fail.
% ?- between(1,3,N), format("line ~w\n", [N]), false.
% ?- between(1,3,N), format("line ~w\n", [N]), 0=1.
```

Example 2.

```prolog
% 
writeall(X) :- 
        is_list(X), member(A,X), write(A), nl, fail.
% ?- writeall([1,2,3]).

% previous call will print the values of [1,2,3] with false at the end, can you eleminate the false thing?

% adding this rule would help prolog not returning false due to the fail call.
writeall(_).

```

Example 3.

```prolog
% 3 facts
student(joe).
married(john).
unmarried_student(X) :- \+ married(X), student(X).

% ?- unmarried_student(joe). 
%   true
% ?- unmarried_student(john). 
%   false
% ?- unmarried_student(X).
%    false (this should be joe, how to fix it?)

% fix1?
% if he is married, return false
unmarried_student1(X) :- married(X), fail.
% otherwise, all students are unmarried
unmarried_student1(X) :- student(X).

% fix2?
% swap the conditions
unmarried_student2(X) :- student(X), \+ married(X).
```

Example 4. 

```prolog
b(1).
b(4).
c(1).
c(3).
d(4).
a(X) :- b(X), c(X), !, fail. % try this..
% a(X) :- b(X), c(X), fail. % or this!
a(X) :- d(X).
% ?- a(X). % What is the output? is it X = 4?
```

Example 5. 

```prolog
man(jim).
man(fred).
woman(jane).
woman(X):- man(X), fail.
woman(_).
% ?- woman(X). % it should be jane, what is the output?
```

*Final thoughts*: 
1. when Prolog fails, it tries to backtrack, thus `fail` can be viewed as an instruction to force backtracking.
2. this is a [good resource](https://cs.union.edu/~striegnk/learn-prolog-now/html/node90.html) to read.


# Dynamics and looping

### **`Assertion`**

Example 1.

```prolog
?- assert(lookup(1,2,3,4)).
    true
?- lookup(1,2,3,4).
    true
```

Example 2.

```prolog
% We can store the result once we found it, to redo none of the calculations for the same query next time.
:- dynamic lookup/3.
add_and_square(X, Y, Res):- lookup(X, Y, Res), !. 
add_and_square(X, Y, Res):- Res is (X+Y)*(X+Y), 
                            assert(lookup(X, Y, Res)).
```

Example 3. 

```prolog
:- dynamic fib/2.

fib(0,0).
fib(1,1).
fib(X,Y) :- X>1,X1 is X - 1, X2 is X - 2,
            fib(X1,Y1),fib(X2,Y2),
            Y is Y1 + Y2,
            % save the query result as a fact.
            % note: assertz is useless for performance in this case.
            asserta(fib(X,Y)).
```
Note: more examples on assert, retract can be found in [Utilities.md](/Utilities.md)

### **`findall/3`**

```prolog
child(martha, charlotte). 
child(charlotte, caroline). 
child(caroline, laura). 
child(laura, rose). 
 
descend(X, Y) :- child(X, Y).
descend(X, Y) :- child(X, Z), descend(Z, Y).

% ?- descend(martha, X). % use ; to get another solution..
% ?- findall(X, child(X, Y), Z).
% ?- findall(Y, child(X, Y), Z).
% ?- findall(X, descend(martha, X), Z), length(Z, N).
```

## QUIZ (2-6-2022, duration = 1 hour)

<p align="center">

<img src="res/me-with-coffin-dancers.PNG" alt="drawing" width="400"/>

</p>

### X/O Game [^1]

```prolog
/*

Q1. print_grid/1 (1 Mark)

% example
?- print_grid([x, 0, x, 0, x, o, o, 0, o])
	x 0 x
	0 x o
	o 0 o

Q2. get_empty_cells/2 (2 Marks)

% examples
?- get_empty_cells([0, 0, 0, 0, 0, 0, 0, 0, 0], EmptyCells).
	EmptyCells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

?- get_empty_cells([x, 0, x, 0, x, o, o, 0, o], EmptyCells).
	EmptyCells = [2, 4, 8]

Q3. insert_char_at_position/4 (2 Marks)

% example
?- insert_char_at_position(x, 2, [x, 0, x, 0, x, o, o, 0, o], UpdatedGrid).
	UpdatedGrid = [x, x, x, 0, x, o, o, 0, o]

Q4. get_winner_name/2 (WinnerName can be x, o or noBody) (2 Marks)

% example
?- get_winner_name([x, x, x, 0, x, o, o, 0, o], WinnerName).
	WinnerName = x

Q5. play/0. this will start the X/O game using the previous rules.. (3 Marks)

% User is X, Computes is O.
% Game ends when One player wins or the Grid is filled with no winner.

% Example

?- play.

    0, 0, 0
    0, 0, 0
    0, 0, 0

    Your turn.. available cells are [1,2,3,4,5,6,7,8,9]: 5

    0, 0, o
    0, x, 0
    0, 0, 0

    Your turn.. available cells are [1,2,4,6,7,8,9]: 1

    x, 0, o
    0, x, o
    0, 0, 0

    Your turn.. available cells are [2,4,7,8,9]: 9

    x, 0, o
    0, x, o
    0, 0, x

    You win.
    true.
*/

% MY SOLUTION (you can submit your solution in the issues)

% Answer1.
print_grid([One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) :- 
    format('~w ~w ~w', [One, Two, Three]), nl,
    format('~w ~w ~w', [Four, Five, Six]), nl,
    format('~w ~w ~w', [Seven, Eight, Nine]), nl.

% Answer2.
get_empty_cells([], []).
get_empty_cells([H|T], EmptyCells) :- H \= 0, get_empty_cells(T, EmptyCells), !.
get_empty_cells([H|T], [Index|EmptyCells]) :- length(T, Len), Index is (9 - Len),
                                            get_empty_cells(T, EmptyCells).

% Answer3.
insert_char_at_position(Char, 1, [GridH|GridT], [Char|GridT]).
insert_char_at_position(Char, Position, [GridH|GridT], [GridH|NewGridT]) :- 
                log('insert_char_at_position'),
                NewPos is Position - 1, 
                insert_char_at_position(Char, NewPos, GridT, NewGridT).

% Answer4.
get_winner_name([A, A, A, Four, Five, Six, Seven, Eight, Nine], A) :- A = x; A = o.
get_winner_name([One, Two, Three, A, A, A, Seven, Eight, Nine], x) :- A = x; A = o.
get_winner_name([One, Two, Three, Four, Five, Six, A, A, A], x) :- A = x; A = o.
get_winner_name([A, Two, Three, A, Five, Six, A, Eight, Nine], x) :- A = x; A = o.
get_winner_name([One, A, Three, Four, A, Six, Seven, A, Nine], x) :- A = x; A = o.
get_winner_name([One, Two, A, Four, Five, A, Seven, Eight, A], x) :- A = x; A = o.
get_winner_name([A, Two, Three, Four, A, Six, Seven, Eight, A], x) :- A = x; A = o.
get_winner_name([One, Two, A, Four, A, Six, A, Eight, Nine], x) :- A = x; A = o.
get_winner_name(_, noBody).
    
% Answer5.
play :- play([0, 0, 0, 0, 0, 0, 0, 0, 0]).
play(Grid) :- print_grid(Grid),
              get_empty_cells(Grid, EmptyCells), 
              format('Your turn.. available cells are ~w: ',[EmptyCells]), 
              % game ends if player inserts non-valid value :(
              read(XPosition), member(XPosition, EmptyCells),
              insert_char_at_position(x, XPosition, Grid, NewGrid),
              can_continue_playing(NewGrid), % print the winner name inside this function
              get_empty_cells(NewGrid, NewEmptyCells),
              random_member(OPosition, NewEmptyCells), % or simply: [OPosition|_] = NewEmptyCells.
              insert_char_at_position(o, OPosition, NewGrid, NextRoundGrid),
              can_continue_playing(NextRoundGrid), % print the winner name inside this function
              play(NextRoundGrid).

play(_). % this helps not printing false when at the end of the game.

% helper rules

log(_).
% log(Msg) :- write(Msg), nl.
can_continue_playing(Grid) :- log('can_continue_playing'), 
                              get_winner_name(Grid, WinnerName),
                              (WinnerName = x -> write('You Win'),  nl,  !, fail; true),
                              (WinnerName = o -> write('You Lose'), nl,  !, fail; true).

```
______________
*EOL*

[^1]: 10 Marks out of 18
