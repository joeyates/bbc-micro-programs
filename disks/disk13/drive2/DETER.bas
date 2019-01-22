>LIST
   10 CLS
   20 PRINTTAB(10,4)"DETERMINANTS"
   30 PRINTTAB(10,5)"____________"
   40 PRINTTAB(0,8)"This program serves two purposes:-        The first is as a practical demonstra-tion of the process of recursion,withoutwhich this program would have become im-mensely complicated."
   50 PRINT" The other is to find determinants of n-dimensional matrices.Which is effected  by defining that determinant in terms ofsmaller matrices - the recursive defini-tion."
   60 PRINTTAB(20,20)"PRESS ANY KEY :";
   70 F$=INKEY$(0):IF F$="" THEN 70
   80 CLS:PRINT:PRINT:PRINT
   90 INPUT "How many dimensions :",N%
  100 IF N%>9 OR N%<1 THEN CLS:PRINTTAB(5,5)"Max. dimension is 9":GOTO 60
  110 DIM B(N%,N%,N%),D(N%):CLS
  120 FOR I%=1 TO N%:FOR J%=1 TO N%
  130 PRINTTAB(10,2)"MATRIX INPUT"
  140 PRINTTAB(4,22)"Give MAT ELEMENT (";I%;",";J%;"            ";TAB(25,22);
  150 INPUT ") :"B(N%,I%,J%)
  160 PRINTTAB(J%*3+2,I%*2+2);B(N%,I%,J%)
  170 NEXT J%,I%
  180 CLS:PRINTTAB(10,5)"CALCULATING"
  190 X=FNDET(N%)
  200 CLS
  202 PRINTTAB(5,2)"The determinate of the matrix :"
  205 FOR I%=1 TO N%:FOR J%=1 TO N%
  210 PRINTTAB(J%*3+2,I%*2+2);B(N%,I%,J%)
  220 NEXT J%,I%
  225 PRINTTAB(10,22)"is ";X
  230 END
  240 DEF FNDET(N%)
  250 D(N%)=0
  260 LOCAL I%,J%,K%,L%
  270 IF N%=1 THEN D(N%)=B(1,1,1):GOTO 380
  280 FOR I%=1 TO N%
  290 K%=0
  300 FOR J%=1 TO N%-1
  310 IF I%=J% THEN K%=1
  320 FOR L%=2 TO N%
  330 B(N%-1,J%,L%-1)=B(N%,J%+K%,L%)
  340 NEXT L%,J%
  350 S=FNDET(N%-1)
  360 D(N%)=D(N%)+(-1)^(I%+1)*B(N%,I%,1)*S
  370 NEXT I%
  380 =D(N%)
>*FX3,0
