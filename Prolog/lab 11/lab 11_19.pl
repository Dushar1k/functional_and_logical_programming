min_up(0,9):- !.
min_up(X,N):- X1 is X div 10, Cur is X mod 10, min_up(X1,N1), ((N1 < Cur, N is N1); N is Cur), !.

min_down(0,_,N):- !.
min_down(X,N,Min):- Cur is X mod 10, X1 is X div 10, ((Cur < Min, min_down(X1,N,Cur)); min_down(X1,N,Min)), !.
min_down(X,N):- Cur is X mod 10, min_down(X,N,Cur), !.

nodless3_up(0,N,0):- !.
nodless3_up(X,N,Num):- X1 is X div 10, Cur is X mod 10, nodless3_up(X1,N,Num1), ((Cur < 3, Num is Num1+1); Num is Num1), !.
num_of_dig_less_3_up(X,N):- nodless3_up(X,N,N).

nodless3_down(0,N,N):- !.
nodless3_down(X,N,Num):- X1 is X div 10, Cur is X mod 10, ((Cur < 3, Num1 is Num+1); Num1 is Num), nodless3_down(X1,N,Num1).
num_of_dig_less_3_down(X,N):- nodless3_down(X,N,0), !.

fib_up(1,1):- !.
fib_up(2,1):- !.
fib_up(N,X):- N1 is N-1, N2 is N-2, fib_up(N1,X1), fib_up(N2,X2), X is X1+X2.

