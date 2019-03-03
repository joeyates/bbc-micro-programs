# Mandelbrot Programs

Mandelbrot set limits:
-1.5 <= x <= 0.5
-1 <= y <= 1

## MANDEL1

Asks x, y, s:

x - x-axis left
y - y-axis top
s - size

To show the whole set:
x: -2.5, y: -1.75
s: 4

Draws finer and finer versions of set.
7 colours distributed logarithmically
for values 0..255
Initially just 2 tiles, then 4, 8, 16, ... 256

## MANDEL2

Creates a 128x128 Mandelbrot set and saves it to disk.

As drawing to the screen is slow, the program
calculates the set results only.

## MANDEL3

Loads a 128x128 byte file and draws it to the screen
It then saves the screen image under directory 'S'

## MN32COL

Almost identical to MANDEL3
MANDISP

## MANDISP

Loads saved Mandelbrot set images from the 'S' directory.

Files are created by MANDEL3 or MN32COL.

Images are chosen by their suffix after 'PIC'. E.g.
to see 'S.PIC2a' you input '2a'.
