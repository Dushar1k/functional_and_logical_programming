list_length([],N,N):-!.
list_length([_|T],N,N_cur):-N1 is N_cur + 1, list_length(T,N,N1).
list_length(List,N):-list_length(List,N,0), !.
