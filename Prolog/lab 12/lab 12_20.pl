
%is_local_max(+List,+Index), проверяет является ли элемент по указанному индексу локальным максимумом.
is_local_max([A,B,C|_],1):- !, B > A, B > C.
is_local_max([B,C|_],0):- !,  B > C.
is_local_max([A,B],1):- !, B > A.
is_local_max([_|T],I):- I1 is I - 1, is_local_max(T,I1), !.
