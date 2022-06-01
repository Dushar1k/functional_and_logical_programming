prost(_,1):-!.
prost(X,I):-Cur is X mod I, Cur \= 0, I1 is I - 1, prost(X,I1), !.
prost(X):-X > 1, I is X - 1, prost(X,I), !.

div(X,I):-Cur is X mod I, Cur = 0.

sum(_,1,Sum,Sum):-!.
sum(X,I,Sum,Sum_cur):-div(X,I), not(prost(I)), Sum1 is Sum_cur + I, I1 is I - 1, sum(X,I1,Sum,Sum1), !.
sum(X,I,Sum,Sum_cur):-I1 is I - 1, sum(X,I1,Sum,Sum_cur).
sum(X,Sum):-I is X-1, sum(X,I,Sum,0).
