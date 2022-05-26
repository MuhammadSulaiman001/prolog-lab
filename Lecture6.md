# Lecture6

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

Upcoming..