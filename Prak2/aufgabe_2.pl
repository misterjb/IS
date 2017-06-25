:- use_module(library(clpfd)).
:- consult('start_belegung').

sudoku(Zahl) :-
     sudoku(Zahl, Sudoku),
     time(loeseSudoku(Sudoku)).

loeseSudoku(Sudoku) :-
     % Werte
     Zeilen =
          [[_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _],
		   [_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _],
		   [_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _],
           [_, _, _, _, _, _, _, _, _]],
	
	transpose(Zeilen, Spalten),
	flatten(Zeilen, Sudoku),
	Sudoku ins 1..9,
	maplist(all_different, Zeilen),
	maplist(all_different, Spalten),
	Zeilen = [A,B,C,D,E,F,G,H,I],
	makeAllDifferentBloecke(A,B,C), makeAllDifferentBloecke(D,E,F), makeAllDifferentBloecke(G,H,I),
	labeling([], Sudoku),
	schreibeZeilen(Zeilen).
	
	schreibeZeilen([]).
	schreibeZeilen([Kopf|Rest]) :- writeln(Kopf), schreibeZeilen(Rest).

	
	makeAllDifferentBloecke([],[],[]).
	makeAllDifferentBloecke([A,B,C|Rest1],[D,E,F|Rest2],[G,H,I|Rest3]) :-
		all_different([A,B,C,D,E,F,G,H,I]), makeAllDifferentBloecke(Rest1,Rest2,Rest3).
	
