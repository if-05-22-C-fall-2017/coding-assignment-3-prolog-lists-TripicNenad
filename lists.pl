parent(adam, john).
parent(eve, john).
parent(eve, lisa).
parent(john, anne).
parent(john, pat).
parent(pat, jacob).
parent(carol, jacob).

ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

head(X, [X|T]).
head(X, [X | _]).
tail(T, [_ | T]).

head([Head | _], Head).
tail([_ | Tail], Tail).

isMember(X, [X | _]).
isMember(X, [_ | Tail]) :- isMember(X, Tail).

concatenate([], L, L).
concatenate([H|T], L, [H|ExtendedTail]) :- concatenate(T, L, ExtendedTail).

prepend(L, E, [E|L]).

addElement(L, B, [B|L]).

hasLength([],0).
hasLength([H|T],L+1) :-hasLength(T,L).

remove(E, [], []).
remove(E, [E|T], T).
remove(E, [H|T], [H|NewTail]):-remove(E, T, NewTail).
