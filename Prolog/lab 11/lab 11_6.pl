man(maxim).
man(kirill).
man(sergey).
man(ivan).
man(nikolas).
man(arseny).
man(dmitry).
man(jack).
man(andrey).
man(semen).

woman(ksenia).
woman(daria).
woman(maria).
woman(jasmin).
woman(alina).
woman(polina).
woman(victoria).
woman(elisaveta).
woman(kristina).
woman(angela).

parent(maxim,kirill).
parent(maxim,maria).
parent(maxim,ivan).
parent(maxim,alina).

parent(ksenia,kirill).
parent(ksenia,maria).
parent(ksenia,ivan).
parent(ksenia,alina).

parent(semen, daria).
parent(semen, jasmin).
parent(semen, nikolas).
parent(semen, sergey).

parent(angela, daria).
parent(angela, jasmin).
parent(angela, nikolas).
parent(angela, sergey).

parent(kirill,arseny).
parent(kirill,dmitry).
parent(daria,arseny).
parent(daria,dmitry).

parent(sergey,jack).
parent(sergey,polina).
parent(maria,jack).
parent(maria,polina).

parent(ivan,victoria).
parent(ivan,elisaveta).
parent(jasmin,victoria).
parent(jasmin,elisaveta).

parent(nikolas,kristina).
parent(nikolas,andrey).
parent(alina,kristina).
parent(alina,andrey).

men(X):- man(X), write(X), write(", "), fail.
women(X):- woman(X), write(X), write(", "), fail.

children(X):- parent(X,Y), write(Y), write(", "), fail.

mother(X,Y):- parent(X,Y), woman(X).
mother(X):- parent(Y,X), woman(Y), write(Y).

brother(X,Y):- man(X), parent(Z,Y), parent(Z,X), !.
brothers(X):- parent(Z,X), parent(Z,Y), X \= Y, man(Y), man(Z),  write(Y), write(", "), fail.

b_s(X,Y):- parent(Z,X), parent(Z,Y), X \= Y, !.
b_s(X):- parent(Y,X), man(Y), parent(Y,Z), X \= Z, write(Z), write(", "), fail.

grand_pa(X,Y):- man(X), parent(X,Z), parent(Z,Y), !.
grand_pas(X):- man(Z), parent(Z,Y), parent(Y,X), write(Z), write(", "), fail.

grand_pa_and_son(X,Y):- (grand_pa(X,Y), man(Y)); (grand_pa(Y,X), man(X)).

uncle(X,Y):- man(X), parent(Z,Y), parent(X1,X), parent(X1,Z), X \= Z, !.
uncles(X):- parent(Y,X), parent(X1,Y), parent(X1,Z), Y \= Z, man(X1), man(Z), write(Z), write(", "), fail.