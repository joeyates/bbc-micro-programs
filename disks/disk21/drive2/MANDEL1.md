# MANDEL1

Mandelbrot set image creator.
Iterates in finer and finer blocks.

S% = 255 # Maximum loop counter

Asks for x -> j, y -> k and s -> q.

Q% = 1024
M% = 1 .. 256 doubling # the resolution
  L = q / M%

  H% = Q% / M% # Probably block height

  J% : 0 .. M% - 1
    K% : 0 .. M% - 1
      if K% and J% are even, call PROCpt

DEF FNm # The Mandelbrot function
