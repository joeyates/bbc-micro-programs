>LIST
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
   80FOR N%=0 TO 255
   90C%(N%)=0
  100NEXT
  120INPUT"file :"A$
  130file=OPENUP A$
  140FOR N%=1 TO 128*128
  150B%=BGET#file
  160C%(B%)=C%(B%)+1
  170NEXT
  190max=(128*128-C%(255))/maxcol%
  200C%(255)=0
  210J%=maxcol%
  220T%=0
  230FORN%=0 TO 254
  240T%=T%+C%(N%)
  250C%(N%)=J%
  260IF T%>=max*(maxcol%-J%+1) J%=J%-1:IF J%<1 J%=1
  270NEXT
  300MODE2
  310VDU 28,16,31,19,0
  320VDU 19,1,5;0;
  330VDU 19,2,4;0;
  340VDU 19,3,6;0;
  350VDU 19,4,2;0;
  360VDU 19,5,3;0;
  370VDU 19,6,1;0;
  380H%=8
  390PTR#file=0
  400FORJ%=0 TO 127
  410FORK%=0 TO 127
  420dummy%=BGET#file
  440X%=J%*H%
  450Y%=K%*H%
  455I%=0
  456FOR i2%=Y% TO Y%+H%-1 STEP 4
  457?&359=co%(C%(dummy%),I%)
  460MOVE X%,i2%
  470DRAW X%+H%-1,i2%
  475IF I%=0 I%=1 ELSE I%=0
  480NEXTi2%,K%,J%
  491$A="SAVE S."+A$+" 3000+5000"
  492X%=A MOD 256:Y%=A DIV 256
  493CALL &FFF7
  500END
>*FX3,0
