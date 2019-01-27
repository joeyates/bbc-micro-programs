
   10DIM W%(3,7),W$(3,7),T$(2),G$(20)
   11S$="                                        "
   15READZ$,N%,R$
   16G%=OPENOUT Z$
   18IFLEN(Z$)>29 Z$=LEFT$(Z$,29):GOTO 84
   20Z$=Z$+LEFT$(S$,29-LEN(Z$))
   22PROCP(Z$):BPUT#G%,N%
   25FORX%=1 TO N%
   27READ F$,G$(X%):F$=R$+F$
   28F%=OPENUP F$
   30FORK%=0 TO 1
   40INPUT#F%,T$(K%+1)
   50FOR I%=0TO3:FOR J%=0 TO 3
   60INPUT#F%,W$(I%,J%+4*K%),W%(I%,J%+4*K%)
   70NEXT J%,I%,K%
   71CLOSE#F%
   76IFLEN(G$(X%))>36 G$(X%)=LEFT$(G$(X%),36):GOTO 84
   77G$(X%)=G$(X%)+LEFT$(S$,36-LEN(G$(X%)))
   84IFLEN(T$(1))>36 T$(1)=LEFT$(T$(1),36):GOTO 86
   85T$(1)=T$(1)+LEFT$(S$,36-LEN(T$(1)))
   86IFLEN(T$(2))>36 T$(2)=LEFT$(T$(2),36):GOTO 88
   87T$(2)=T$(2)+LEFT$(S$,36-LEN(T$(2)))
   88PROCP(G$(X%)):PROCP(T$(1)):PROCP(T$(2))
   90FOR I%=0TO3:FOR J%=0 TO 7
  100BPUT#G%,W%(I%,J%)
  102NEXT J%,I%
  103FOR I%=0TO3:FOR J%=0 TO 7
  105L=10-LEN(W$(I%,J%))
  107PROCP(LEFT$(S$,INT(.5+L/2))+W$(I%,J%)+LEFT$(S$,INT(L/2)))
  110NEXT J%,I%
  113NEXT X%
  114CLOSE#0
  115END
  120DEF PROCP(A$)
  130FORZ%=1 TO LEN(A$) 
  140BPUT#G%,ASC(MID$(A$,Z%,1))
  150NEXT Z%
  170ENDPROC

