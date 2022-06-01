%Список(in), индекс(in), элемент(in/out).
%Возвращает элемент списка по указанному индексу, или проверяет его равенство введённому значению.
num_by_ind([El|_],0,El):-!.
num_by_ind([_|T],I,El):-I1 is I - 1, num_by_ind(T,I1,El).


list_min([],Min,Min):-!.
list_min([H|T],M,Min):-H < Min, list_min(T,M,H), !.
list_min([_|T],M,Min):-list_min(T,M,Min).

%Список(in), Min(out).
%Возвращает минимальный элемент в списке.
list_min([H|T],Min):-list_min(T,Min,H).

pr15(List,Ind):-list_min(List,Min), num_by_ind(List,Ind,Min).

