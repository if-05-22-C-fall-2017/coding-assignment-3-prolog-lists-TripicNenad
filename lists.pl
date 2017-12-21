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


prepend(L, ELEMENT, [ELEMENT|L]).

addElement(L, ELEMENT, [L|ELEMENT]).

hasLength([],0).
hasLength([H|T],L+1) :-hasLength(T,L).

/*
                                Remove
1.) Prüfen ob gesuchtes Element Head ist wenn ja bleibt nur Tail übrig
2.) Wir wissen nun das es nicht im Head ist, also so oft aufrufen bis das gesuchte Element nicht im Tail gefunden wird

 */
remove([X|T], X, T).
remove([H|T], X, [H|T2]):-remove(T,X,T2).
