>LIST
   10REM Prog from Acorn User Apr 1987
   20REM   doesn't work
   30REM supposed to test sideways ram
   60osbyte=&FFF4
   70osnewl=&FFE7
   80oswrch=&FFEE
   90osrdrom=&FFB9
  100latch=&FE30
  110write=&FF30
  130temp=&AB
  140old_socket=&AA
  150socket=&AB
  160empty_flag=&AC
  170active=&F4
  180ptr=&F6
  200start=&900
  220FOR PASS=0TO2STEP2
  230P%=start
  240[OPT PASS
  260.roms
  270LDA active
  280STA old_socket
  290LDY #15
  300.main_loop
  310STY socket
  320STA write,Y
  330STA empty_flag
  340TYA
  350JSR hex_nibble
  360JSR type
  370JSR test
  380BIT empty_flag
  390BMI no_title
  400JSR title
  410.no_title
  420JSR osnewl
  430LDY socket
  440DEY
  450BPL main_loop
  460RTS
  480.type
  490LDA #&AA
  500LDX #0
  510LDY #&FF
  520JSR osbyte
  530STX ptr
  540STY ptr+1
  550LDY socket
  560LDA (ptr),Y
  570ASL A
  580BEQ empty
  590BMI language
  600BCS utility
  610.empty
  620SEC
  630ROR empty_flag
  640JSR message
  650OPT FNEQUS ("  empty    ")
  660BRK
  670RTS
  680.language
  690JSR message
  700OPT FNEQUS (" language  ")
  710BRK
  720RTS
  730.utility
  740JSR message
  750OPT FNEQUS (" utility   ")
  760BRK
  770RTS
  790.test
  800LDA #&80
  810STA ptr+1
  820LDY #0
  830STY ptr
  840LDA socket
  850STA active
  860STA latch
  870.test_loop
  880LDA (ptr),Y
  890EOR #&FF
  900STA (ptr),Y
  910NOP
  920NOP
  930CMP (ptr),Y
  940BNE error1
  950EOR #&FF
  960STA (ptr),Y
  970CMP (ptr),Y
  980BNE error2
  990INY
 1000BNE test_loop
 1010INC ptr+1
 1020BIT ptr+1
 1030BVC test_loop
 1040 BVS end_test
 1050.error1
 1060EOR #&FF
 1070.error2
 1080STA (ptr),Y
 1090CLC
 1100.end_test
 1110LDA old_socket
 1120STA active
 1130STA latch
 1140BCC not_good
 1150JSR message
 1160OPT FNEQUS ("RAM        ")
 1170BRK
 1180RTS
 1190.not_good
 1200LDA #&80
 1210CMP ptr+1
 1220BNE bad_ram
 1230CPY #0
 1240BNE bad_ram
 1250JSR message
 1260OPT FNEQUS ("           ")
 1270BRK
 1280RTS
 1290.bad_ram
 1300STY ptr
 1310JSR message
 1320OPT FNEQUS ("BAD RAM AT ")
 1330BRK
 1340LDA ptr+1
 1350JSR hex_byte
 1360LDA ptr
 1370JSR hex_byte
 1380.space
 1390LDA #ASC" "
 1400JMP oswrch
 1420.title
 1430LDA #7
 1440STA ptr
 1450LDA #&80
 1460STA ptr+1
 1470LDY socket
 1480JSR osrdrom
 1490STA temp
 1500INC ptr
 1510JSR rom_print
 1520LDY ptr
 1530CPY temp
 1540BEQ end_title
 1550.rom_print
 1560INC ptr
 1570LDY socket
 1580JSR osrdrom
 1590JSR oswrch
 1600TAY
 1610 BNE rom_print
 1620.end_title
 1630JMP space
 1650.message
 1660PLA
 1670STA temp
 1680PLA
 1690STA temp+1
 1700LDY #0
 1710TYA
 1720.messg_loop
 1730INC temp
 1740BNE no_carry
 1750INC temp+1
 1760.no_carry
 1770JSR oswrch
 1780LDA (temp),Y
 1790BNE messg_loop
 1800LDA temp+1
 1810PHA
 1820LDA temp
 1830PHA
 1840RTS
 1860.hex_byte
 1870PHA
 1880LSR A
 1890LSR A
 1900LSR A
 1910LSR A
 1920JSR hex_nibble
 1930PLA
 1940.hex_nibble
 1950AND #&0F
 1960SED
 1970CLC
 1980ADC #&90
 1990ADC #&40
 2000CLD
 2010JMP oswrch
 2030]
 2040NEXT PASS
 2060REPEATUNTILGET=32
 2065CALL&900
 2070VDU7
 2080END
 2250DEFFNEQUS(STRING$)
 2260$P%=STRING$
 2270P%=P%+LEN STRING$
 2280=PASS
>*FX3,0
