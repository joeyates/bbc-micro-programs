   10 DIM C$(10),P(10)
   20 CLS
   30 PRINTTAB(10,5);"MAIN MENU";TAB(10,6);"---------"
   40 PRINTTAB(5,10);"STORE            (1)"
   50 PRINTTAB(5,12);"RETRIEVE         (2)"
   60 PRINTTAB(5,14);"CHECK ENTRIES    (3)"
   70 PRINTTAB(5,16);"EXIT PROGRAM     (4)"
   80 PRINTTAB(10,18);:INPUT"Please give your choice :"N
   90 IF N<1 OR N>4 THEN 20
  100 ON N GOTO 120,490,740,680
  110 
  120 PROCCOPY
  130 CLS:Z$=STRING$(40,"     ")
  140 PRINTTAB(10,5);"FILE INPUT";TAB(10,6);"----------"
  150 PROCCLR
  160 INPUTLINE"Author :"A$
  170 IF A$="STOP" THEN 440
  180 PROCCLR
  190 INPUTLINE"Title  :"T$
  200 PROCCLR
  210 INPUTLINE"Publisher,Place & Date :"P$
  220 PROCCLR 
  230 INPUTLINE"Pages & Plates :"I$
  240 PROCCLR
  250 INPUTLINE"Binding & Size(mm) :"B$
  260 PROCCLR
  270 INPUT"Box Number :"N%
  280 PROCCLR
  290 INPUT"Number of Copies :"M%
  300 PRINT#X,A$,T$,P$,I$,B$,N%,M%
  310 FOR I=1 TO M%
  320 PROCCLR
  330 PRINTTAB(5,9);"Book ";I;TAB(5,10);
  340 INPUTLINE"Condition :"C$(I)
  350 PROCCLR
  360 INPUT"Price :"P(I)
  370 PRINT#X,C$(I),P(I)
  380 NEXT I
  390 PROCCLR
  400 INPUTLINE"NOTES :"N$
  410 INPUTLINE N1$
  420 PRINT#X,N$,N1$
  430 GOTO 130
  440 CLOSE# X
  460 *REN. BK BOOKS
  470 GOTO 20
  480 
  490 Y=OPENUP ":2.BOOKS"
  500 REPEAT
  510 CLS
  520 PRINT:PRINT:PRINT
  530 INPUT#Y,A$,T$,P$,I$,B$,N%,M%
  540 PRINT A$,T$,P$,I$,B$,N%,M%
  550 FOR I=1 TO M%
  560 INPUT#Y,C$(I),P(I)
  570 PRINT C$(I),P(I)
  580 NEXT I
  590 INPUT#Y,N$,N1$
  600 PRINT N$,,N1$
  610 PRINT:PRINT:PRINT
  620 PRINT "Press any key to continue :";
  630 Y$=INKEY$(0):IF Y$="" THEN 630
  640 IF Y$="Q" THEN 660
  650 UNTIL EOF# Y
  660 CLOSE# Y 
  670 GOTO 20
  680 CLS:PRINT:PRINT:PRINT
  690 PRINTTAB(5,5);"BACK TO BASIC";TAB(1,7)
  700 END
  710 DEF PROCCLR
  720 PRINTTAB(5,10);Z$;TAB(5,10);
  730 ENDPROC
  740 INPUT"PASS WORD :"Q$:IF Q$<>"STUMPY" THEN 20
  750 CLS:PRINT:PRINT
  760 Y=OPENUP ":2.BOOKS"
  770 X=OPENOUT "BK"
  780 REPEAT
  790 PRINT:PRINT:PRINT
  800 INPUT#Y,A$,T$,P$,I$,B$,N%,M%
  810 PRINTA$,T$,P$,I$,B$,N%,M%
  820 FOR I=1 TO M%
  830 INPUT#Y,C$(I),P(I)
  840 PRINTC$(I),P(I)
  850 NEXT I
  860 INPUT#Y,N$,N1$
  870 PRINT N$,N1$
  880 INPUT"THROW OUT ",Q$:IF Q$="Y" THEN 1190
  890 INPUT"FILE O.K. ",Q$:IF Q$="Y" OR Q$="y" THEN 1140
  900 PRINTA$
  910 INPUTLINE"AUTHOR :"Q$:IF Q$<>"" THEN A$=Q$
  920 PRINT T$
  930 INPUTLINE"TITLE :"Q$:IF Q$<>"" THEN T$=Q$
  940 PRINT P$
  950 INPUTLINE"PUBLISHING :"Q$:IF Q$<>"" THEN P$=Q$
  960 PRINT I$
  970 INPUTLINE"PGS & PLTS :"Q$:IF Q$<>"" THEN I$=Q$
  980 PRINT B$
  990 INPUTLINE"BINDING &SIZE :"Q$:IF Q$<>"" THEN B$=Q$
 1000 PRINT N%
 1010 INPUT"BOX NUMBER :"Q%:IF Q%<>0 THEN N%=Q%
 1020 PRINT M%
 1030 INPUT"NUM OF COP :"Q%:IF Q%<>0 THEN M%=Q%
 1040 FOR I=1 TO M%
 1050 PRINT C$(I)
 1060 INPUTLINE"CONDITION :"Q$:IF Q$<>"" THEN C$(I)=Q$
 1070 PRINT P(I)
 1080 INPUT"PRICE :"Q:IF Q<>0 THEN P(I)=Q
 1090 NEXT I
 1100 PRINT N$
 1110 INPUTLINE"NOTES :"Q$:IF Q$<>"" THEN N$=Q$
 1120 PRINT N1$
 1130 INPUTLINE N1$
 1140 PRINT#X,A$,T$,P$,I$,B$,N%,M%
 1150 FOR I=1 TO M%
 1160 PRINT#X,C$(I),P(I)
 1170 NEXT I
 1180 PRINT#X,N$,N1$
 1190 UNTIL EOF#Y
 1200 CLOSE#0
 1220 *RENAME BK BOOKS
 1230 GOTO 20
 1240 
 1250 REM        COPY & OPEN FILE
 1260 DEF PROCCOPY
 1270 Y=OPENUP ":2.BOOKS"
 1280 X=OPENOUT "BK"
 1290 REPEAT
 1300 INPUT#Y,A$,T$,P$,I$,B$,N%,M%
 1310 PRINT#X,A$,T$,P$,I$,B$,N%,M%
 1320 FOR I=1 TO M%
 1330 INPUT#Y,C$(I),P(I)
 1340 PRINT#X,C$(I),P(I)
 1350 NEXT I
 1360 INPUT#Y,N$,N1$
 1370 PRINT#X,N$,N1$
 1380 UNTIL EOF#Y
 1390 CLOSE#Y
 1400 ENDPROC
