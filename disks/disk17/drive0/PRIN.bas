>LIST
   10 REM FORMATS BOOK FILE FOR SCREEN       AND/OR PRINTER OUTPUT
   12width=39:CLS
   15 PRINT"Printer output? (Y/N)";
   16 A$=GET$
   17 IF A$="Y" OR A$="y" THEN VDU 2:INPUT"Give printer width :",width
   18 REM PRINTER WIDTH SHOULD BE ABOUT 66CHARACTERS
   20 DIM cond$(10),price(10)
   60 box%=0:ch$=" !),-.:;?]"
   70 Y=OPENUP "BOOKS"
   80 ON ERROR GOTO 340
   90 REPEAT lastbox%=box%
  100 INPUT#Y,aut$,ttl$,pub$
  110 INPUT#Y,frm$,bnd$,box%,num%
  120 FOR I=1 TO num%
  130 INPUT#Y,cond$(I),price(I)
  140 NEXT I 
  150 INPUT#Y,note$,note1$
  160 IF lastbox%=box% THEN 180
  180 PRINT':pos=0:PROCPNT(aut$):PRINT:pos=0
  190 PROCPNT(ttl$):PRINT:pos=0
  195 PROCPNT(pub$)
  197 IF price(1)=0 THEN pos=0:GOTO 220
  200 IF pos>(width-6) THEN PRINT
  210 PRINTTAB(width-5);CHR$(96);price(1):pos=0
  220 PROCPNT(frm$):PROCPNT(bnd$)
  230 PROCPNT(note$):PROCPNT(note1$)
  240 PROCPNT(cond$(1))
  250 IF pos<>0 THEN PRINT:pos=0
  260 IF num%=1 THEN 315
  270 FOR I=2 TO num%
  280 PROCPNT("Another copy. "+cond$(I))
  290 IF pos>(width-5) THEN PRINT
  300 PRINTTAB(width-5);CHR$(96);price(I):pos=0
  310 NEXT I
  315 Y$=INKEY$(0):IF Y$="" THEN 315
  316REM CLS
  320 UNTIL EOF#Y
  330 PRINT'':GOTO 350
  340 REPORT:PRINT" at line ";ERL
  350 CLOSE#Y
  360 VDU 3
  370 END
  380 DEF PROCPNT(Q$)
  390 L=LEN(Q$)
  400 IF pos+L<width PRINT Q$;:pos=pos+L:ENDPROC
  410 Q%=width-pos+1
  420 REPEAT Q%=Q%-1:UNTIL INSTR(ch$,MID$(Q$,Q%,1)) OR Q%=0
  430 IF Q%=0 AND pos=0 PRINT LEFT$(Q$,width-1);"-":Q$=RIGHT$(Q$,L-width+1):pos=0:GOTO 390
  440 IF Q%=0 THEN PRINT:pos=0:GOTO 390
  450 IF Q%>width-pos THEN 420
  460 PRINT LEFT$(Q$,Q%):pos=0
  470 Q$=RIGHT$(Q$,L-Q%)
  480 GOTO 390
>*FX3,0
