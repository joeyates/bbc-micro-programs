>LIST
   10OSWRCH=&FFEE:OSBYTE=&FFF4:OSASCI=&FFE3
   20OSNEWL=&FFE7:OSWORD=&FFF1:oscli=&FFF7
   30DIM B% 2000
   40PT%=&70:PT1%=&72:PT2%=&74
   50shoot%=&76:topline%=&77::fillword%=&78:xb%=&79:yb%=&7A:pos0%=&7B:pos1%=&7C:pos2%=&7D:temp%=&7E:tempa%=&7F:num%=&80:exnum%=&81:penal%=&82
   60FOR PASS=0 TO 2 STEP 2
   70P%=B%+33
   80[OPT PASS:.lexis JSR fx
   90.newgr JSR filein
  100.top JSR newgame:JSR setup:JSR shuffle
  110.mainloop
  120 LDA fillword%:CMP #16:BEQ endgame:LDA penal%:CMP #51:BEQ endgame
  130.cont JSR check:JSR wait
  140JSR bullet:JMP mainloop
  150.endgame JSR toxy:LDA #32:JSR OSWRCH:JSR press:JSR choice:JMP top
  160.fx LDA #4:LDX #1:JSR OSBYTE:LDA #16:LDX #1:JSR OSBYTE:LDA #229:LDX #1:JSR OSBYTE:RTS
  170.setup LDA #7:STA topline%:LDA #0:STA fillword%:STA B%+32:STA penal%:INC penal%
  180LDA &296:STA pos1%:LDA &240:STA pos2%:RTS
  190.vdu1:EQUB &16:EQUB &07:EQUD &200A0017:EQUD &00000000:EQUB &0:EQUB &0
  200.filein LDY #0:.loop LDA vdu1,Y:JSR OSWRCH:INY:CPY #&0C:BNE loop
  210JSR headline
  220 LDY #0:.more7 LDA group,Y:JSR OSASCI:INY:CPY #&4D:BNE more7:JMP gpinp
  230.group EQUB &1F:EQUB 0:EQUB 3:EQUS "A) Consonant Pronunciation":EQUB &0D
  240EQUS "B) Vowel Pronunciation":EQUB &0D
  250EQUS "C) Grammar":EQUB &0D
  260EQUS "D) Vocabulary":EQUB &0D
  270.gpinp JSR prlett:JSR choice
  280.which TXA:SEC:SBC #&41:BMI gpinp:CMP #4:BPL gpinp:TAX
  290CPX #0:BNE vow:LDX #loadc MOD 256:LDY #loadc DIV 256:JSR oscli:RTS
  300.vow CPX #1:BNE gra:LDX #loadd MOD 256:LDY #loadd DIV 256:JSR oscli:RTS
  310.gra CPX #2:BNE voc:LDX #loadg MOD 256:LDY #loadg DIV 256:JSR oscli:RTS
  320.voc LDX #loadv MOD 256:LDY #loadv DIV 256:JSR oscli:RTS
  330.loadc EQUS "LOAD Consnnt 5000":EQUB &0D
  340.loadd EQUS "LOAD Vowels 5000":EQUB &0D
  350.loadg EQUS "LOAD Grammar 5000":EQUB &0D
  360.loadv EQUS "LOAD VOCAB 5000":EQUB &0D
  370 .newgame LDA #&0C:JSR OSWRCH:JSR headline:LDX #10:LDY #0:STY PT%+1:JSR big
  380LDA &296:AND #4:STA shoot%:CLC:ROR shoot%:ROR shoot%:INC shoot%
  390.get LDY #0:.more12 LDA &5000,Y
  400JSR OSWRCH:INY:CPY #29:BNE more12
  410LDA #&0D:JSR OSASCI:LDA#&1F:JSR OSWRCH:LDA#10:JSR OSWRCH:LDA#1:JSR OSWRCH:LDY #0:.more12b LDA &5000,Y:JSR OSWRCH:INY:CPY #29:BNE more12b
  420LDA &5000,Y:STA num%
  430LDX #0:STX PT%+1:LDY #3:JSR big
  440LDX #0:.more10 TXA:CLC:ADC #&41:JSR OSWRCH:LDA #&29:JSR OSWRCH:LDA #&20:JSR OSWRCH
  450LDA looka,X:STA PT%:LDA lookb,X:STA PT%+1
  460LDY #0:.more11 LDA (PT%),Y:JSR OSWRCH:INY:CPY #36:BNE more11
  470JSR OSNEWL
  480INX:CPX num%:BNE more10
  490LDY #0:.more9 LDA newgp,Y:JSR OSASCI:INY:CPY #&1A:BNE more9:JMP exinp
  500.newgp EQUS "Z) New group of exercises":EQUB &0D
  510.exinp JSR prlett:JSR choice
  520CPX #&5A:BNE gameno:PLA:PLA:JMP newgr
  530.gameno SEC:SBC #&41:BMI exinp:CMP num%:BPL exinp:TAX:STA exnum%
  540JSR headline
  550.title LDA #mess MOD 256:STA PT%:LDA #mess DIV 256:STA PT%+1:LDA #&82:STA temp%:LDA #&83:STA tempa%:LDX #0:LDY #5:JSR big:JMP ti
  560.mess EQUS "Shoot":EQUB &0
  570.ti LDA shoot%:CMP #1:BNE ti2
  580JSR tiset:JSR title1:JSR tiset:JSR titl1b:JSR not:JSR tiset:JSR title2:JSR tiset:JSR titl2b:JMP tout
  590.ti2 JSR tiset:JSR title2:JSR tiset:JSR titl2b:JSR not:JSR tiset:JSR title1:JSR tiset:JSR titl1b:JMP tout
  600.not LDA #mess2 MOD 256:STA PT%:LDA #mess2 DIV 256:STA PT%+1:LDA #&81:STA temp%:LDA #&83:STA tempa%:LDX #0:LDY #10:JSR big:RTS
  610.mess2 EQUS "Don't shoot":EQUB &0
  620.tiset LDA #&D:JSR OSASCI:LDA temp%:JSR OSWRCH:LDA #157:JSR OSWRCH:LDA tempa%:JSR OSWRCH:LDA #141:JSR OSWRCH:RTS
  630.title1 LDX exnum%:LDA lookb,X:STA PT%+1:LDA looka,X:CLC:ADC #&24:STA PT%:BCC titl1b:INC PT%+1:.titl1b LDY #0:.titl1p LDA (PT%),Y:JSR OSWRCH:INY:CPY #35:BNE titl1p:RTS 
  640.title2 LDX exnum%:LDA lookb,X:STA PT%+1:LDA looka,X:CLC:ADC #&48:STA PT%:BCC titl2b:INC PT%+1:.titl2b LDY #0:.titl2p LDA (PT%),Y:JSR OSWRCH:INY:CPY #35:BNE titl2p:RTS
  650.tout JSR press:JSR choice
  660JSR headline:JSR penalty:LDX exnum%
  670LDA lookb,X:STA PT%+1:LDA looka,X:CLC:ADC #&6C:STA PT%:BCC ad2:INC PT%+1
  680.ad2 LDA PT%+1:STA PT1%+1:LDA PT%:CLC:ADC #&20:STA PT1%:BCC ad3:INC PT1%+1
  690.ad3 LDA PT%+1:STA PT2%+1:LDA PT%:CLC:ADC #&C0:STA PT2%:BCC input:INC PT2%+1:JMP input
  700.looka EQUD &82B6EA1E:EQUD &B2E61A4E:EQUD &E2164A7E:EQUD &12467AAE:EQUD &4276AADE
  710.lookb EQUD &55535150:EQUD &5C5A5957:EQUD &6362605E:EQUD &6B696765:EQUD &72706E6C
  720.input
  730LDY #0:.more1 LDA (PT%),Y:STA B%,Y:INY:CPY #&20:BNE more1
  740LDY #0:.more2 LDA (PT1%),Y:STA &7CF0,Y:LDA (PT2%),Y:STA &7D90,Y:INY:CPY #&A0:BNE more2
  750LDA #18:STA xb%:LDA #24:STA yb%:RTS
  760.check LDX topline%:LDA #3:.more5 DEX:BMI ch:CLC:ADC #4:JMP more5:.ch TAY:LDX #4:.more6 LDA B%,Y:CMP shoot%:BNE nosh:RTS
  770.nosh DEY:DEX:BNE more6:JSR mix:JMP check
  780LDY #39:LDA #32:.more13 STA (PT%),Y:DEY:BPL more13:DEC topline%:JMP check
  790.bullet JSR toxy:LDA #32:JSR OSWRCH:LDA yb%:CMP #4:BNE fire:LDA #&18:STA yb%:JMP shwbul
  800.fire CMP #24:BEQ ready:DEC yb%:JMP left:.ready LDX #&B6:LDY #&FF:LDA #&81:JSR OSBYTE:CPX #&FF:BNE left:DEC yb%
  810.left LDA xb%:CMP #0:BEQ right:LDX #&BF:LDY #&FF:LDA #&81:JSR OSBYTE:CPX #&FF:BNE right:DEC xb%
  820.right LDA xb%:CMP #38:BEQ soff:LDX #&FE:LDY #&FF:LDA #&81:JSR OSBYTE:CPX #&FF:BNE soff:INC xb%
  830.soff LDX #&DF:LDY #&FF:LDA #&81:JSR OSBYTE:CPX #&FF:BNE son:LDX #1:LDY #0:LDA #210:JSR OSBYTE
  840.son LDX #&8E:LDY #&FF:LDA #&81:JSR OSBYTE:CPX #&FF:BNE hilo:LDX #0:LDY #0:LDA #210:JSR OSBYTE
  850.hilo LDA yb%:CMP #6:BMI shwbul:CMP #14:BPL shwbul:JSR toxy:LDA #135:JSR OSBYTE:CPX #&20:BEQ shwbul:JSR hit:LDA #24:STA yb%
  860.shwbul JSR toxy:LDA #94:JSR OSWRCH:RTS
  870.hit LDA xb%:STA temp%:LDA yb%:SEC:SBC #6:STA tempa%:JSR coord
  880LDY #0:LDA (PT%),Y:CMP shoot%:STA temp%:BEQ yes
  890LDX #badnoise MOD 256:LDY #badnoise DIV 256:LDA #7:JSR OSWORD:INC penal%:JSR dec:RTS
  900.badnoise EQUD &FFF10001:EQUD &00030014
  910.goodnoise EQUD &FFF10000:EQUD &0008001E 
  920.yes LDX #goodnoise MOD 256:LDY #goodnoise DIV 256:LDA #7:JSR OSWORD
  930LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:LDA pos0%:STA pos1%:TAY
  940JSR mult:LDA PT%:STA PT1%:LDA PT%+1:STA PT1%+1:LDA fillword%:STA pos2%
  950LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:LDY fillword%
  960JSR mult:LDA PT%:STA PT2%:LDA PT%+1:STA PT2%+1:JSR swap
  970LDY #0:LDA #32:.more14 STA (PT%),Y:INY:CPY #&0A:BNE more14:INC fillword%:JSR mix:RTS
  980.mix LDX #0:.mi1 LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:LDA &296:AND #&3E:STA pos1%:CLC:ROR pos1%:LDA pos1%:ADC fillword%:STA pos1%:CMP #31:BPL mi1:TAY:JSR mult:LDA PT%:STA PT1%:LDA PT%+1:STA PT1%+1
  990.mi2 LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:TXA:CLC:ADC #28:STA pos2%:TAY:JSR mult:LDA PT%:STA PT2%:LDA PT%+1:STA PT2%+1
 1000JSR swap:INX:CPX #4:BNE mi1:RTS
 1010.shuffle LDX #0:.another LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:LDA pos1%:ADC &296:AND #&3E:STA pos1%:CLC:ROR pos1%:LDA pos1%:TAY:JSR mult:LDA PT%:STA PT1%:LDA PT%+1:STA PT1%+1
 1020LDA #&F0:STA PT%:LDA #&7C:STA PT%+1:LDA pos2%:ADC &240:AND #&3E:STA pos2%:CLC:ROR pos2%:LDA pos2%:TAY:JSR mult:LDA PT%:STA PT2%:LDA PT%+1:STA PT2%+1:JSR swap:INX:CPX #&FF:BNE another:RTS
 1030.swap LDY pos1%:LDA B%,Y:STA temp%:LDY pos2%:LDA B%,Y:LDY pos1%:STA B%,Y:LDY pos2%:LDA temp%:STA B%,Y
 1040LDY #0:.more4 LDA (PT1%),Y:STA temp%:LDA (PT2%),Y:STA (PT1%),Y:LDA temp%:STA (PT2%),Y:INY:CPY #&0A:BNE more4:RTS
 1050.choice LDA #21:LDX#0:JSR OSBYTE:.ch1 LDX#0:LDY#0:LDA#&81:JSR OSBYTE:CPY #0:BNE ch1:TXA:AND #&5F:TAX:RTS
 1060.headline LDA #&0C:JSR OSWRCH:LDA #head MOD 256:STA PT%:LDA #head DIV 256:STA PT%+1:LDX #0:LDY #0:LDA #&84:STA temp%:LDA #&86:STA tempa%:JSR big:RTS
 1070.head EQUS "LEXIS":EQUB &0
 1080.press LDA #space MOD 256:STA PT%:LDA #space DIV 256:STA PT%+1:LDX #0:LDY #23:LDA #130:STA temp%:LDA #131:STA tempa%:JSR big:RTS
 1090.space EQUS "Press any key to continue":EQUB &0
 1100.prlett LDA #exlet MOD 256:STA PT%:LDA #exlet DIV 256:STA PT%+1:LDX #0:LDY #23:LDA #130:STA temp%:LDA #131:STA tempa%:JSR big:RTS
 1110.exlet EQUS "Press the LETTER of the exercise":EQUB &0
 1120.penalty LDA #pen MOD 256:STA PT%:LDA #pen DIV 256:STA PT%+1:LDX #0:LDY #2:LDA #129:STA temp%:LDA #131:STA tempa%:JSR big:RTS
 1130.pen EQUS "Penalties :0":EQUB 0
 1140.big LDA#&1F:JSR OSWRCH:TXA:JSR OSWRCH:TYA:JSR OSWRCH:LDA PT%+1:BEQ bigout:LDX #0:LDA temp%:BNE colour:LDX #1:JMP line
 1150.colour LDA temp%:JSR OSWRCH:LDA #157:JSR OSWRCH:LDA tempa%:JSR OSWRCH:LDA #141:JSR OSWRCH
 1160.line LDY#0:.ancora LDA (PT%),Y:CMP #&0:BEQ bigo:JSR OSASCI:INY:JMP ancora
 1170.bigo INX:CPX #2:BEQ bigout:LDA #&0D:JSR OSASCI:JMP colour
 1180.bigout RTS
 1190.toxy LDA#&1F:JSR OSWRCH:LDA xb%:JSR OSWRCH:LDA yb%:JSR OSWRCH:RTS
 1200.wait LDX #&18:.slow LDY #&FF:.sl NOP:DEY:BNE sl:DEX:BNE slow:RTS
 1210.dec LDA #&1F:JSR OSWRCH:LDA #15:JSR OSWRCH:LDA #2:JSR OSWRCH:LDA penal%:STA temp%:SBC #10:BCC unit
 1220LDY #48:.take SBC #10:STA temp%:INY:BCS take
 1230TYA:STA tempa%:JSR OSWRCH:LDA #&A:JSR OSWRCH:LDA #8:JSR OSWRCH:LDA tempa%:JSR OSWRCH:LDA #&B:JSR OSWRCH
 1240LDA temp%:.unit ADC #58:STA temp%:JSR OSWRCH:LDA #&A:JSR OSWRCH:LDA #&8:JSR OSWRCH:LDA temp%:JSR OSWRCH:RTS
 1250.mult BNE more3:RTS:.more3 CLC:LDA PT%:ADC #&0A:STA PT%:BCC nocarry:INC PT%+1:.nocarry:DEY:JMP mult
 1260.coord LDA temp%:CMP #10:BPL no1:LDA #0:STA pos0%:JMP no10
 1270.no1 CMP #20:BPL no7:LDA #1:STA pos0%:JMP no10
 1280.no7 CMP #30:BPL no8:LDA #2:STA pos0%:JMP no10
 1290.no8 LDA #3:STA pos0%
 1300.no10 CLC
 1310ROL tempa%:CLC:ROL tempa%
 1320LDA tempa%:CLC:ADC pos0%:STA pos0%
 1330LDA #B% DIV 256:STA PT%+1
 1340LDA #B% MOD 256:CLC
 1350ADC pos0%:STA PT%
 1360BCC no11:INC PT%+1:.no11 RTS
 1370]
 1380NEXT PASS
 1390CALL lexis
>*FX3,0
