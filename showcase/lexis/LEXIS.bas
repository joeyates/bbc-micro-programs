   10 REM Globals:
   20 REM W% - remaining words
   30 REM X%, Y% - bullet coordinates
   40 REM S% - score
   50 REM H% - game screen needs repainting
   60 HS% = 2 : REM Word value
   70 BS% = 1 : REM Bullet cost
   80 WS% = 2 : REM Wrong word cost
   90 MODE7
  100 DIM F$(25) : REM Exercise file names
  110 DIM A$(2) : REM Word group titles
  120 DIM W$(3,8) : REM Words
  130 DIM W%(3,8) : REM Word group indicators (1 or 2)
  140 G% = FN_choose_group
  150 F$ = FNchoose_exercise(G%)
  160 PROC_load_exercise(F$)
  170 PROC_initialize_game_variables
  180 PROC_shuffle_words
  190 PROC_explain_exercise
  200 TIME=0
  210 
  220 IF FNcheck PROCmove: GOTO 220: REM ensure there is a shootable word
  230 IF NOT H% GOTO250
  240 PROC_show_game_screen
  250 PROC_draw_bullet
  260 IF W% < 1 GOTO370 : REM All done?
  270 IF Y% <> 15 GOTO350
  280 IF NOT FN_check_strike GOTO330
  290 H%=TRUE
  300 PROC_replace_word
  310 S%=S%+HS%
  320 W%=W%-1
  330 PRINTTAB(X%,Y%);" ";
  340 Y%=24
  350 GOTO220
  360 
  370 T%=TIME/100
  380 CLS
  390 PROCbig(0, 0, 129, 131, "LEXIS: " + T$)
  400 PROCbig(0, 2, 130, 131, "Time: " + STR$(T%) + " seconds")
  410 PROCbig(0, 4, 131, 129, "Your Score:" + STR$(S%))
  420 Q% = FNchoice
  430 GOTO 140
  440 
  450 DEF FNcheck
  460 R%=TRUE:I%=0
  470 REPEAT IF W%(I%,1) <> O% R%=FALSE
  480 I%=I%+1
  490 UNTIL I%=4 OR R%=FALSE
  500 =R%
  510 
  520 DEF PROCmove
  530 FOR I%=0TO3
  540   E$=W$(I%,1):E%=W%(I%,1)
  550   FOR J%=1TO7-M%
  560     W%(I%,J%)=W%(I%,J%+1)
  570     W$(I%,J%)=W$(I%,J%+1)
  580   NEXT J%
  590   W$(I%,8-M%)=E$:W%(I%,8-M%)=E%
  600 NEXT I%
  610 M%=M%+1:W%=W%-4
  620 ENDPROC
  630 
  640 DEF PROC_show_game_screen
  650 CLS
  660 PROCbig(0, 0, 129, 131, "LEXIS: " + T$)
  670 PROCbig(0, 2, 129, 131, "Points: " + STR$(S%))
  680 PRINTTAB(0, 5);"Shoot ";N$
  690 FOR I%=0TO3:FOR J%=1TO8
  700   PRINTTAB((I%)*10,15-J%);W$(I%,J%)
  710 NEXT J%,I%:H%=FALSE
  720 ENDPROC
  730 
  740 DEF PROC_draw_bullet
  750 PRINTTAB(X%,Y%);" ";
  760 IF Y%>0 AND Y%<24 Y%=Y%-1
  770 IFINKEY(-98) AND X%>0 X%=X%-1 : REM 'z' - left
  780 IFINKEY(-67) AND X%<38 X%=X%+1 : REM 'x' - right
  790 IFINKEY(-74) AND Y%=24 Y%=23:S%=S%-BS% : REM <return> - fire
  800 PRINTTAB(X%,Y%);"^";
  810 ENDPROC
  820 
  830 DEF FN_check_strike
  840 R%=FALSE:C%=INT(X%/10)
  850 IFX%-C%*10>=LEN(W$(C%,1)) GOTO 890
  860 IF W$(C%,1)="" GOTO 890
  870 IF W%(C%,1)=O% SOUND1,-12,20,3:S%=S%-WS%:GOTO890
  880 R%=TRUE:SOUND0,-12,30,8
  890 =R%
  900 
  910 DEF PROC_replace_word
  920 A%=(W%+3)MOD4:B%=(W%+3)DIV4
  930 C%=INT(X%/10)
  940 W$(C%,1)=W$(A%,B%)
  950 W%(C%,1)=W%(A%,B%)
  960 W$(A%,B%)=""
  970 ENDPROC
  980 DEF FN_choose_group
  990 CLS
 1000 RESTORE
 1010 READ C% : REM The group count
 1020 PROCbig(0,0,129,131, "LEXIS: Choose group")
 1030 PROCbig(0,2,131,130, "Press the LETTER of the group")
 1040 PRINT
 1050 FOR I% = 1 TO C%
 1060   READ T$, Q%, L% : REM Exercise type, number of exercises, data line
 1070   PRINT;CHR$(64+I%);")";TAB(3);T$
 1080 NEXT I%
 1090 R% = FN_choose_in_range(C%)
 1100 = R% - 1
 1110 
 1120 DEF FNchoose_exercise(X%)
 1130 CLS
 1140 RESTORE
 1150 READ R% : REM Discard the group count
 1160 FOR I% = 0 TO X%
 1170   READ T$, Q%, L% : REM Exercise type, number of exercises, data line
 1180 NEXT I%
 1190 PROCbig(0,0,129,131,"LEXIS: "+T$)
 1200 PROCbig(0,2,131,130,"Press the LETTER of the exercise")
 1210 PRINT
 1220 RESTORE L%
 1230 FOR I% = 1 TO Q%
 1240   READ F$(I%), G$
 1250   PRINT;CHR$(64+I%);")";TAB(3);G$
 1260 NEXT I%
 1270 R% = FN_choose_in_range(Q%)
 1280 F$ = F$(R%)
 1290 =F$
 1300 
 1310 DEF PROC_load_exercise(F$)
 1320 Z% = OPENUP F$
 1330 FOR K%=0 TO 1
 1340   INPUT# Z%, A$(K%+1)
 1350   FOR I%=0TO3
 1360     FOR J%=1TO4
 1370       INPUT#Z%, W$(I%,J%+4*K%), W%(I%,J%+4*K%)
 1380     NEXT J%
 1390   NEXT I%
 1400 NEXT K%
 1410 CLOSE#0
 1420 ENDPROC
 1430 
 1440 DEF PROC_explain_exercise
 1450 CLS
 1460 PROCbig(0, 0, 129, 131, "LEXIS: "+T$)
 1470 PROCbig(0, 5, 131, 130, "Shoot")
 1480 PROCbig(0, 7, 131, 130, N$)
 1490 PROCbig(0, 10, 131, 129, "Don't shoot")
 1500 PROCbig(0, 12, 131, 129, O$)
 1510 PROCbig(0, 20, 131, 130, "   Press FIRE to start the game")
 1520 R% = FNchoice
 1530 ENDPROC
 1540 
 1550 DEF PROC_initialize_game_variables
 1560 W%=32
 1570 X%=18
 1580 Y%=24
 1590 M%=0
 1600 H%=TRUE
 1610 S%=0
 1620 ENDPROC
 1630 
 1640 DEF FNchoice
 1650 *FX 15,1
 1660 REPEAT R% = GET: UNTIL R% <> 0
 1670 =R%
 1680 DEF PROCbig(A%,B%,C%,D%,B$)
 1690 FOR E%=0 TO 1
 1700   PRINTTAB(A%,B%+E%);
 1710   VDU C%,157,D%,141:PRINTB$
 1720 NEXT E%
 1730 ENDPROC
 1740 DEF PROClog(M)
 1750   PRINTTAB(36, 20);
 1760   PRINT M
 1770 ENDPROC
 1780 
 1790 DEF PROC_shuffle_words
 1800 FOR K%=1TO20
 1810   A%=RND(4)-1:B%=RND(8)
 1820   C%=RND(4)-1:D%=RND(8)
 1830   E%=W%(A%,B%):W%(A%,B%)=W%(C%,D%)
 1840   E$=W$(A%,B%):W$(A%,B%)=W$(C%,D%)
 1850   W%(C%,D%)=E%:W$(C%,D%)=E$
 1860 NEXT K%
 1870 N%=RND(2)
 1880 O% = 3-N% : REM O% - wordcode to avoid
 1890 N$=A$(N%): O$=A$(O%)
 1900 ENDPROC
 1910 
 1920 DEF FN_choose_in_range(M%)
 1930 R% = FNchoice
 1940 IF R% <> 3 GOTO 1960
 1950 *FX 210,1 : REM Sound on
 1960 IF R% <> 4 GOTO 1980
 1970 *FX 210,0 : REM Sound off
 1980 R% = (R% AND &5F) - 64 : REM Convert to exercise index
 1990 IF R% < 1 OR R% > M% GOTO 1930
 2000 =R%
 2010 DATA 6
 2020 DATA Grammar,11,3000
 2030 DATA Consonants,9,4000
 2040 DATA Vowels,11,5000
 2050 DATA Vocabulary,16,6000
 2060 DATA Vocabulary II,6,7000
 2070 DATA Spelling,2,8000
 3000 DATA G.PREPAST,Present tenses and Past tenses
 3010 DATA G.PAST-PP,Past Tenses and Past Participles
 3020 DATA G.GER-INF,Verbs with Gerund and Infinitive
 3030 DATA G.IRREGPL,Irregular plurals
 3050 DATA G.MAKE-DO,Make words and Do words
 3060 DATA G.PRONPOS,Pronouns and Possessive Pronouns
 3070 DATA G.MOD-AUX,Modal verbs and Auxilliary verbs
 3080 DATA G.THE-0,Articles: 'The' or no article
 3090 DATA G.PLCTIME,Prepositions of Place and Time
 3100 DATA G.MUCHMNY,Countable and uncountable
 3110 DATA G.IR-REG,Regular and irregular verbs
 4000 DATA C.CHK,'ch' and 'k'
 4010 DATA C.CONSJ,'j' as a consonant
 4020 DATA C.FORTLEN,Fortis and lenis
 4030 DATA C.INITTH,Initial 'th'
 4040 DATA C.JG,'j' and 'g'
 4050 DATA C.MEDTH,Medial and final 'th'
 4060 DATA C.RPRON,Pronunciation of 'r'
 4070 DATA C.SEFINAL,Final 'se'
 4080 DATA C.SMEDIAL,Medial 's'
 5000 DATA V.WEAKFMS,Weak Forms
 5005 DATA V.A-OUGH,'-augh' and '-ough'
 5010 DATA V.ART-CAT,'ar' and short 'a'
 5020 DATA V.GO-NEW,Long 'o' and 'oo'
 5030 DATA V.GO-SAW,Long 'o' and 'aw'
 5040 DATA V.LONGSHT,Long and short vowels
 5050 DATA V.NOT-CUT,Short 'o' and short 'u'
 5060 DATA V.PUT-BUT,Irregular short 'u'
 5070 DATA V.PUT-TOO,Put/too
 5080 DATA V.SEE-TEN,/i:/ and /e/
 5090 DATA V.SEETEN2,/i:/ and /e/ - part II
 6000 DATA W.COOKTEX,Cooking methods and texture
 6010 DATA W.EATDOOR,Door words and eating words
 6020 DATA W.GDNCLSS,Classroom objects and garden objects
 6030 DATA W.JOBWORK,Names of jobs and work words
 6040 DATA W.MOODNOI,Moods and mouth noises
 6050 DATA W.AIR-STN,Airports and stations
 6060 DATA W.BODFACE,Body and face
 6070 DATA W.BOD-LIQ,Body motion and liquids
 6080 DATA W.BTHTOOL,Bathroom objects and tools
 6090 DATA W.CAR-HSE,Car parts and house parts
 6100 DATA W.CLO-RM,Rooms and clothes
 6110 DATA W.FE-MALE,Males and females
 6120 DATA W.HANDMTH,Hand and mouth verbs
 6130 DATA W.KIT-BED,Kitchen and bedroom
 6140 DATA W.MEATVEG,Meat and vegetables
 6150 DATA W.PC-CONT,Pieces and containers
 7000 DATA X.AMENGTR,American and English translation
 7010 DATA X.AMENGVO,American and English vocabulary
 7020 DATA X.MKSTAT,Puntuation and stationery
 7030 DATA X.YNG-OLD,Young and adult animals
 7040 DATA X.NATIONS,Nations
 7050 DATA X.CH-SURF,Character and surfaces
 8000 DATA S.AMENGSP,American and English spelling
 8010 DATA S.LSILENT,Silent 'l'
