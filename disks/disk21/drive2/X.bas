>LIST
    1 ON ERROR GOTO 500
   60maxcol%=15
   70DIM C%(255),co%(maxcol%,1),A 30
   71FOR N%=0 TO maxcol%
   72READ co%(N%,0),co%(N%,1)
   73NEXT
   74DATA 0,0,&11,&22,&33,&33,&32,&31
   75DATA &30,&30,&34,&3B,&3C,&3C,&2C
   76DATA &1C,&0C,&0C,&0D,&0E,&0F,&0F
   77DATA &0B,&07,&03,&03,&17,&2B,&3F
   78DATA &3F,&2A,&15
  300MODE2
  310VDU 28,16,31,19,0
  400FORJ%=0 TO 127
  410FORK%=0 TO 127
  457?&359=co%((J%/8) MOD 15+1,K% MOD 2)
  470 PLOT 69,J%*8,K%*4
  480NEXT K%,J%
  490 A=GET
  500 MODE7:PRINT'':END
>*FX3,0