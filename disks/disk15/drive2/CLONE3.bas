
   10DIM data% 4097,ID% 200,bl% 20
   20X%=bl% MOD 256:Y%=bl% DIV 256
   30MODE7:A%=&7F:osw%=&FFF1:?bl%=0
   40SKIP=FALSE:FOR tr%=0 TO 79
   50IF SKIP THEN 100
   60PRINT'"SOURCE:";:REPEATUNTILGET=32
   70REM   SEEK TRACK 0
   80PROCOSW(0,0,1,&69,0,0,0,0,0)
   90IF bl%?8<>0 THEN END
  100REM   READ SECTOR IDS
  110PROCOSW(0,ID%,3,&5B,tr%,0,18,0,0)
  120SKIP=FALSE
  130IF bl%?10<>0 SKIP=TRUE:GOTO 350
  140PROCHOWMANY
  160REM   PROGRAM 8271 FOR SOFT TRACK
  170PROCOSW(0,0,2,&3A,&12,?ID%,0,0,0)
  173low%=&FF
  174FOR I=0 TO NUM%
  175IF ID%?(I*4+2)<low% low%=ID%?(I*4+2)
  176NEXTI
  180REM   READ TRACK
  190PROCOSW(0,data%,3,&57,?ID%,low%,32*ID%?3+NUM%+1,0,0)
  200CLS:PRINT"Track ";tr%
  210del%=bl%?10 AND &20:err%=bl%?10 AND &1F
  220IF err%<>0 THEN PRINT"###";err%
  240PRINT'"DEST:";:REPEATUNTILGET=32
  250REM   SEEK TO TRACK 0
  260PROCOSW(0,0,1,&69,0,0,0,0,0)
  270REM   FORMAT TRACK
  280PROCOSW(0,ID%,5,&63,tr%,21,32*ID%?3+NUM%+1,0,16)
  300REM   PROGRAM 8271 FOR SOFT TRACK
  310PROCOSW(0,0,2,&3A,&12,?ID%,0,0,0)
  320REM   WRITE DATA
  330IFdel%=0 wr%=&4B ELSE wr%=&4F
  340PROCOSW(0,data%,3,wr%,?ID%,low%,32*ID%?3+NUM%+1,0,0)
  350NEXT tr%:END
  360DEFPROCOSW(side%,addr%,par%,comm%,P1%,P2%,P3%,P4%,P5%)
  370bl%?0=side%:bl%!1=addr%
  380bl%?5=par%:bl%?6=comm%
  390bl%?7=P1%:bl%?8=P2%:bl%?9=P3%
  400bl%?10=P4%:bl%?11=P5%
  410CALLosw%
  420ENDPROC
  430DEF PROCHOWMANY
  440NUM%=0:FIRST%=ID%?2
  450IFID%?(6+4*NUM%)<>FIRST% NUM%=NUM%+1:GOTO 450 ELSE ENDPROC

