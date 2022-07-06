10 DEF FN RANDOM(X) = (INT(RND(1) * X) + 1)
20 HGR2
30 LET C = 0 : BG = C
40 LET X = FN RANDOM(280 + 20) - 40
50 LET Y = FN RANDOM(192 + 20) - 40
60 LET W = FN RANDOM(50) + 10
70 LET H = FN RANDOM(50) + 10
80 GOSUB 1000
90 LET CNT = CNT + 1
100 IF CNT = 200 THEN CALL -3082 : CNT = 0 : BG = C
110 GOTO 40
120 END

1000 REM set color and draw a rectangle outline
1010 LET C = C + 1
1020 IF C > 7 THEN C = 0
1030 IF C = BG THEN C = C + 1 : REM same as background? skip
1040 IF C > 7 THEN C = 0
1050 IF C=4 THEN C = 5 : REM we want to avoid dark gray
1060 HCOLOR=C
1070 GOSUB 2000 : REM safe rectangle outline drawing subroutine
1080 RETURN

2000 IF (Y > 191 OR Y + H < 0) THEN RETURN
2010 IF (X > 279 OR X + W < 0) THEN RETURN
2020 REM drawing top and bottom lines
2030 X1 = X : X2 = X + W
2040 IF X1 < 0 THEN X1 = 0
2050 IF X2 < 0 THEN X2 = 0
2060 IF X2 > 279 THEN X2 = 279
2070 IF X1 > 279 THEN X1 = 279
2080 IF Y < 0 OR Y > 191 GOTO 2100
2090 HPLOT X1, Y TO X2, Y : REM horizontal top line
2100 IF Y + H < 0 OR Y + H > 191 GOTO 2120
2110 HPLOT X1, Y + H TO X2, Y + H : REM horizontal bottom line

2120 REM drawing left and right lines
2130 Y1 = Y : Y2 = Y + H
2140 IF Y1 < 0 THEN Y1 = 0
2150 IF Y2 < 0 THEN Y2 = 0
2160 IF Y2 > 191 THEN Y2 = 191
2170 IF Y1 > 191 THEN Y1 = 191
2180 IF X < 0 OR X > 279 THEN GOTO 2200
2190 HPLOT X, Y1 TO X, Y2
2200 IF X + W < 0 OR X + W > 279 THEN GOTO 2220
2210 HPLOT X + W, Y1 TO X + W, Y2
2220 RETURN

2230 REM Made By VinVox
2240 REM https://github.com/VinVox/Something-In-Basic-3/new/main
2250 REM Made In Basic
2260 REM Abstract Art
