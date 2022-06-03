min_up(0,9):- !.
min_up(X,N):- X1 is X div 10, Cur is X mod 10, min_up(X1,N1), ((N1 < Cur, N is N1); N is Cur), !.



