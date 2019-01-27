
    0MODE7:ON ERROR MODE7:PROCerror1
  110 MODE 7
  120 VDU 23;8202;0;0;0;
  130 *FX4,1
  140 PROCsetup
  150 
  160 P%=1
  170 PROCtitle
  180 PROCmenu
  190 IF K%<>53 THEN 220 ELSE *FX4,0
  200 MODE 7:PRINT:PRINT
  210 END
  220 PROCtitle
  230 IF K%<51 L%=1 ELSE L%=0
  240 IF K%=49 OR K%=51 H%=1 ELSE H%=0
  250 PROCenter
  260 
  270 P%(P%)=S%
  280 S%=P%(P%)
  290 CLS
  300 PRINT
  310 IF PR%=1 VDU 2
  320 IF L%=0 FOR I%=1 TO 23
  330 PROCaddress
  340 M$=M$(?S%)
  350 T%=ASC(RIGHT$(M$,1))
  360 PROCopmn
  370 IF T%=76 PROCbranch:GOTO 420
  380 IF T%<66 THEN 420
  390 PROCbefore
  400 IF C%=2 PROCtwo ELSE PROCthr
  410 PROCafter
  420 PROCascii
  430 PRINT
  440 S%=S%+C%
  450 IF L%=1 AND E%>=S% THEN 330
  460 IF S%>65535 S%=S%-65536
  470 IF L%=0 NEXT
  480 VDU 3
  490 
  500 *FX15,1
  510 K%=INKEY(0)
  520 IF K%=-1 THEN 510
  530 IF L%=0 AND K%=138 AND P%<N% P%=P%+1:GOTO270
  540 IF L%=0 AND K%=139 AND P%>1 P%=P%-1:GOTO280
  545IF L%=0 AND K%=77 CLEAR:GOTO110
  550 VDU 7
  560 GOTO 500
  570 
  580 DEF PROCsetup
  590 N%=100
  600 DIM P%(N%),M$(255)
  610 FOR I%=0 TO 255
  620 READ M$(I%)
  630 NEXT
  640 ENDPROC
  650 
  660 DEF PROCtitle
  670 CLS
  680 PRINT TAB(0,1);CHR$(150);STRING$(38,"`")
  690 PRINT TAB(7,3);CHR$(141);"D I S A S S E M B L E R"
  700 PRINT TAB(7,4);CHR$(141);"D I S A S S E M B L E R"
  710 PRINT TAB(10,7);"(C) 1982  J.Wallace"
  720 PRINT TAB(0,9);CHR$(150);STRING$(38,"`")
  730 ENDPROC
  740 
  750 DEF PROCmenu
  760 PRINT TAB(15,10);"M E N U"
  770 PRINT TAB(4,12);"1. LIST MODE in hexadecimal."
  780 PRINT TAB(4,14);"2. LIST MODE in decimal."
  790 PRINT TAB(4,16);"3. PAGE MODE in hexadecimal."
  800 PRINT TAB(4,18);"4. PAGE MODE in decimal."
  810 PRINT TAB(4,20);"5. END."
  820 PRINT TAB(0,22);CHR$(150);STRING$(38,"`")
  830 PRINT TAB(14,23);"ENTER 1-5"
  840 PRINT TAB(0,24);CHR$(150);STRING$(38,"p");
  850 K%=GET
  860 IF K%<49 OR K%>53 VDU 7:GOTO 850
  870 ENDPROC
  880 
  890 DEF PROCenter
  900 PR%=0
  910 IF H%=1 T$="HEX" ELSE T$="DECIMAL"
  920 PRINT TAB(0,12);"Enter ";T$;" start address"
  930 INPUT TAB(22+LEN(T$),12)">" E$
  940 ER%=0
  950 IF H%=1 PROCcheckhex ELSE PROCcheckdec
  960 IF ER%=1 Y%=12:PROCerror:GOTO 920
  970 S%=D%
  980 IF L%=0 ENDPROC
  990 PRINT TAB(0,17);"Enter ";T$;" end address"
 1000 INPUT TAB(22+LEN(T$),17)">" E$
 1010 ER%=0
 1020 IF H%=1 PROCcheckhex ELSE PROCcheckdec
 1030 IF S%>=D% ER%=1
 1040 IF ER%=1 Y%=17:PROCerror:GOTO 990
 1050 E%=D%
 1060 PRINT TAB(0,22);"Printout ?  (Y/N)        >"
 1070 IF GET$="Y" THEN PR%=1
 1080 ENDPROC
 1090 
 1100 DEF PROCcheckhex
 1110 LE%=LEN(E$)
 1120 IF LE%<1 OR LE%>4 ER%=1:ENDPROC
 1130 D%=0
 1140 FOR I%=LE% TO 1 STEP -1
 1150 A%=ASC(MID$(E$,I%))
 1160 IF A%<48 OR  A%>70 ER%=1
 1170 IF A%>57 AND A%<65 ER%=1
 1180 IF A%<58 A%=A%-48 ELSE A%=A%-55
 1190 D%=D%+A%*16^(LE%-I%)
 1200 NEXT
 1210 ENDPROC
 1220 
 1230 DEF PROCcheckdec
 1240 LE%=LEN(E$)
 1250 FOR I%=1 TO LE%
 1260 A%=ASC(MID$(E$,I%))
 1270 IF A%<48 OR A%>57 ER%=1
 1280 NEXT
 1290 IF ER%=1 ENDPROC
 1300 D%=VAL(E$)
 1310 IF D%<0 OR D%>65535 ER%=1
 1320 ENDPROC
 1330 
 1340 DEF PROCerror
 1350 PROCblank
 1360 PRINT"  INCORRECT NUMBER - PLEASE RE-ENTER"
 1370 T=TIME
 1380 REPEAT UNTIL TIME=T+300
 1390 PROCblank
 1400 *FX15,1
 1410 ENDPROC
 1420 
 1430 DEF PROCblank
 1440 PRINT TAB(0,Y%);
 1450 FOR I%=0 TO 6
 1460 PRINT STRING$(40," ");
 1470 NEXT
 1480 PRINT TAB(0,Y%);
 1490 ENDPROC
 1500 
 1510 DEF PROCaddress
 1520 PRINT TAB(2+H%);
 1530 IF S%<10 AND H%=0 OR S%<16 AND H%=1 PRINT"0";
 1540 IF S%<100 AND H%=0 OR S%<256 AND H%=1 PRINT"0";
 1550 IF S%<1000 AND H%=0 OR S%<4096 AND H%=1 PRINT"0";
 1560 IF S%<10000 AND H%=0 PRINT"0";
 1570 IF H%=1 PRINT;~S%;CHR$(FNA(134));SPC(1);
 1580 IF H%=0 PRINT;S%;CHR$(FNA(134));SPC(1);
 1590 ENDPROC
 1600 
 1610 DEF PROCopmn
 1620 IF T%<72 C%=2 ELSE C%=3
 1630 IF T%<66 C%=1
 1640 IF T%=76 C%=2
 1650 FOR J%=1 TO C%
 1660 B%=?(S%+J%-1)
 1670 IF B%<16 PRINT"0";
 1680 PRINT;~B%;SPC(1);
 1690 NEXT
 1700 PRINTCHR$(FNA(135));
 1710 PRINT TAB(19);
 1720 A$=LEFT$(M$,3)
 1730 IF T%=76 AND (A$<>"JMP" AND A$<>"JSR") PRINTCHR$(FNA(131));
 1740 IF A$="JMP" PRINTCHR$(FNA(129));
 1750 IF A$="JSR" PRINTCHR$(FNA(133));
 1760 PRINTTAB(20);
 1770 IF T%=63 PRINT"???"; ELSE PRINT A$;
 1780 IF T%=64 PRINT SPC(2);"A";
 1790 ENDPROC
 1800 
 1810 DEF PROCbefore
 1820 PRINT TAB(24);
 1830 IF T%=66 PRINT"#";
 1840 IF T%=70 OR T%=71 OR T%=75 PRINT"(";
 1850 ENDPROC
 1860 
 1870 DEF PROCtwo
 1880 PRINT TAB(25);
 1890 B%=?(S%+1)
 1900 IF B%<16 AND H%=1 PRINT"0";
 1910 IF H%=1 PRINT;~B%;
 1920 IF H%=0 PRINT;B%;
 1930 ENDPROC
 1940 
 1950 DEF PROCthr
 1960 PRINT TAB(25);
 1970 FOR J%=2 TO 1 STEP -1
 1980 B%=?(S%+J%)
 1990 IF J%=2 B1%=B%
 2000 IF H%=1 AND B%<16 PRINT"0";
 2010 IF H%=1 PRINT;~B%;
 2020 IF J%=1 AND H%=0 PRINT;B1%*256+B%;
 2030 NEXT
 2040 ENDPROC
 2050 
 2060 DEF PROCafter
 2070 IF T%>67 AND T%<71 PRINT",";
 2080 IF T%=73 OR T%=74 PRINT",";
 2090 IF T%=71 OR T%=75 PRINT")";
 2100 IF T%=71 PRINT",";
 2110 IF T%=68 OR T%=70 PRINT"X";
 2120 IF T%=73 PRINT"X";
 2130 IF T%=69 OR T%=74 PRINT"Y";
 2140 IF T%=70 PRINT")";
 2150 IF T%=71 PRINT"Y";
 2160 ENDPROC
 2170 
 2180 DEF PROCascii
 2190IF C%<>3 GOTO2260 ELSE Z%=B1%*256+B%
 2200RESTORE 2620:X%=0:PRINTTAB(32);
 2210FORV%=1TO47
 2220READ W%,W$
 2230IF Z%=W% PRINTCHR$(FNA(132));W$;:X%=1:V%=47
 2240NEXT
 2250IF X%=1 ENDPROC
 2260 PRINT TAB(33);CHR$(FNA(130));
 2270 FOR J%=1 TO C%
 2280 B%=?(S%+J%-1)
 2290 IF B%>31 AND B%<127 PRINT CHR$(B%); ELSE PRINT SPC(1);
 2300 NEXT
 2310 ENDPROC
 2320 
 2330 DEF PROCbranch
 2340 PRINT TAB(25);
 2350 B%=?(S%+1)
 2360 IF B%<128 Q%=S%+B%+2
 2370 IF B%>127 Q%=S%+B%-254
 2380 IF H%=1 PRINT;~Q%;
 2390 IF H%=0 PRINT;Q%;
 2400 ENDPROC
 2410 
 2420DEF FNA(x%)
 2430=(1-PR%)*x%+PR%*32
 2440 DATA BRKA,ORAF,?,?,?,ORAC,ASLC,?,PHPA,ORAB,ASL@,?,?,ORAH,ASLH
 2450 DATA ?,BPLL,ORAG,?,?,?,ORAD,ASLD,?,CLCA,ORAJ,?,?,?,ORAI,ASLI
 2460 DATA ?,JSRH,ANDF,?,?,BITC,ANDC,ROLC,?,PLPA,ANDB,ROL@,?,BITH
 2470 DATA ANDH,ROLH,?,BMIL,ANDG,?,?,?,ANDD,ROLD,?,SECA,ANDJ,?,?,?
 2480 DATA ANDI,ROLI,?,RTIA,EORF,?,?,?,EORC,LSRC,?,PHAA,EORB,LSR@
 2490 DATA ?,JMPH,EORH,LSRH,?,BVCL,EORG,?,?,?,EORD,LSRD,?,CLIA,EORJ
 2500 DATA ?,?,?,EORI,LSRI,?,RTSA,ADCF,?,?,?,ADCC,RORC,?,PLAA,ADCB
 2510 DATA ROR@,?,JMPK,ADCH,RORH,?,BVSL,ADCG,?,?,?,ADCD,RORD,?,SEIA
 2520 DATA ADCJ,?,?,?,ADCI,RORI,?,?,STAF,?,?,STYC,STAC,STXC,?
 2530 DATA DEYA,?,TXAA,?,STYH,STAH,STXH,?,BCCL,STAG,?,?,STYD,STAD
 2540 DATA STXE,?,TYAA,STAJ,TXSA,?,?,STAI,?,?,LDYB,LDAF,LDXB,?
 2550 DATA LDYC,LDAC,LDXC,?,TAYA,LDAB,TAXA,?,LDYH,LDAH,LDXH,?,BCSL
 2560 DATA LDAG,?,?,LDYD,LDAD,LDXE,?,CLVA,LDAJ,TSXA,?,LDYI,LDAI
 2570 DATA LDXJ,?,CPYB,CMPF,?,?,CPYC,CMPC,DECC,?,INYA,CMPB,DEXA,?
 2580 DATA CPYH,CMPH,DECH,?,BNEL,CMPG,?,?,?,CMPD,DECD,?,CLDA,CMPJ,?
 2590 DATA ?,?,CMPI,DECI,?,CPXB,SBCF,?,?,CPXC,SBCC,INCC,?,INXA,SBCB
 2600 DATA NOPA,?,CPXH,SBCH,INCH,?,BEQL,SBCG,?,?,?,SBCD,INCD,?,SEDA
 2610 DATA SBCJ,?,?,?,SBCI,INCI,?
 2620DATA &FFD1,OSGBPB,&FFCE,OSFIND,&FFEE,OSWRCH,&FFC8,oswrch,&FFE0,OSRDCH,&FFCB,osrdch,&FFE7,OSNEWL,&FFE3,OSASCI,&FFBC,vducoe,&FFC2,GSINIT,&FFC5,GSREAD
 2630DATA &FFB9,OSRDRM,&FFBF,OSEVEN,&FFF7,OSCLI,&FFF4,OSBYTE,&FFF1,OSWORD,&FFD4,OSBPUT,&FFD7,OSBGET,&FFDA,OSARGS,&FFDD,OSFILE
 2640DATA &0200,USERV,&0202,BRKV,&0204,IRQ1V,&0206,IRQ2V,&0208,CLIV,&020A,BYTEV,&020C,WORDV,&020E,WRCHV,&0210,RDCHV,&0212,FILEV,&0214,ARGSV,&0216,BGETV,&0218,BPUTV,&021A,GBPBV,&021C,FINDV
 2650DATA &021E,FSCV,&0220,EVENTV,&0222,UPTV,&0224,NETV,&0226,VDUV,&0228,KEYV,&022A,INSV,&022C,REMV,&022E,CNPV,&0230,IND1V,&0232,IND2V,&0234,IND3V
32070DEF PROCerror1
32080IF ERR<>17 CLS:PRINT'':REPORT:PRINT" at line ";ERL:PRINT'"THAT SHOULDN'T BE THERE - PLEASE"'"DEBUG ME!":END
32090RUN

