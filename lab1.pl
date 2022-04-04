cls :- write('\e[2J'). % clear the console

/*To reload the file into prolog: Use make. */

% Simple Facts

john_is_cold.                          /* john is cold */
raining.                               /* it is raining */
john_Forgot_His_Raincoat.              /*  john forgot his raincoat */
fred_lost_his_car_keys.                /* fred lost is car keys */
peter_footballer.                      /* peter plays football */

% Facts with args

eats(fred,oranges).                           /* "Fred eats oranges" */
eats(fred,t_bone_steaks).                     /* "Fred eats T-bone steaks" */
eats(tony,apples).                            /* "Tony eats apples" */
eats(john,apples).                            /* "John eats apples" */
eats(john,grapefruit).                        /* "John eats grapefruit" */

% Variables

eats(fred,oranges).
eats(fred,t_bone_steak).
eats(fred,apples).

% ?- eats(fred,FoodItem). % Use ; to investigate more solutions

