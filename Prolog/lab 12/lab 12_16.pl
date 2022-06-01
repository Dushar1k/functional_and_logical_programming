
%Изначально написал чтобы просто один элемент добавить в конец, но потом понял, что могу добавлять и списки.
%Я не смотрел реализацию append, но подозреваю, что она либо такая же, либо похожая
%add_end(List1,List2,List1+List2), работает как уравнение, можно задать 2 из 3 параметров и третий будет найден.
add_end([],[],[]):-!.
add_end([],[H|T],[H|Tail]):-add_end([],T,Tail).
add_end([H|T],X,[H|Tail]):-add_end(T,X,Tail).


%cyclic_shift_left(+List,+K,-Out_List), Возвращает изменённый список(циклический сдвиг влево на k позиций)
cyclic_shift_left(List,0,List):-!.
cyclic_shift_left([H|T],N,List):-N1 is N - 1, add_end(T,[H],L), cyclic_shift_left(L,N1,List).


%pr16(+List,-Shift_List), Возвращает изменённый список(циклический сдвиг влево на 3 позиции)
pr16(List,Shift_List):-cyclic_shift_left(List,3,Shift_List).
