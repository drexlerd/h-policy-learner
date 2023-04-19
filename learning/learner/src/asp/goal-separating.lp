% Optimization: smallest sum over feature complexities
#minimize { C,complexity(F, C) : complexity(F, C), feature(F), select(F) }.

% Generate selected features
{ select(F) } :- feature(F).

% Goal-separation
:- nongoal(I, S), goal(I', S'), { feature(F) : select(F), b_value(I, S, F, V), b_value(I', S', F, V'), V != V' } = 0.

#show select/1.
#show numerical/1.
#show boolean/1.