:- use_module(library(clpfd)).
:- consult('start_allocations').

sudoku(NumbeZ) :-
     sudoku(NumbeZ, Sudoku),
     time(solveSudoku(Sudoku)).

solveSudoku(Sudoku) :-
     % Länge
     Sudoku =
          [[Z1S1, Z1S2, Z1S3, Z1S4, Z1S5, Z1S6, Z1S7, Z1S8, Z1S9],
           [Z2S1, Z2S2, Z2S3, Z2S4, Z2S5, Z2S6, Z2S7, Z2S8, Z2S9],
           [Z3S1, Z3S2, Z3S3, Z3S4, Z3S5, Z3S6, Z3S7, Z3S8, Z3S9],
           [Z4S1, Z4S2, Z4S3, Z4S4, Z4S5, Z4S6, Z4S7, Z4S8, Z4S9],
           [Z5S1, Z5S2, Z5S3, Z5S4, Z5S5, Z5S6, Z5S7, Z5S8, Z5S9],
           [Z6S1, Z6S2, Z6S3, Z6S4, Z6S5, Z6S6, Z6S7, Z6S8, Z6S9],
           [Z7S1, Z7S2, Z7S3, Z7S4, Z7S5, Z7S6, Z7S7, Z7S8, Z7S9],
           [Z8S1, Z8S2, Z8S3, Z8S4, Z8S5, Z8S6, Z8S7, Z8S8, Z8S9],
           [Z9S1, Z9S2, Z9S3, Z9S4, Z9S5, Z9S6, Z9S7, Z9S8, Z9S9]],
	
     % domain
     SudokuFlatted =
          [Z1S1, Z1S2, Z1S3, Z1S4, Z1S5, Z1S6, Z1S7, Z1S8, Z1S9,
           Z2S1, Z2S2, Z2S3, Z2S4, Z2S5, Z2S6, Z2S7, Z2S8, Z2S9,
           Z3S1, Z3S2, Z3S3, Z3S4, Z3S5, Z3S6, Z3S7, Z3S8, Z3S9,
           Z4S1, Z4S2, Z4S3, Z4S4, Z4S5, Z4S6, Z4S7, Z4S8, Z4S9,
           Z5S1, Z5S2, Z5S3, Z5S4, Z5S5, Z5S6, Z5S7, Z5S8, Z5S9,
           Z6S1, Z6S2, Z6S3, Z6S4, Z6S5, Z6S6, Z6S7, Z6S8, Z6S9,
           Z7S1, Z7S2, Z7S3, Z7S4, Z7S5, Z7S6, Z7S7, Z7S8, Z7S9,
           Z8S1, Z8S2, Z8S3, Z8S4, Z8S5, Z8S6, Z8S7, Z8S8, Z8S9,
           Z9S1, Z9S2, Z9S3, Z9S4, Z9S5, Z9S6, Z9S7, Z9S8, Z9S9],
     SudokuFlatted ins 1..9,

     % Blöcke
     all_distinct([Z1S1, Z1S2, Z1S3, Z2S1, Z2S2, Z2S3, Z3S1, Z3S2, Z3S3]),
     all_distinct([Z1S4, Z1S5, Z1S6, Z2S4, Z2S5, Z2S6, Z3S4, Z3S5, Z3S6]),
     all_distinct([Z1S7, Z1S8, Z1S9, Z2S7, Z2S8, Z2S9, Z3S7, Z3S8, Z3S9]),
     all_distinct([Z4S1, Z4S2, Z4S3, Z5S1, Z5S2, Z5S3, Z6S1, Z6S2, Z6S3]),
     all_distinct([Z4S4, Z4S5, Z4S6, Z5S4, Z5S5, Z5S6, Z6S4, Z6S5, Z6S6]),
     all_distinct([Z4S7, Z4S8, Z4S9, Z5S7, Z5S8, Z5S9, Z6S7, Z6S8, Z6S9]),
     all_distinct([Z7S1, Z7S2, Z7S3, Z8S1, Z8S2, Z8S3, Z9S1, Z9S2, Z9S3]),
     all_distinct([Z7S4, Z7S5, Z7S6, Z8S4, Z8S5, Z8S6, Z9S4, Z9S5, Z9S6]),
     all_distinct([Z7S7, Z7S8, Z7S9, Z8S7, Z8S8, Z8S9, Z9S7, Z9S8, Z9S9]),
     
     % Spalten
     all_distinct([Z1S1, Z2S1, Z3S1, Z4S1, Z5S1, Z6S1, Z7S1, Z8S1, Z9S1]),
     all_distinct([Z1S2, Z2S2, Z3S2, Z4S2, Z5S2, Z6S2, Z7S2, Z8S2, Z9S2]),
     all_distinct([Z1S3, Z2S3, Z3S3, Z4S3, Z5S3, Z6S3, Z7S3, Z8S3, Z9S3]),
     all_distinct([Z1S4, Z2S4, Z3S4, Z4S4, Z5S4, Z6S4, Z7S4, Z8S4, Z9S4]),
     all_distinct([Z1S5, Z2S5, Z3S5, Z4S5, Z5S5, Z6S5, Z7S5, Z8S5, Z9S5]),
     all_distinct([Z1S6, Z2S6, Z3S6, Z4S6, Z5S6, Z6S6, Z7S6, Z8S6, Z9S6]),
     all_distinct([Z1S7, Z2S7, Z3S7, Z4S7, Z5S7, Z6S7, Z7S7, Z8S7, Z9S7]),
     all_distinct([Z1S8, Z2S8, Z3S8, Z4S8, Z5S8, Z6S8, Z7S8, Z8S8, Z9S8]),
     all_distinct([Z1S9, Z2S9, Z3S9, Z4S9, Z5S9, Z6S9, Z7S9, Z8S9, Z9S9]),
     
     % Zeilen
     Sudoku = [Zeile1, Zeile2, Zeile3, Zeile4, Zeile5, Zeile6, Zeile7, Zeile8, Zeile9],
     all_distinct(Zeile1),
     all_distinct(Zeile2),
     all_distinct(Zeile3),
     all_distinct(Zeile4),
     all_distinct(Zeile5),
     all_distinct(Zeile6),
     all_distinct(Zeile7),
     all_distinct(Zeile8),
     all_distinct(Zeile9),

     % ausgabe Zeile
     writeln(Zeile1),
     writeln(Zeile2),
     writeln(Zeile3),
     writeln(Zeile4),
     writeln(Zeile5),
     writeln(Zeile6),
     writeln(Zeile7),
     writeln(Zeile8),
     writeln(Zeile9).
