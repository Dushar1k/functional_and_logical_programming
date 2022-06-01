



first_min_ind([],Ind,Ind,_,_):-!.
first_min_ind([H|T],I,_,Ind,Min):-H < Min, I1 is Ind + 1, first_min_ind(T,I,Ind,I1,H), !.
first_min_ind([_|T],I,Ind_min,Ind,Min):-I1 is Ind + 1, first_min_ind(T,I,Ind_min,I1,Min).

%first_min_ind(+List,-Ind), Возвращает индекс первого минимального элемента(начиная с 0)
first_min_ind([H|T],Index):-first_min_ind(T,Index,0,1,H), !.


%out_elements(+List,+Num,-El)
%поочерёдно присваивает переменной El первые Num элементов List
out_elements(_,0,_):-!.
out_elements([H|_],_,H).
out_elements([_|T],I,H):-I1 is I-1, out_elements(T,I1,H).


%pr17(+List,-El)
%поочерёдно присваивает переменной El все элементы List, стоящие до первого минимального.
pr17(List,El):-first_min_ind(List,Ind), out_elements(List,Ind,El).


