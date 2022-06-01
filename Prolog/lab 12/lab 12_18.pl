in_list_missed([],_,_):-!.
in_list_missed([H|T],H,El):-H1 is H + 1, in_list_missed(T,H1,El).
in_list_missed([H|_],El,El):- El < H.
in_list_missed([H|T],X,El):-H > X, X1 is X + 1, in_list_missed([H|T],X1,El).


%in_list_missed(+List,-El), возвращает в El, все пропущенные элементы List
in_list_missed([H|T],El):-in_list_missed([H|T],H,El).
