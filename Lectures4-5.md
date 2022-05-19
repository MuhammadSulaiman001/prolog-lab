# Lectures4-5


### LECTURE3 REVISITED: [Issue #4](/../../issues/4)

Suppose we have the following dialogue:

- Ahmad says: "I do nothing"
- Dan says: "I do nothing"
- Bassel says: "Dan is guilty"
- Camal says: "Bassel is guilty"

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

Note: `(if -> then; else)` syntax is explained in [Utilities.md](/Utilities.md)

___________