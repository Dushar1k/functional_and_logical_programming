prost(_,1):-!.
prost(X,I):-Cur is X mod I, Cur \= 0, I1 is I - 1, prost(X,I1), !.
prost(X):-X > 1, I is X - 1, prost(X,I), !.

vz_prost(1,_).
vz_prost(X,Y):-X \= 0, X1 is Y mod X, vz_prost(X1,X),!.

div(X,I):-Cur is X mod I, Cur = 0.

sodp(0,Sum,Sum):-!.
sodp(X,S,Sum):-X1 is X div 10, Cur is X mod 10, prost(Cur), Sum1 is Sum + Cur, sodp(X1,S,Sum1), !.
sodp(X,S,Sum):-X1 is X div 10, sodp(X1,S,Sum).
sum_of_dig_prost(X,Sum):-sodp(X,Sum,0).

pr(X,_,X,N,N):-!.
pr(X,Sod,I,N,Num):-not(div(X,I)), not(vz_prost(X,I)), vz_prost(I,Sod),I1 is I + 1, Num1 is Num + 1, pr(X,Sod,I1,N,Num1).
pr(X,Sod,I,N,Num):-I1 is I + 1, pr(X,Sod,I1,N,Num).
pr(X,N):-sum_of_dig_prost(X,Sod), pr(X,Sod,1,N,0), !.
