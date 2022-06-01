fact(0,F,F):-!.
fact(I,F,Fact):-Fact1 is Fact * I, I1 is I - 1, fact(I1,F,Fact1).
fact(N,X):-fact(N,X,1).

psfdin(0,S,S):-!.
psfdin(X,S,Sum):-X1 is X div 10, Dig is X mod 10, fact(Dig,N), Sum1 is Sum + N, psfdin(X1,S,Sum1).
pr_sum_fact_dig_is_num(X):-psfdin(X,Sum,0), X is Sum.


%Число 9 999 999(максимальное семизначное число),
%превышает 9!+9!+9!+9!+9!+9!+9!(2 540 160),
%поэтому выше этого числа точно не будет таких лубопытных чисел как 145(1!+4!+5! = 145)
%и поиск мы можем начать с 9 999 999, все такие числа будут расположены между 10 000 000 и 2
sc(2,S,S):-!.
sc(X,S,Sum):- pr_sum_fact_dig_is_num(X), write(X), nl,  Sum1 is Sum + X, X1 is X - 1, sc(X1,S,Sum1), !.
sc(X,S,Sum):-X1 is X - 1, sc(X1,S,Sum).
sum_curious(Sum):-sc(9999999,Sum,0).
