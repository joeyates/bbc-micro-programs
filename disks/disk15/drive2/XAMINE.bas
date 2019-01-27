
   10DIM data% 4097,bl% 20:sc%=1
   20X%=bl% MOD 256:Y%=bl% DIV 256
   30MODE7:A%=&7F:osw%=&FFF1:?bl%=0
   35FOR tr%=0 TO 79
   40REPEATUNTIL GET=32
  150!(bl%+1)=data%:bl%?5=3:bl%?6=&57
  160bl%?7=tr%:bl%?8=sc%:bl%?9=161
  170CALLosw%:REM READ TRACK
  180CLS:PRINT"Tr :";tr%,sc%
  210FOR I=0 TO 4096:IFI MOD8=0 PRINTTAB(26);I
  220 IF I MOD 305=0 THEN PRINT '
  225X=data%?I:IF X<16 PRINT;" ";
  230PRINT;~data%?I;" ";
  240NEXT I
  250sc%=(sc%+7) MOD 10
  270NEXT tr%

