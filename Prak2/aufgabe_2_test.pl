%run_tests.
:- begin_tests(aufgabe_2).

checkEqual(SudokuName, LoesungName) :-
     sudoku(SudokuName, Sudoku), 
     sudoku(LoesungName, Loesung),
     loeseSudoku(Sudoku),
	 Sudoku = Loesung.

test(loeseSudoku) :- checkEqual(sudoku_1, loesung_1).

test(loeseSudoku, fail) :- sudoku(sudoku_fail_länge_1).
test(loeseSudoku, fail) :- sudoku(sudoku_fail_länge_2).
test(loeseSudoku, fail) :- sudoku(sudoku_fail_wert).
test(loeseSudoku, fail) :- sudoku(sudoku_fail_zeile).
test(loeseSudoku, fail) :- sudoku(sudoku_fail_spalte).
test(loeseSudoku, fail) :- sudoku(sudoku_fail_block).

:- end_tests(aufgabe_2).