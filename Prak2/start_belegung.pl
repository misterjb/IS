sudoku(sudoku_1, [
     6,_,_,7,_,_,5,_,_,
     _,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_2, [
     _,_,4,7,_,8,_,1,_,
     _,_,7,_,_,1,3,4,_,
     _,_,_,_,3,_,_,_,5,
     _,_,1,_,_,6,_,_,_,
     3,_,_,_,_,_,_,_,7,
     _,_,_,8,_,_,9,_,_,
     2,_,_,_,9,_,_,_,_,
     _,1,3,5,_,_,7,_,_,
     _,9,_,6,_,3,4,_,_]
).

sudoku(loesung_1, [
     6,3,9,7,1,8,5,4,2,
     4,2,8,5,3,9,7,1,6,
     1,7,5,6,4,2,3,8,9,
     7,4,6,8,5,3,9,2,1,
     3,9,1,4,2,7,8,6,5,
     8,5,2,9,6,1,4,3,7,
     9,8,3,1,7,6,2,5,4,
     5,6,7,2,8,4,1,9,3,
     2,1,4,3,9,5,6,7,8]
).

sudoku(loesung_3, [
     _,_,_,_,_,_,_,_,_,
     4,2,8,5,3,9,7,1,6,
     1,7,5,6,4,2,3,8,9,
     7,4,6,8,5,3,9,2,1,
     3,9,1,4,2,7,8,6,5,
     8,5,2,9,6,1,4,3,7,
     9,8,3,1,7,6,2,5,4,
     5,6,7,2,8,4,1,9,3,
     2,1,4,3,9,5,6,7,8]
).
sudoku(sudoku_666, [
     _,_,_,_,_,_,_,_,_,
     _,_,_,_,_,8,_,_,1,
     7,_,4,_,_,_,_,3,_,
     1,_,_,7,4,_,_,_,_,
     _,_,_,_,_,_,_,_,_,
     _,5,3,_,_,_,_,_,9,
     6,8,_,_,_,_,_,_,_,
     _,_,_,_,2,_,_,4,_,
     _,1,_,_,_,_,_,_,8]
).


sudoku(sudoku_fail_laenge_1,[
     6,_,_,7,_,_,5,_,
     _,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_fail_laenge_2, [
     6,_,_,7,_,_,5,_,_,_,
     _,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_fail_wert, [
     0,_,_,7,_,_,5,_,_,
     _,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_fail_zeile, [
     6,6,_,7,_,_,5,_,_,
     _,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_fail_spalte,[
     6,_,_,7,_,_,5,_,_,
     6,2,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

sudoku(sudoku_fail_block, [
     6,_,_,7,_,_,5,_,_,
     _,6,8,_,_,_,_,_,_,
     _,_,_,6,4,_,3,_,_,
     7,4,_,_,_,_,_,2,_,
     _,_,1,_,_,_,8,_,_,
     _,5,_,_,_,_,_,3,7,
     _,_,3,_,7,6,_,_,_,
     _,_,_,_,_,_,1,9,_,
     _,_,4,_,_,5,_,_,8]
).

