
%Такой же как и в 16 задании
add_end([],[],[]):-!.
add_end([],[H|T],[H|Tail]):-add_end([],T,Tail).
add_end([H|T],X,[H|Tail]):-add_end(T,X,Tail).

%И здесь всё также
%cyclic_shift_left(+List,+K,-Out_List), Возвращает изменённый список(циклический сдвиг влево на k позиций)
cyclic_shift_left(List,0,List):-!.
cyclic_shift_left([H|T],N,List):-N1 is N - 1, add_end(T,[H],L), cyclic_shift_left(L,N1,List).

%А здесь 3 заменена на 1
%pr16(+List,-Shift_List), Возвращает изменённый список(циклический сдвиг влево на 1 позицию)
pr16(List,Shift_List):-cyclic_shift_left(List,1,Shift_List).
