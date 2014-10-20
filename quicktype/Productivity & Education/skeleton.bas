1 CLS:KEY OFF:AQ$="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 !@#$%^&*()_-+={}[]:;'?/>.<,|\":IN=0:ON ERROR GOTO 49000:CURRENT=-1
100 GOSUB 50000:GOSUB 46000:STAT1$="A"
110 IF MAXSIZE=0 THEN GOTO 100 ELSE CURRENT=-1
500 REM ************************************************************
501 REM *** Main Menu Function         Process: Display choices, get choice
502 REM ***                                     then call appropriate routine
503 REM ************************************************************
505 IF CURRENT=-1 THEN C$=" NONE" ELSE C$=STR$(CURRENT)
510 CLS:LOCATE 1,1:A$="Current Record ="+C$:A1$="Number of entered records ="+STR$(GOOD):A2$="Maximum number of records ="+STR$(MAXSIZE):A3$="Current Data Disk Volume: "+V$
520 PRINT TAB(1);A$;TAB(80-LEN(A1$));A1$:LOCATE 2,1:PRINT TAB(40-(LEN(A2$)/2));A2$:LOCATE 3,1:PRINT TAB(40-LEN(A3$)/2);A3$
525 LOCATE 4,1:PRINT STRING$(79,"_");:LOCATE 19,1:PRINT STRING$(79,"_");
530 LOCATE 6,1:A$="---> Main Menu Choices <---":PRINT TAB(40-(LEN(A$)/2));A$
540 LOCATE 8,20:PRINT "G)et A Record.":LOCATE 9,20:PRINT "S)earch For And List Records."
550 LOCATE 10,20:PRINT"A)dd A Record.":LOCATE 11,20:PRINT"D)elete Current Record.":LOCATE 12,20:PRINT"U)pdate Current Record.":LOCATE 13,20:PRINT"X)-tend Work To New Data Diskette."
560 LOCATE 14,20:PRINT"I)nitialize New Data Diskette.":LOCATE 15,20:PRINT"Q)uit And Return To BASIC."
580 A$="Enter your choice (G,S,A,D,U,X,I, or Q):  ":LOCATE 18,1:PRINT TAB(40-(LEN(A$)/2));A$:ROW=18:COLUMN=((40-LEN(A$)/2)+LEN(A$)-1):A1%=1:AX$="GgSsAaDdUuXxIiQq":GOSUB 40130
590 IF AN$="" GOTO 580
600 IF AN$="Q" OR AN$="q" THEN CLOSE:GOSUB 50000:CLS:PRINT"Program Finished...":END
610 IF AN$="G" OR AN$="g" THEN GOSUB 680:GOSUB 39000:GOTO 500
620 IF AN$="S" OR AN$="s" THEN GOSUB 680:GOSUB 45000:GOTO 500
630 IF AN$="A" OR AN$="a" THEN GOSUB 41000:GOTO 500
640 IF AN$="D" OR AN$="d" THEN GOSUB 680:PAGE=0:GOSUB 2000:GOSUB 7000:GOSUB 42000:GOTO 500
650 IF AN$="U" OR AN$="u" THEN GOSUB 680:GOSUB 43000:GOTO 500
660 IF AN$="X" OR AN$="x" THEN GOSUB 680:GOSUB 46000:GOTO 500
670 IF AN$="I" OR AN$="i" THEN GOSUB 680:GOSUB 47000:GOTO 500
680 CLS:LOCATE 24,1:PRINT STRING$(79,"=");:RETURN
2000 REM ************************************************************
2001 REM *** Display Screen Info Routine    In: PAGE = page #
2002 REM ***                                        or
2003 REM ***                                    FL = field #
2004 REM ***                               Out: Screen info on that page is
2005 REM ***                                    displayed, then exit to
2006 REM ***                                    caller.
2007 REM ************************************************************
7000 REM ************************************************************
7001 REM *** Display Record Fields Routine  In: Page = page #
7002 REM ***                               Out: Working strings displayed,
7003 REM ***                                    then exit to caller
7004 REM ************************************************************
12000 REM ************************************************************
12001 REM *** Block Record Routine     In: Working strings filled
12002 REM ***                         Out: Record strings filled then exit
12003 REM ***                              to caller.
12004 REM ************************************************************
17000 REM ************************************************************
17001 REM *** Unblock Record Routine   In: Record strings filled
17002 REM ***                         Out: Working strings filled then
17003 REM ***                              exit to caller.
17004 REM ************************************************************
22000 REM ************************************************************
22001 REM *** Input A Field Routine    In: FL = field number to input
22002 REM ***                         Out: Working string filled after
22003 REM ***                              passing edit check, then exit
22004 REM ***                              to caller.
22005 REM ************************************************************
32000 REM ************************************************************
32001 REM *** Get a Record Routine      In: RECNUM = record number to get
32002 REM ***                          Out: Record strings filled (need to be
32003 REM ***                               unblocked.)
32004 REM ************************************************************
32010 GET 1,RECNUM:RETURN
33000 REM ************************************************************
33001 REM *** Hash Keyfield Routine    In: KY$ = Key field
33002 REM ***                         Out: RECNUM = Hashed record specifier
33003 REM ************************************************************
33010 X#=0:FOR ZZ=1 TO LEN(KY$):X#=X#+ZZ*ASC(MID$(KY$,ZZ,1)):NEXT ZZ
33020 X#=X#*X#*X#*X#:X$=STR$(X#):RECNUM=VAL(MID$(X$,5,4)):X#=0
33030 RECNUM=INT(MAXSIZE*RECNUM/9999):IF RECNUM<=0 THEN RECNUM=1
33040 RETURN
34000 REM ************************************************************
34001 REM Delete a record routine    IN: RECNUM = record number to delete
34002 REM                           OUT: Record is deleted
34003 REM                                CURRENT = -1
34004 REM ************************************************************
34010 GOOD=GOOD-1:STAT1$="D":GOSUB 12000:GOSUB 35000:CURRENT=-1:STAT1$="A":LSET STAT$=STAT1$:OPEN "O",#2,NA$+".def":GOOD=GOOD-1:PRINT#2,MAXSIZE,GOOD:CLOSE #2:RETURN
35000 REM ************************************************************
35001 REM *** Put a Record Routine     In: RECNUM = record number to put
35002 REM ***                              Record strings must be filled
35003 REM ***                         Out: CURRENT = Record number
35004 REM ***                              Record is writted to disk file
35005 REM ************************************************************
35010 PUT 1,RECNUM:CURRENT=RECNUM:OPEN "O",#2,NA$+".DEF":GOOD=GOOD+1:PRINT#2,MAXSIZE,GOOD:CLOSE #2:RETURN
36000 REM ************************************************************
36001 REM Error Response Routine   In:ERROR = 1,2,3, or 4
36002 REM                             ER$= error string if ER = 4
36003 REM                         OUT: Error message is printed, waits
36004 REM                              For 'c' or 'C' keypress, then
36005 REM                              exits to caller
36006 REM ************************************************************
36010 LOCATE 25,1:PRINT STRING$(79,32);:A$=" ERROR! ":P=40-LEN(A$)/2
36020 BEEP:ON ER GOTO 36030,36040,36050,36060
36030 B$="Record Not Found... Press <C> to Continue":GOTO 36070
36040 B$="Data Diskette Is Full... Press <C> to Continue":GOTO 36070
36050 B$="No Current Record In Memory... Press <C> to Continue":GOTO 36070
36060 B$="Entry Must Not Be "+ER$+"... Press <C> to Continue"
36070 LOCATE 25,1:PRINT STRING$(79,32);:LOCATE 25,40-LEN(B$)/2:PRINT B$;
36080 LOCATE 24,P:PRINT A$;:CT=1
36090 Z$=INKEY$:IF Z$="C" OR Z$="c" GOTO 36150
36100 CT=CT+1:IF CT=4 THEN CT=1
36110 IF CT=1 THEN LOCATE 24,1:PRINT STRING$(35,"/");:LOCATE 24,44:PRINT STRING$(36,"/");:GOTO 36090
36120 IF CT=2 THEN LOCATE 24,1:PRINT STRING$(35,"-");:LOCATE 24,44:PRINT STRING$(36,"-");:GOTO 36090
36130 IF CT=3 THEN LOCATE 24,1:PRINT STRING$(35,"\");:LOCATE 24,44:PRINT STRING$(36,"\");:GOTO 36090
36140 LOCATE 24,1:PRINT STRING$(79,"=");:LOCATE 25,1:PRINT STRING$(79,32);:RETURN
36150 LOCATE 24,1:PRINT STRING$(79,"=");:LOCATE 25,1:PRINT STRING$(79,32);:RETURN
37000 REM ************************************************************
37001 REM *** Submenu #1 Function    Process: Display choices M)enu, U)pdate,
37002 REM ***                                 D)elete, A)dd, and S)witch
37003 REM ***                                 page.  Get choice and
37004 REM ***                                 Branch to appropriate function
37005 REM ************************************************************
37010 LOCATE 25,1:PRINT STRING$(79,32);:A$="Enter choice: M)enu, U)pdate, D)elete, A)dd, S)witch page: ":LOCATE 25,1:PRINT A$;
37020 ROW=25:COLUMN=LEN(A$)+2:AX$="MmUuDdAaSs":A1%=1:GOSUB 40130:IF AN$="" GOTO 37010
37030 IF AN$="M" OR AN$="m" THEN RETURN
37040 IF AN$="U" OR AN$="u" GOTO 43000
37050 IF AN$="D" OR AN$="d" GOTO 42000
37070 IF AN$="A" OR AN$="a" GOTO 41000
37080 PAGE=PAGE+1:IF PAGE>ND THEN PAGE=1
37090 CLS:FL=0:GOSUB 2000:GOSUB 7000:GOTO 37000
38000 REM ************************************************************
38001 REM *** Submenu #2 Function      Process: Ask for R)estore, S)witch
38002 REM ***                                   Page, or M)enu and
38003 REM ***                                   Branch to appropriate function
38004 REM ************************************************************
38010 LOCATE 25,1:PRINT STRING$(79,32);:A$="Please choose: R)estore, S)witch page, or M)enu ":LOCATE 25,1:PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:A1%=1:AX$="RrSsMm":GOSUB 40130
38020 TEST$=AN$:IF AN$="" GOTO 38010
38030 IF TEST$="M" OR TEST$="m" THEN CURRENT=-1:RETURN
38040 IF TEST$="P" OR TEST$="p" THEN GOSUB 36000:GOTO 38010
38050 IF TEST$<>"s" AND TEST$<>"S" GOTO 38100
38060 PAGE=PAGE+1:IF PAGE>ND THEN PAGE=1
38070 CLS:FL=0:GOSUB 2000:GOSUB 7000:GOTO 38010
38100 STAT1$="A":GOSUB 12000:GOSUB 35000:CURRENT=RECNUM:GOTO 37000
39000 REM ************************************************************
39001 REM *** Get a Record         Process: Accepts key field, searches
39002 REM ***                               for record, if found, displays
39003 REM ***                               it and verifies that its the
39004 REM ***                               right one.  If not, continue
39005 REM ***                               search until error.  Otherwise,
39006 REM ***                               display the record and branch
39007 REM ***                               to Submenu #1 Function
39008 REM ************************************************************
39010 PAGE=1:FL=0:GOSUB 2000:FL=1:GOSUB 22000:KY$=F$(1):GOSUB 33000
39020 CURRENT=RECNUM
39030 GOSUB 32000:IF STAT$="E" THEN ER=1:CURRENT=-1:GOTO 36000
39040 IF STAT$="D" GOTO 39200
39050 GOSUB 17000:IF KY$<>LEFT$(F$(1),LEN(KY$)) GOTO 39200
39060 GOSUB 7000:LOCATE 25,1:PRINT STRING$(79,32);:A$="Is this it (Y/N)? ":LOCATE 25,1:PRINT A$;
39070 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="" GOTO 39060
39080 IF AN$="y" OR AN$="Y" THEN CURRENT=RECNUM:GOTO 37000
39200 RECNUM=RECNUM+1:IF RECNUM>MAXSIZE THEN RECNUM=1
39210 IF RECNUM=CURRENT THEN ER=1:CURRENT=-1:GOTO 36000
39220 GOTO 39030
40127 REM ************************************************************
40128 REM *** Alphanumeric Input routine   IN: ROW,COLUMN, A1%,ax$  OUT: AN$
40129 REM ************************************************************
40130 AN$="":A%=0:LOCATE ROW,COLUMN,0,1,20:PRINT STRING$(A1%,CHR$(22));
40131 IF A%=A1% THEN 40134 ELSE LOCATE ROW,COLUMN+A%,0,1,20:PRINT CHR$(22);
40132 A$=INKEY$:IF A$="" THEN 40132 ELSE IF INSTR(AX$,A$) THEN AN$=AN$+A$:LOCATE ROW,COLUMN+A%,0,1,20:PRINT A$;:A%=A%+1:GOTO 40131
40133 ON INSTR(CHR$(8)+CHR$(13),A$) GOTO 40135,40138:GOTO 40131
40134 A$=INKEY$:IF A$="" THEN 40134 ELSE 40133
40135 IF A%<A1% THEN LOCATE ROW,COLUMN+A%,0,1,20:PRINT CHR$(22);
40136 A%=A%-1:IF A%<0 THEN A%=0:GOTO 40131:ELSE AN$=LEFT$(AN$,LEN(AN$)-1):GOTO 40131
40138 LOCATE ROW,COLUMN+A%,0,1,20:PRINT STRING$(A1%-A%," ");
40139 RETURN
40147 REM ************************************************************
40148 REM ***  FORMATTED NUMERIC INPUT  IN:ROW,COLUMN,AF$   OUT: AN$
40149 REM ************************************************************
40150 GOSUB 40200:PV=LEN(AF$)-1:R1=ROW:C1=COLUMN:AN$="":A%=0:LOCATE ROW,COLUMN:PRINT AF$;:A1%=LEN(AF$)
40151 IF A%=>LEN(AF$) THEN 40156 ELSE A%=INSTR(A%+1,AF$,CHR$(22)):LOCATE ROW,COLUMN+A%-1
40152 A$=INKEY$:IF A$=""THEN 40152 ELSE IF INSTR("1234567890",A$) THEN PRINT A$;:GOTO 40151
40153 ON INSTR(CHR$(8)+CHR$(13),A$) GOTO 40150, 40159
40154 GOTO 40151
40156 A$=INKEY$:IF A$="" THEN 40156 ELSE 40153
40159 AN$="":FOR Z=C1 TO C1+PV:AN$=AN$+CHR$(SCREEN(R1,Z)):NEXT Z:RETURN
40200 FOR Z=1 TO LEN(AF$):IF MID$(AF$,Z,1)="/" THEN MID$(AF$,Z,1)=CHR$(22)
40210 NEXT Z:RETURN
41000 REM ************************************************************
41001 REM *** Add A Record Function       Process: Fill input strings
41002 REM ***                                      write it disk, then
41003 REM ***                                      exit to caller on
41004 REM ***                                      error, or to submenu #1
41005 REM ************************************************************
41020 STAT1$="A":LSET STAT$=STAT1$:PAGE=0:FOR A=1 TO NF:FL=A:GOSUB 2000:GOSUB 22000:NEXT A
41030 LOCATE 25,1:PRINT STRING$(79,32);:A$="Press <Y> to add record or <N> to abort":LOCATE 25,1:PRINT A$;
41040 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="N" OR AN$="n"THEN CURRENT=-1:RETURN
41045 IF AN$="" GOTO 41030
41050 KY$=F$(1):GOSUB 33000
41060 GOSUB 32000:IF STAT$="A" GOTO 41100
41070 GOSUB 12000:GOSUB 35000:CURRENT=RECNUM:GOTO 37000
41100 RECNUM=RECNUM+1:IF RECNUM>MAXSIZE THEN RECNUM=1
41110 IF RECNUM=CURRENT THEN ER=2:GOTO 36000
41120 GOTO 41060
42000 REM ************************************************************
42001 REM *** Delete Current Record Function   Process: Verify delete
42002 REM ***                                           then erase it from
42003 REM ***                                           from view by marking
42004 REM ***                                           Stat$ as "D"
42005 REM ************************************************************
42007 IF CURRENT=-1 THEN ER=3:GOTO 36000
42010 LOCATE 25,1:PRINT STRING$(79,32);:A$="Press <Y> to delete this record or <N> to abort.":LOCATE 25,1:PRINT A$;
42020 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="N" OR AN$="n" THEN LOCATE 25,1:PRINT STRING$(79,32);:RETURN
42025 IF AN$="" GOTO 42010
42040 RECNUM=CURRENT:GOTO 34000
43000 REM ************************************************************
43001 REM *** Update Current Record Function   Process: Allow modifications
43002 REM ***                                           to specified fields,
43003 REM ***                                           make changes to record,
43004 REM ***                                           then exit to caller.
43005 REM ************************************************************
43010 STAT1$="A":LSET STAT$=STAT1$:KY=0:IF CURRENT=-1 THEN ER=3:GOTO 36000
43020 LOCATE 25,1:PRINT STRING$(79,32);:A$="Enter field number to modify "
43030 LOCATE 25,1:PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:AX$="0123456789":A1%=LEN(STR$(NF))-1:GOSUB 40130:FL=VAL(AN$):IF FL=0 THEN LOCATE 25,1:PRINT STRING$(79,32);:RETURN
43035 IF AN$="" GOTO 43020
43040 IF FL>NF GOTO 43020
43050 PAGE=0:GOSUB 2000:GOSUB 7000:GOSUB 22000:IF FL=1 THEN KY=1
43060 LOCATE 25,1:PRINT STRING$(79,32);:A$="Any more changes (Y/N)? ":LOCATE 25,1:PRINT A$;
43070 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="Y" OR AN$="y" GOTO 43020
43075 IF AN$="" GOTO 43060
43080 IF KY=1 GOTO 43100 ELSE RECNUM=CURRENT:GOOD=GOOD-1:GOSUB 12000:GOSUB 35000:GOTO 37000
43100 RECNUM=CURRENT:GOSUB 34000:KY$=F$(1):GOSUB 33000:CURRENT=RECNUM
43110 GOTO 41060
45000 REM ************************************************************
45001 REM *** Search and List Function     Process: Look for records matching
45002 REM ***                                       any specified parameters
45003 REM ***                                       and display them
45004 REM ************************************************************
45010 LOCATE 25,1:PRINT STRING$(79,32);:LOCATE 25,1:A$="Enter record # to start search or <ENTER> to start at current record ":PRINT A$;
45020 ROW=25:COLUMN=LEN(A$)+2:A1%=LEN(STR$(MAXSIZE)):AX$="0123456789":GOSUB 40130:RECNUM=VAL(AN$)
45030 IF RECNUM<>0 GOTO 45050 ELSE IF CURRENT=-1 THEN RECNUM=1:GOTO 45060
45040 RECNUM=CURRENT:GOTO 45060
45050 IF RECNUM>MAXSIZE THEN RECNUM=1
45060 LOCATE 25,1:PRINT STRING$(79,32);:LOCATE 25,1:A$="Do you wish to display records that have been deleted (Y/N)? ":PRINT A$;
45070 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="" GOTO 45060
45080 DEL$=AN$
45090 LOCATE 25,1:PRINT STRING$(79,32);:LOCATE 25,1:A$="Do you wish to select by a field's contents (Y/N)? ":PRINT A$;
45100 ROW=25:COLUMN=LEN(A$)+2:AX$="YyNn":A1%=1:GOSUB 40130:IF AN$="" GOTO 45090
45110 TEST$=AN$:IF TEST$="N" OR TEST$="n" GOTO 45200 ELSE LOCATE 25,1:PRINT STRING$(79,32);
45120 LOCATE 25,1:A$="Enter field number to test ":PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:AX$="0123456789":A1%=LEN(STR$(NF)):GOSUB 40130:IF AN$="" GOTO 45120 ELSE FL=VAL(AN$):PAGE=0:GOSUB 2000
45130 LOCATE 25,1:PRINT STRING$(79,32);:A$="Enter test string":LOCATE 25,1:PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:AX$=AQ$:A1%=35:GOSUB 40130:IF AN$="" GOTO 45130
45140 COMPARE$=RIGHT$(AN$,LEN(AN$)-1):TYPE$=LEFT$(AN$,1):IF TYPE$<>"<" AND TYPE$<>">" AND TYPE$<>"=" GOTO 45130
45200 GOSUB 32000:IF STAT$="E" GOTO 45300
45210 IF STAT$<>"D" GOTO 45220
45215 IF DEL$="N" OR DEL$="n" GOTO 45300
45220 IF TEST$="Y" OR TEST$="y" GOTO 45400
45230 GOSUB 17000:PAGE=1:FL=0:GOSUB 2000:GOSUB 7000:LOCATE 25,1:PRINT STRING$(79,32);:IF STAT$="A" THEN S$="Active" ELSE S$="Deleted"
45240 A$="Status: "+S$+": Continue search (Y/N)":LOCATE 25,1:PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:A1%=1:AX$="YyNn":GOSUB 40130:IF AN$="Y" OR AN$="y" GOTO 45300
45250 IF AN$="" GOTO 45240 ELSE IF STAT$="D" GOTO 38000
45260 CURRENT=RECNUM:GOTO 37000
45300 RECNUM=RECNUM+1:IF RECNUM>MAXSIZE THEN CURRENT=-1:RETURN
45310 GOTO 45200
45400 GOSUB 17000:IF TYPE$<>"<" GOTO 45500
45410 IF LEFT$(F$(FL),LEN(COMPARE$))=COMPARE$ GOTO 45230
45420 GOTO 45300
45500 IF TYPE$<>">" GOTO 45600
45510 FOR A=1 TO LEN(F$(FL))-LEN(COMPARE$)
45520 IF MID$(F$(FL),A,LEN(COMPARE$))=COMPARE$ GOTO 45230
45530 NEXT A:GOTO 45300
45600 IF F$(FL)=COMPARE$ GOTO 45230
45610 GOTO 45300
46000 REM ************************************************************
46001 REM *** X-tend Work To New Disk Function  Process: Prompt for new
46002 REM ***                                            data disk mount, then
46003 REM ***                                            read in MAXSIZE from
46004 REM ***                                            .DEF file and return
46005 REM ***                                            to caller
46006 REM ************************************************************
46010 CURRENT=-1:LOCATE 25,1:PRINT STRING$(79,32);:A$="Mount data disk in drive "+LEFT$(NA$,1)+", then press <C> to continue":LOCATE 25,1:PRINT A$;
46020 ROW=25:COLUMN=LEN(A$)+2:AX$="Cc":A1%=1:GOSUB 40130:IF AN$="" GOTO 46010
46030 IN=2:OPEN "I",#2,NA$+".DEF":INPUT#2,MAXSIZE,GOOD:CLOSE:OPEN "i",1,NA$+".vol":INPUT#1,V$:CLOSE:OPEN "r",1,NA$+".DAT",SIZE:IN=0:RETURN
46100 IN=0:LOCATE 25,1:PRINT STRING$(79,32);:GOSUB 47000:GOTO 46000
47000 REM ************************************************************
47001 REM *** Initialize New Data Disk Function  Process: Write records to data
47002 REM ***                                             disk until error
47003 REM ***                                             occurs.  Error
47004 REM ***                                             routine will then
47005 REM ***                                             branch back to line
47006 REM ***                                             47500 where ".DEF"
47007 REM ***                                             file is written.
47008 REM ************************************************************
47010 CLOSE:CURRENT=-1:IN=1:LOCATE 25,1:PRINT STRING$(79,32);:A$="S)pecify number of records, or U)se all available disk space? ":LOCATE 25,1:PRINT A$;
47020 ROW=25:COLUMN=LEN(A$)+2:AX$="SsUu":A1%=1:GOSUB 40130:IF AN$="" GOTO 47020
47030 IF AN$="U" OR AN$="u" GOTO 47100 ELSE LOCATE 25,1:PRINT STRING$(79,32);:A$="How many data records?":LOCATE 25,1:PRINT A$;
47040 ROW=25:COLUMN=LEN(A$)+2:AX$="0123456789":A1%=6:GOSUB 40130:NU=VAL(AN$):IF AN$="" OR NU=0 GOTO 47030
47050 GOTO 47110
47060 LOCATE 25,1:PRINT STRING$(79,32);:LOCATE 25,1:A$="Enter volume name:":PRINT A$;:ROW=25:COLUMN=LEN(A$)+2:AX$=AQ$:A1%=25:GOSUB 40130:V$=AN$:IF AN$="" GOTO 47060
47070 OPEN "o",1,NA$+".VOL":PRINT#1,V$:CLOSE:RETURN
47100 NU=-1
47110 GOSUB 47060:OPEN "o",2,NA$+".DEF":PRINT#2,100000!,100000!:CLOSE
47120 OPEN "R",#1,NA$+".DAT",SIZE
47125 STAT1$="E":FOR Z=1 TO NF:F$(Z)=STRING$(80,32):NEXT Z:GOSUB 12000
47140 CT=1
47150 LOCATE 25,1:PRINT STRING$(79,32);
47160 A$="Stand by... Initializing record #":LOCATE 25,1:PRINT A$;
47200 LOCATE 25,LEN(A$)+1:PRINT CT;:PUT 1,CT
47210 CT=CT+1:IF NU=-1 GOTO 47200 ELSE NU=NU-1
47220 IF NU=0 GOTO 47500 ELSE GOTO 47200
47500 CLOSE:CT=CT-1:OPEN "O",#2,NA$+".DEF":PRINT#2,CT,0:CLOSE #2
47510 IN=0:LOCATE 25,1:PRINT STRING$(79,32);:RETURN
49000 REM ************************************************************
49001 REM *** BASIC Error Handler         Process: This is really only set
49002 REM ***                                      up to handle the DISK
49003 REM ***                                      SPACE full error when
49004 REM ***                                      initializing a new data
49005 REM ***                                      disk indicated by variable
49006 REM ***                                      IN = 1.  Otherwise ERROR
49007 REM ***                                      code is reported, files are
49008 REM ***                                      closed, and program ends.
49009 REM ************************************************************
49010 IF IN=0 GOTO 49100
49020 IF IN=1 AND ERR=61 THEN RESUME 47500
49030 IF IN=2 AND ERR=53 THEN RESUME 46100
49100 CLS:RESET:PRINT "Internal ERROR #";ERR;" in line #";ERL:PRINT"Consult BASIC manual appendix A for explanation.":END
50000 REM ************************************************************
50001 REM *** Program Title Display Function     Process: Used to display
50002 REM ***                                             program title and
50003 REM ***   Display idea credit to:                   author at beginning
50004 REM ***      John Vandergrift                       and end of program
50005 REM ***                                             execution.
50006 REM ************************************************************
50010 BEEP:CLS:A$=TI$:A1$="B":A2$="Y":A3$=AU$:C=10
50020 GOSUB 50060
50030 A$=STRING$(LEN(A$)," "):A1$=" ":A2$=" ":A3$=STRING$(LEN(A3$)," "):C=9
50040 GOSUB 50060
50050 FOR Z=1 TO 2000:NEXT Z:RETURN
50060 FOR I=1 TO C
50070 LOCATE I,40-LEN(A$)/2:PRINT A$;
50080 LOCATE 12,4*I:PRINT A1$;
50090 LOCATE 12,81-(4*I):PRINT A2$;
50100 LOCATE 24-I,41-(LEN(A3$)/2):PRINT A3$;
50110 NEXT I
50120 RETURN
60000 REM *** Do not remove lines 60000 through 60009!
60001 REM *** This program SKELETON.BAS is to be used with the Ultra-Mind
60002 REM *** intelligent database program generator.  It is copyright, (C),
60003 REM *** 1983, by The FreeSoft Company, P.O. Box 27608, St. Louis, MO
60004 REM *** 63146.  For copies of this and the other Ultra-Utility programs,
60005 REM *** send 2 double sided or 4 single sided diskettes and a postage
60006 REM *** paid self addressed return mailer to the address above.  Specify
60007 REM *** that you want LIBRARIES #1 and #2.  The Ultra-Utilities include
60008 REM *** Ultra-Zap, Ultra-Format, Ultra-File, Ultra-Optimize, and
60009 REM *** Ultra-Mind.  Lines 60000 through 60009 all be removed from all
60010 REM *** programs generated by Ultra-Mind.
60009 REM *** Ul