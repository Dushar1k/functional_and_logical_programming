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

men(X):- man(X), write(X), write(", "), fail.
women(X):- woman(X), write(X), write(", "), fail.
