>LIST
   10MODE7:VDU23;8202;0;0;0;
   20DIM file$(25),title$(2),word$(3,7),wval%(3,7)
   30file$=FNmenu
   50PROCinput(file$)
   55PROCvars
   60PROCshuffle
   70PROCpage
  110TIME=0
  130 
  135IF FNcheck topline%=topline%-1:GOTO 135
  150IF newdisp% PROCdisplay
  155IF wordsleft%=0 GOTO 270
  160PROCbullet
  180IF ybullet%<>7+topline% GOTO 250 
  190IF FNhit PROCfill:wordsleft%=wordsleft%-1
  200PRINTTAB(xbullet%,ybullet%);" ";:ybullet%=24
  250GOTO135
  260 
  270score$=STR$(score%+TIME/100)
  275PROCbig(4,130,131,"Your Time :"+score$)
  280result%=FNchoice
  300GOTO30
  310 
  320DEFFNcheck
  330result%=TRUE:I%=0
  340REPEATIF wval%(I%,topline%)<>noshoot% result%=FALSE
  345I%=I%+1
  360UNTIL I%=4 OR result%=FALSE
  370=result%
  500 
  510DEFPROCdisplay
  520CLS
  525PROCbig(0,132,134,"LEXIS :"+exercise$)
  527PROCbig(2,129,131,"Penalties :"+STR$(score%))
  530FOR I%=0 TO 3:FOR J%=0 TO topline%
  540PRINTTAB(I%*10,J%+6);word$(I%,J%)
  550NEXT J%,I%:newdisp%=FALSE
  555ENDPROC
  560 
  561DEFPROCbullet
  562PRINTTAB(xbullet%,ybullet%);" ";
  563IF ybullet%>0 AND ybullet%<24 ybullet%=ybullet%-1
  564IFINKEY(-65) AND xbullet%>0  xbullet%=xbullet%-1
  565IFINKEY(-2)  AND xbullet%<38 xbullet%=xbullet%+1
  566IFINKEY(-74) AND ybullet%=24 ybullet%=23
  568PRINTTAB(xbullet%,ybullet%);"^";
  569ENDPROC
  570 
  580DEFFNhit:result%=FALSE:col%=xbullet%/10
  610IFxbullet%>=col%*10+LEN(word$(col%,topline%)) GOTO650
  620IF word$(col%,topline%)="" GOTO 650
  625newdisp%=TRUE
  630IF wval%(col%,topline%)<>noshoot% GOTO 640
  635score%=score%+1:SOUND1,-12,20,3:GOTO650
  640result%=TRUE:SOUND0,-12,30,8
  650=result%
  660 
  670DEFPROCfill:col%=xbullet%/10
  680fromx%=fillword% MOD 4
  690fromy%=fillword% DIV 4
  720word$(col%,topline%)=word$(fromx%,fromy%)
  725wval%(col%,topline%)=wval%(fromx%,fromy%)
  726word$(fromx%,fromy%)=""
  727wval%(fromx%,fromy%)=0:fillword%=fillword%+1
  730ENDPROC
  930 
  940DEFFNmenu
  950CLS:RESTORE:READ exercise$,num%,info$
  955PROCbig(0,132,134,"LEXIS :"+exercise$)
  970PRINTTAB(0,4);
  980FOR I%=1TO num%:READ file$(I%),explan$
 1000PRINT;CHR$(64+I%);")";TAB(3);explan$
 1010NEXT I%
 1011PROCbig(22,131,130,"Press the LETTER of the exercise")
 1012result%=FNchoice
 1013IF result%=101 CHAIN"LEXIS"
 1015IF result%<>102 GOTO 1019
 1017*FX 210,1
 1018GOTO1012
 1019IF result%<>103 GOTO 1024
 1020*FX 210,0
 1022GOTO1012
 1024result%=(result% AND &5F)-64
 1025IF result%<1 OR result%>num% GOTO 1011
 1030file$=info$+file$(result%)
 1040=file$
 1050 
 1060DEFPROCinput(file$)
 1070file%=OPENUP file$
 1075FORK%=0 TO 1
 1080INPUT#file%,title$(K%+1) 
 1090FOR I%=0TO3:FOR J%=0 TO 3
 1100INPUT#file%,word$(I%,J%+4*K%),wval%(I%,J%+4*K%)
 1110NEXT J%,I%,K%
 1120CLOSE#0
 1121ENDPROC
 1122 
 1125DEF PROCpage:CLS
 1140PROCbig(0,132,134,"LEXIS :"+exercise$)
 1150PROCbig(5,130,131,"Shoot")
 1153PROCbig(7,130,131,title$(3-noshoot%))
 1156PROCbig(10,129,131,"Don't shoot")
 1159PROCbig(12,129,131,title$(noshoot%))
 1162PROCbig(22,131,130,"  Press FIRE to start the game")
 1165result%=FNchoice
 1200ENDPROC
 1210 
 1290DEFPROCvars:wordsleft%=16:xbullet%=18:ybullet%=24
 1300topline%=7:fillword%=0:newdisp%=TRUE:score%=0:ENDPROC
 1320 
 1330DEF FNchoice
 1340*FX 15,1
 1350REPEATresult%=GET:UNTILresult%<>0
 1420=result%
 1430 
 1440DEF PROCbig(vtab%,backgnd%,foregnd%,big$)
 1450FOR E%=0 TO 1:PRINTTAB(0,vtab%+E%);
 1460VDU backgnd%,157,foregnd%,141:PRINTbig$
 1470NEXT E%
 1480ENDPROC
 1500 
 1510DEF PROCshuffle
 1520FOR K%=1TO20
 1530A%=RND(4)-1:B%=RND(8)-1
 1540C%=RND(4)-1:D%=RND(8)-1
 1550E%=wval%(A%,B%):wval%(A%,B%)=wval%(C%,D%)
 1560E$=word$(A%,B%):word$(A%,B%)=word$(C%,D%)
 1570wval%(C%,D%)=E%:word$(C%,D%)=E$
 1580NEXT K%
 1590noshoot%=RND(2)
 1610ENDPROC
 1620 
 2000DATA Grammar,10,:2.G.
 2010DATA PREPAST,Present tenses and Past tenses
 2020DATA PAST/PP,Past Tenses and Past Participles
 2030DATA GER/INF,Verbs with Gerund and Infinitive
 2040DATA IRREGPL,Irregular plurals
 2050DATA WEAKFMS,Weak Forms
 2060DATA MAKE/DO,Make words and Do words
 2070DATA PRONPOS,Pronouns and Possessive Pronouns
 2080DATA MOD/AUX,Modal verbs and Auxilliary verbs
 2090DATA THE/0,Articles : 'The' or no article
 2100DATA PLCTIME,Prepositions of Place and Time
>*FX3,0
