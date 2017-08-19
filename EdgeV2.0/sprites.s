;------- Module mémoire des sprites de Edge


;------- Coordonnees des sprites a afficher et taille des sprites
;------- chaque sprite peut avoir une taille differente
;-------    ATTENTION : un sprite ne peut pas excéder 55 lignes pour des raisons de dépassement dans des
;-------    COMPARE de la procédure

.dsb 256-(*&255)

;------- Numéro de sprite affecté
PGS_N
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

;------- Position courante du sprite
PGS_CX
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

PGS_CY
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

PGS_STATUT
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

;------- Position ancienne du sprite
PGS_OX
.byt 0

PGS_OY
.byt 0


;------- Largeur et hauteur des sprites tels que définis
PGS_CL
.byt 4,5,5,5,5,4,4,4,4,4

PGS_CH
.byt 24,26,22,26,22,24,24,24,20,20

.dsb 256-(*&255)

;-------     Mémoire de sauvegarde de la zone d écran : LBLPICT
PictureAdressLow
	.byt <(LBLPICT+40*0)
	.byt <(LBLPICT+40*1)
	.byt <(LBLPICT+40*2)
	.byt <(LBLPICT+40*3)
	.byt <(LBLPICT+40*4)
	.byt <(LBLPICT+40*5)
	.byt <(LBLPICT+40*6)
	.byt <(LBLPICT+40*7)
	.byt <(LBLPICT+40*8)
	.byt <(LBLPICT+40*9)
	.byt <(LBLPICT+40*10)
	.byt <(LBLPICT+40*11)
	.byt <(LBLPICT+40*12)
	.byt <(LBLPICT+40*13)
	.byt <(LBLPICT+40*14)
	.byt <(LBLPICT+40*15)
	.byt <(LBLPICT+40*16)
	.byt <(LBLPICT+40*17)
	.byt <(LBLPICT+40*18)
	.byt <(LBLPICT+40*19)
	.byt <(LBLPICT+40*20)
	.byt <(LBLPICT+40*21)
	.byt <(LBLPICT+40*22)
	.byt <(LBLPICT+40*23)
	.byt <(LBLPICT+40*24)
	.byt <(LBLPICT+40*25)
	.byt <(LBLPICT+40*26)
	.byt <(LBLPICT+40*27)
	.byt <(LBLPICT+40*28)
	.byt <(LBLPICT+40*29)
	.byt <(LBLPICT+40*30)
	.byt <(LBLPICT+40*31)
	.byt <(LBLPICT+40*32)
	.byt <(LBLPICT+40*33)
	.byt <(LBLPICT+40*34)
	.byt <(LBLPICT+40*35)
	.byt <(LBLPICT+40*36)
	.byt <(LBLPICT+40*37)
	.byt <(LBLPICT+40*38)
	.byt <(LBLPICT+40*39)
	.byt <(LBLPICT+40*40)
	.byt <(LBLPICT+40*41)
	.byt <(LBLPICT+40*42)
	.byt <(LBLPICT+40*43)
	.byt <(LBLPICT+40*44)
	.byt <(LBLPICT+40*45)
	.byt <(LBLPICT+40*46)
	.byt <(LBLPICT+40*47)
	.byt <(LBLPICT+40*48)
	.byt <(LBLPICT+40*49)
	.byt <(LBLPICT+40*50)
	.byt <(LBLPICT+40*51)
	.byt <(LBLPICT+40*52)
	.byt <(LBLPICT+40*53)
	.byt <(LBLPICT+40*54)
	.byt <(LBLPICT+40*55)
	.byt <(LBLPICT+40*56)
	.byt <(LBLPICT+40*57)
	.byt <(LBLPICT+40*58)
	.byt <(LBLPICT+40*59)
	.byt <(LBLPICT+40*60)
	.byt <(LBLPICT+40*61)
	.byt <(LBLPICT+40*62)
	.byt <(LBLPICT+40*63)
	.byt <(LBLPICT+40*64)
	.byt <(LBLPICT+40*65)
	.byt <(LBLPICT+40*66)
	.byt <(LBLPICT+40*67)
	.byt <(LBLPICT+40*68)
	.byt <(LBLPICT+40*69)
	.byt <(LBLPICT+40*70)
	.byt <(LBLPICT+40*71)
	.byt <(LBLPICT+40*72)
	.byt <(LBLPICT+40*73)
	.byt <(LBLPICT+40*74)
	.byt <(LBLPICT+40*75)
	.byt <(LBLPICT+40*76)
	.byt <(LBLPICT+40*77)
	.byt <(LBLPICT+40*78)
	.byt <(LBLPICT+40*79)
	.byt <(LBLPICT+40*80)
	.byt <(LBLPICT+40*81)
	.byt <(LBLPICT+40*82)
	.byt <(LBLPICT+40*83)
	.byt <(LBLPICT+40*84)
	.byt <(LBLPICT+40*85)
	.byt <(LBLPICT+40*86)
	.byt <(LBLPICT+40*87)
	.byt <(LBLPICT+40*88)
	.byt <(LBLPICT+40*89)
	.byt <(LBLPICT+40*90)
	.byt <(LBLPICT+40*91)
	.byt <(LBLPICT+40*92)
	.byt <(LBLPICT+40*93)
	.byt <(LBLPICT+40*94)
	.byt <(LBLPICT+40*95)
	.byt <(LBLPICT+40*96)
	.byt <(LBLPICT+40*97)
	.byt <(LBLPICT+40*98)
	.byt <(LBLPICT+40*99)
	.byt <(LBLPICT+40*100)
	.byt <(LBLPICT+40*101)
	.byt <(LBLPICT+40*102)
	.byt <(LBLPICT+40*103)
	.byt <(LBLPICT+40*104)
	.byt <(LBLPICT+40*105)
	.byt <(LBLPICT+40*106)
	.byt <(LBLPICT+40*107)
	.byt <(LBLPICT+40*108)
	.byt <(LBLPICT+40*109)
	.byt <(LBLPICT+40*110)
	.byt <(LBLPICT+40*111)
	.byt <(LBLPICT+40*112)
	.byt <(LBLPICT+40*113)
	.byt <(LBLPICT+40*114)
	.byt <(LBLPICT+40*115)
	.byt <(LBLPICT+40*116)
	.byt <(LBLPICT+40*117)
	.byt <(LBLPICT+40*118)
	.byt <(LBLPICT+40*119)
	.byt <(LBLPICT+40*120)
	.byt <(LBLPICT+40*121)
	.byt <(LBLPICT+40*122)
	.byt <(LBLPICT+40*123)
	.byt <(LBLPICT+40*124)
	.byt <(LBLPICT+40*125)
	.byt <(LBLPICT+40*126)
	.byt <(LBLPICT+40*127)
	.byt <(LBLPICT+40*128)
	.byt <(LBLPICT+40*129)
	.byt <(LBLPICT+40*130)
	.byt <(LBLPICT+40*131)
	.byt <(LBLPICT+40*132)
	.byt <(LBLPICT+40*133)
	.byt <(LBLPICT+40*134)
	.byt <(LBLPICT+40*135)
	.byt <(LBLPICT+40*136)
	.byt <(LBLPICT+40*137)
	.byt <(LBLPICT+40*138)
	.byt <(LBLPICT+40*139)
	.byt <(LBLPICT+40*140)
	.byt <(LBLPICT+40*141)
	.byt <(LBLPICT+40*142)
	.byt <(LBLPICT+40*143)
	.byt <(LBLPICT+40*144)
	.byt <(LBLPICT+40*145)
	.byt <(LBLPICT+40*146)
	.byt <(LBLPICT+40*147)
	.byt <(LBLPICT+40*148)
	.byt <(LBLPICT+40*149)
	.byt <(LBLPICT+40*150)
	.byt <(LBLPICT+40*151)
	.byt <(LBLPICT+40*152)
	.byt <(LBLPICT+40*153)
	.byt <(LBLPICT+40*154)
	.byt <(LBLPICT+40*155)
	.byt <(LBLPICT+40*156)
	.byt <(LBLPICT+40*157)
	.byt <(LBLPICT+40*158)
	.byt <(LBLPICT+40*159)
	.byt <(LBLPICT+40*160)
	.byt <(LBLPICT+40*161)
	.byt <(LBLPICT+40*162)
	.byt <(LBLPICT+40*163)
	.byt <(LBLPICT+40*164)
	.byt <(LBLPICT+40*165)
	.byt <(LBLPICT+40*166)
	.byt <(LBLPICT+40*167)
	.byt <(LBLPICT+40*168)
	.byt <(LBLPICT+40*169)
	.byt <(LBLPICT+40*170)
	.byt <(LBLPICT+40*171)
	.byt <(LBLPICT+40*172)
	.byt <(LBLPICT+40*173)
	.byt <(LBLPICT+40*174)
	.byt <(LBLPICT+40*175)
	.byt <(LBLPICT+40*176)
	.byt <(LBLPICT+40*177)
	.byt <(LBLPICT+40*178)
	.byt <(LBLPICT+40*179)
	.byt <(LBLPICT+40*180)
	.byt <(LBLPICT+40*181)
	.byt <(LBLPICT+40*182)
	.byt <(LBLPICT+40*183)
	.byt <(LBLPICT+40*184)
	.byt <(LBLPICT+40*185)
	.byt <(LBLPICT+40*186)
	.byt <(LBLPICT+40*187)
	.byt <(LBLPICT+40*188)
	.byt <(LBLPICT+40*189)
	.byt <(LBLPICT+40*190)
	.byt <(LBLPICT+40*191)
	.byt <(LBLPICT+40*192)
	.byt <(LBLPICT+40*193)
	.byt <(LBLPICT+40*194)
	.byt <(LBLPICT+40*195)
	.byt <(LBLPICT+40*196)
	.byt <(LBLPICT+40*197)
	.byt <(LBLPICT+40*198)
	.byt <(LBLPICT+40*199)

; positionné ici pour optimiser le bloc de données de la page	
;-------- Tableaux de pointeurs vers les zones mémoire des tampons, des sprites et des masques

PGS_SPTRH
 .byt >PGS_S1
 .byt >PGS_S2
 .byt >PGS_S3
 .byt >PGS_S4
 .byt >PGS_S5
 .byt >PGS_S6
 .byt >PGS_S7
 .byt >PGS_S8
 .byt >PGS_S9
 .byt >PGS_S10


PGS_SPTRL
 .byt <PGS_S1
 .byt <PGS_S2
 .byt <PGS_S3
 .byt <PGS_S4
 .byt <PGS_S5
 .byt <PGS_S6
 .byt <PGS_S7
 .byt <PGS_S8
 .byt <PGS_S9
 .byt <PGS_S10
 
PGS_MPTRH 
 .byt >PGS_M1
 .byt >PGS_M2
 .byt >PGS_M3
 .byt >PGS_M4
 .byt >PGS_M5
 .byt >PGS_M6
 .byt >PGS_M7
 .byt >PGS_M8
 .byt >PGS_M9
 .byt >PGS_M10

PGS_MPTRL
 .byt <PGS_M1
 .byt <PGS_M2
 .byt <PGS_M3
 .byt <PGS_M4
 .byt <PGS_M5
 .byt <PGS_M6
 .byt <PGS_M7
 .byt <PGS_M8
 .byt <PGS_M9
 .byt <PGS_M10


.dsb 256-(*&255)
; This table contains hight 8 bits of the adress
PictureAdressHigh
	.byt >(LBLPICT+40*0)
	.byt >(LBLPICT+40*1)
	.byt >(LBLPICT+40*2)
	.byt >(LBLPICT+40*3)
	.byt >(LBLPICT+40*4)
	.byt >(LBLPICT+40*5)
	.byt >(LBLPICT+40*6)
	.byt >(LBLPICT+40*7)
	.byt >(LBLPICT+40*8)
	.byt >(LBLPICT+40*9)
	.byt >(LBLPICT+40*10)
	.byt >(LBLPICT+40*11)
	.byt >(LBLPICT+40*12)
	.byt >(LBLPICT+40*13)
	.byt >(LBLPICT+40*14)
	.byt >(LBLPICT+40*15)
	.byt >(LBLPICT+40*16)
	.byt >(LBLPICT+40*17)
	.byt >(LBLPICT+40*18)
	.byt >(LBLPICT+40*19)
	.byt >(LBLPICT+40*20)
	.byt >(LBLPICT+40*21)
	.byt >(LBLPICT+40*22)
	.byt >(LBLPICT+40*23)
	.byt >(LBLPICT+40*24)
	.byt >(LBLPICT+40*25)
	.byt >(LBLPICT+40*26)
	.byt >(LBLPICT+40*27)
	.byt >(LBLPICT+40*28)
	.byt >(LBLPICT+40*29)
	.byt >(LBLPICT+40*30)
	.byt >(LBLPICT+40*31)
	.byt >(LBLPICT+40*32)
	.byt >(LBLPICT+40*33)
	.byt >(LBLPICT+40*34)
	.byt >(LBLPICT+40*35)
	.byt >(LBLPICT+40*36)
	.byt >(LBLPICT+40*37)
	.byt >(LBLPICT+40*38)
	.byt >(LBLPICT+40*39)
	.byt >(LBLPICT+40*40)
	.byt >(LBLPICT+40*41)
	.byt >(LBLPICT+40*42)
	.byt >(LBLPICT+40*43)
	.byt >(LBLPICT+40*44)
	.byt >(LBLPICT+40*45)
	.byt >(LBLPICT+40*46)
	.byt >(LBLPICT+40*47)
	.byt >(LBLPICT+40*48)
	.byt >(LBLPICT+40*49)
	.byt >(LBLPICT+40*50)
	.byt >(LBLPICT+40*51)
	.byt >(LBLPICT+40*52)
	.byt >(LBLPICT+40*53)
	.byt >(LBLPICT+40*54)
	.byt >(LBLPICT+40*55)
	.byt >(LBLPICT+40*56)
	.byt >(LBLPICT+40*57)
	.byt >(LBLPICT+40*58)
	.byt >(LBLPICT+40*59)
	.byt >(LBLPICT+40*60)
	.byt >(LBLPICT+40*61)
	.byt >(LBLPICT+40*62)
	.byt >(LBLPICT+40*63)
	.byt >(LBLPICT+40*64)
	.byt >(LBLPICT+40*65)
	.byt >(LBLPICT+40*66)
	.byt >(LBLPICT+40*67)
	.byt >(LBLPICT+40*68)
	.byt >(LBLPICT+40*69)
	.byt >(LBLPICT+40*70)
	.byt >(LBLPICT+40*71)
	.byt >(LBLPICT+40*72)
	.byt >(LBLPICT+40*73)
	.byt >(LBLPICT+40*74)
	.byt >(LBLPICT+40*75)
	.byt >(LBLPICT+40*76)
	.byt >(LBLPICT+40*77)
	.byt >(LBLPICT+40*78)
	.byt >(LBLPICT+40*79)
	.byt >(LBLPICT+40*80)
	.byt >(LBLPICT+40*81)
	.byt >(LBLPICT+40*82)
	.byt >(LBLPICT+40*83)
	.byt >(LBLPICT+40*84)
	.byt >(LBLPICT+40*85)
	.byt >(LBLPICT+40*86)
	.byt >(LBLPICT+40*87)
	.byt >(LBLPICT+40*88)
	.byt >(LBLPICT+40*89)
	.byt >(LBLPICT+40*90)
	.byt >(LBLPICT+40*91)
	.byt >(LBLPICT+40*92)
	.byt >(LBLPICT+40*93)
	.byt >(LBLPICT+40*94)
	.byt >(LBLPICT+40*95)
	.byt >(LBLPICT+40*96)
	.byt >(LBLPICT+40*97)
	.byt >(LBLPICT+40*98)
	.byt >(LBLPICT+40*99)
	.byt >(LBLPICT+40*100)
	.byt >(LBLPICT+40*101)
	.byt >(LBLPICT+40*102)
	.byt >(LBLPICT+40*103)
	.byt >(LBLPICT+40*104)
	.byt >(LBLPICT+40*105)
	.byt >(LBLPICT+40*106)
	.byt >(LBLPICT+40*107)
	.byt >(LBLPICT+40*108)
	.byt >(LBLPICT+40*109)
	.byt >(LBLPICT+40*110)
	.byt >(LBLPICT+40*111)
	.byt >(LBLPICT+40*112)
	.byt >(LBLPICT+40*113)
	.byt >(LBLPICT+40*114)
	.byt >(LBLPICT+40*115)
	.byt >(LBLPICT+40*116)
	.byt >(LBLPICT+40*117)
	.byt >(LBLPICT+40*118)
	.byt >(LBLPICT+40*119)
	.byt >(LBLPICT+40*120)
	.byt >(LBLPICT+40*121)
	.byt >(LBLPICT+40*122)
	.byt >(LBLPICT+40*123)
	.byt >(LBLPICT+40*124)
	.byt >(LBLPICT+40*125)
	.byt >(LBLPICT+40*126)
	.byt >(LBLPICT+40*127)
	.byt >(LBLPICT+40*128)
	.byt >(LBLPICT+40*129)
	.byt >(LBLPICT+40*130)
	.byt >(LBLPICT+40*131)
	.byt >(LBLPICT+40*132)
	.byt >(LBLPICT+40*133)
	.byt >(LBLPICT+40*134)
	.byt >(LBLPICT+40*135)
	.byt >(LBLPICT+40*136)
	.byt >(LBLPICT+40*137)
	.byt >(LBLPICT+40*138)
	.byt >(LBLPICT+40*139)
	.byt >(LBLPICT+40*140)
	.byt >(LBLPICT+40*141)
	.byt >(LBLPICT+40*142)
	.byt >(LBLPICT+40*143)
	.byt >(LBLPICT+40*144)
	.byt >(LBLPICT+40*145)
	.byt >(LBLPICT+40*146)
	.byt >(LBLPICT+40*147)
	.byt >(LBLPICT+40*148)
	.byt >(LBLPICT+40*149)
	.byt >(LBLPICT+40*150)
	.byt >(LBLPICT+40*151)
	.byt >(LBLPICT+40*152)
	.byt >(LBLPICT+40*153)
	.byt >(LBLPICT+40*154)
	.byt >(LBLPICT+40*155)
	.byt >(LBLPICT+40*156)
	.byt >(LBLPICT+40*157)
	.byt >(LBLPICT+40*158)
	.byt >(LBLPICT+40*159)
	.byt >(LBLPICT+40*160)
	.byt >(LBLPICT+40*161)
	.byt >(LBLPICT+40*162)
	.byt >(LBLPICT+40*163)
	.byt >(LBLPICT+40*164)
	.byt >(LBLPICT+40*165)
	.byt >(LBLPICT+40*166)
	.byt >(LBLPICT+40*167)
	.byt >(LBLPICT+40*168)
	.byt >(LBLPICT+40*169)
	.byt >(LBLPICT+40*170)
	.byt >(LBLPICT+40*171)
	.byt >(LBLPICT+40*172)
	.byt >(LBLPICT+40*173)
	.byt >(LBLPICT+40*174)
	.byt >(LBLPICT+40*175)
	.byt >(LBLPICT+40*176)
	.byt >(LBLPICT+40*177)
	.byt >(LBLPICT+40*178)
	.byt >(LBLPICT+40*179)
	.byt >(LBLPICT+40*180)
	.byt >(LBLPICT+40*181)
	.byt >(LBLPICT+40*182)
	.byt >(LBLPICT+40*183)
	.byt >(LBLPICT+40*184)
	.byt >(LBLPICT+40*185)
	.byt >(LBLPICT+40*186)
	.byt >(LBLPICT+40*187)
	.byt >(LBLPICT+40*188)
	.byt >(LBLPICT+40*189)
	.byt >(LBLPICT+40*190)
	.byt >(LBLPICT+40*191)
	.byt >(LBLPICT+40*192)
	.byt >(LBLPICT+40*193)
	.byt >(LBLPICT+40*194)
	.byt >(LBLPICT+40*195)
	.byt >(LBLPICT+40*196)
	.byt >(LBLPICT+40*197)
	.byt >(LBLPICT+40*198)
	.byt >(LBLPICT+40*199)



;-------- Définition des sprites

;;; Sprite 1 : Cube. 5 sprites pour le déplacement du cube

.dsb 256-(*&255)
PGS_S
;-- sprite 1 : Cube droit
PGS_S1
.byt   0,0,0,0
.byt   0,1,32,0
.byt   0,7,56,0
.byt   0,30,30,0
.byt   1,56,7,32
.byt   7,32,1,56
.byt   30,0,0,30
.byt   7,32,1,56
.byt   25,56,7,38
.byt   30,30,30,30
.byt   31,39,57,62
.byt   25,57,39,38
.byt   24,30,30,6
.byt   24,6,24,6
.byt   24,6,24,6
.byt   24,6,24,6
.byt   24,6,24,6
.byt   30,6,24,30
.byt   7,38,25,56
.byt   1,62,31,32
.byt   0,30,30,0
.byt   0,6,24,0
.byt   0,0,0,0
.byt   0,0,0,0




;-- sprite 2
PGS_S2

.byt   0,0,0,0,0
.byt   0,0,48,0,0
.byt   0,1,60,0,0
.byt   0,3,47,0,0
.byt   0,7,7,48,0
.byt   0,14,1,60,0
.byt   0,28,0,30,0
.byt   0,56,0,29,0
.byt   1,48,0,59,32
.byt   3,32,1,55,32
.byt   7,48,3,46,48
.byt   1,60,7,28,48
.byt   2,31,14,56,24
.byt   3,39,61,48,24
.byt   1,57,59,32,12
.byt   1,46,23,0,12
.byt   0,51,46,0,28
.byt   0,16,54,0,56
.byt   0,24,23,1,48
.byt   0,12,27,3,32
.byt   0,7,13,39,0
.byt   0,1,53,46,0
.byt   0,0,30,60,0
.byt   0,0,6,56,0
.byt   0,0,1,16,0
.byt   0,0,0,0,0

.dsb 256-(*&255)

;-- sprite 3
PGS_S3
.byt   0,0,0,0,0
.byt   0,9,0,0,0
.byt   0,30,0,0,0
.byt   0,31,32,0,0
.byt   0,59,56,0,0
.byt   0,48,62,0,0
.byt   0,48,15,16,32
.byt   1,48,7,31,0
.byt   1,32,6,63,60
.byt   1,32,6,51,60
.byt   3,32,14,48,24
.byt   3,0,13,48,24
.byt   3,0,29,32,24
.byt   7,32,27,32,48
.byt   3,56,27,32,48
.byt   0,62,59,0,48
.byt   0,15,55,1,32
.byt   0,3,54,1,32
.byt   0,0,47,49,0
.byt   0,0,15,63,0
.byt   0,0,0,31,0
.byt   0,0,0,0,0


;-- sprite 4
PGS_S4
.byt   0,0,0,0,0
.byt   0,0,3,0,0
.byt   0,0,15,32,0
.byt   0,0,61,48,0
.byt   0,3,56,56,0
.byt   0,15,32,28,0
.byt   0,30,0,14,0
.byt   0,46,0,7,0
.byt   1,55,0,3,32
.byt   1,59,32,1,48
.byt   3,29,48,3,56
.byt   3,14,56,15,32
.byt   6,7,28,62,16
.byt   6,3,47,57,48
.byt   12,1,55,39,32
.byt   12,0,58,29,32
.byt   14,0,29,51,0
.byt   7,0,27,2,0
.byt   3,32,58,6,0
.byt   1,48,54,12,0
.byt   0,57,44,56,0
.byt   0,29,43,32,0
.byt   0,15,30,0,0
.byt   0,7,24,0,0
.byt   0,2,32,0,0
.byt   0,0,0,0,0


.dsb 256-(*&255)

;-- sprite 5
PGS_S5
.byt   0,0,0,0,0
.byt   0,0,0,36,0
.byt   0,0,0,30,0
.byt   0,0,1,62,0
.byt   0,0,7,55,0
.byt   0,0,31,3,0
.byt   1,2,60,3,0
.byt   0,62,56,3,32
.byt   15,63,24,1,32
.byt   15,51,24,1,32
.byt   6,3,28,1,48
.byt   6,3,44,0,48
.byt   6,1,46,0,48
.byt   3,1,54,1,56
.byt   3,1,54,7,48
.byt   3,0,55,31,0
.byt   1,32,59,60,0
.byt   1,32,27,48,0
.byt   0,35,61,0,0
.byt   0,63,60,0,0
.byt   0,62,0,0,0
.byt   0,0,0,0,0


;-- sprite 6 : fond
PGS_S6
.byt   0,1,32,0
.byt   0,7,56,0
.byt   0,31,62,0
.byt   1,63,63,32
.byt   7,63,63,56
.byt   31,63,63,62
.byt   63,63,63,62
.byt   31,63,63,56
.byt   55,63,63,34
.byt   29,63,62,8
.byt   55,31,56,34
.byt   29,55,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   23,29,8,34
.byt   5,55,34,8
.byt   1,29,8,32
.byt   0,23,34,0
.byt   0,5,8,0
.byt   0,1,32,0

.dsb 256-(*&255)


;-- sprite 7
PGS_S7
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   32,0,0,2
.byt   24,0,0,8
.byt   54,0,0,34
.byt   29,32,2,8
.byt   55,24,8,34
.byt   29,54,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   55,29,8,34
.byt   29,55,34,8
.byt   23,29,8,34
.byt   5,55,34,8
.byt   1,29,8,32
.byt   0,23,34,0
.byt   0,5,8,0
.byt   0,1,32,0


;-- sprite 8
PGS_S8
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,1,32,0
.byt   0,1,32,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0
.byt   0,0,0,0

;-- sprite 9
PGS_S9
.byt $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F

;-- sprite 10
PGS_S10
.byt $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F

;-------     Zones de masques des sprites

.dsb 256-(*&255)
PGS_M
;-- sprite 1
PGS_M1 

.byt 63, 62, 31, 63
.byt 63, 56, 7, 63
.byt 63, 32, 1, 63
.byt 62, 0, 0, 31
.byt 56, 0, 0, 7
.byt 32, 0, 0, 1
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 32, 0, 0, 1
.byt 56, 0, 0, 7
.byt 62, 0, 0, 31
.byt 63, 32, 1, 63
.byt 63, 56, 7, 63
.byt 63, 62, 31, 63

;-- sprite 2 
PGS_M2 
.byt 63, 63, 15, 63, 63
.byt 63, 62, 3, 63, 63
.byt 63, 60, 0, 63, 63
.byt 63, 56, 0, 15, 63
.byt 63, 48, 0, 3, 63
.byt 63, 32, 0, 1, 63
.byt 63, 0, 0, 0, 31
.byt 62, 0, 0, 0, 31
.byt 60, 0, 0, 0, 15
.byt 48, 0, 0, 0, 15
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 3
.byt 48, 0, 0, 0, 3
.byt 60, 0, 0, 0, 1
.byt 60, 0, 0, 0, 1
.byt 62, 0, 0, 0, 1
.byt 63, 0, 0, 0, 3
.byt 63, 0, 0, 0, 7
.byt 63, 32, 0, 0, 15
.byt 63, 32, 0, 0, 31
.byt 63, 56, 0, 0, 63
.byt 63, 62, 0, 1, 63
.byt 63, 63, 32, 3, 63
.byt 63, 63, 56, 7, 63
.byt 63, 63, 62, 15, 63

.dsb 256-(*&255)

;-- sprite 3 
PGS_M3 
.byt 63, 32, 63, 63, 63
.byt 63, 32, 3, 63, 63
.byt 63, 0, 0, 31, 63
.byt 63, 0, 0, 7, 63
.byt 62, 0, 0, 1, 63
.byt 62, 0, 0, 0, 31
.byt 62, 0, 0, 0, 7
.byt 60, 0, 0, 0, 1
.byt 60, 0, 0, 0, 1
.byt 60, 0, 0, 0, 1
.byt 56, 0, 0, 0, 3
.byt 56, 0, 0, 0, 3
.byt 56, 0, 0, 0, 3
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 7
.byt 60, 0, 0, 0, 7
.byt 63, 0, 0, 0, 15
.byt 63, 48, 0, 0, 15
.byt 63, 60, 0, 0, 31
.byt 63, 63, 0, 0, 31
.byt 63, 63, 48, 0, 31
.byt 63, 63, 63, 32, 63



;-- sprite 4 
PGS_M4 

.byt 63, 63, 60, 63, 63
.byt 63, 63, 48, 31, 63
.byt 63, 63, 0, 15, 63
.byt 63, 60, 0, 7, 63
.byt 63, 48, 0, 3, 63
.byt 63, 32, 0, 1, 63
.byt 62, 0, 0, 0, 63
.byt 62, 0, 0, 0, 31
.byt 60, 0, 0, 0, 15
.byt 60, 0, 0, 0, 7
.byt 56, 0, 0, 0, 3
.byt 56, 0, 0, 0, 3
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 7
.byt 32, 0, 0, 0, 15
.byt 32, 0, 0, 0, 15
.byt 32, 0, 0, 0, 31
.byt 48, 0, 0, 0, 63
.byt 56, 0, 0, 0, 63
.byt 60, 0, 0, 1, 63
.byt 62, 0, 0, 1, 63
.byt 63, 0, 0, 7, 63
.byt 63, 32, 0, 31, 63
.byt 63, 48, 1, 63, 63
.byt 63, 56, 7, 63, 63
.byt 63, 60, 31, 63, 63

.dsb 256-(*&255)

;-- sprite 5 
PGS_M5 
.byt 63, 63, 63, 1, 63
.byt 63, 63, 48, 1, 63
.byt 63, 62, 0, 0, 63
.byt 63, 56, 0, 0, 63
.byt 63, 32, 0, 0, 31
.byt 62, 0, 0, 0, 31
.byt 56, 0, 0, 0, 31
.byt 32, 0, 0, 0, 15
.byt 32, 0, 0, 0, 15
.byt 32, 0, 0, 0, 15
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 7
.byt 48, 0, 0, 0, 7
.byt 56, 0, 0, 0, 3
.byt 56, 0, 0, 0, 3
.byt 56, 0, 0, 0, 15
.byt 60, 0, 0, 0, 63
.byt 60, 0, 0, 3, 63
.byt 62, 0, 0, 15, 63
.byt 62, 0, 0, 63, 63
.byt 62, 0, 3, 63, 63
.byt 63, 1, 63, 63, 63



;-- sprite 6 
PGS_M6 

.byt 63, 62, 31, 63
.byt 63, 56, 7, 63
.byt 63, 32, 1, 63
.byt 62, 0, 0, 31
.byt 56, 0, 0, 7
.byt 32, 0, 0, 1
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 32, 0, 0, 1
.byt 56, 0, 0, 7
.byt 62, 0, 0, 31
.byt 63, 32, 1, 63
.byt 63, 56, 7, 63
.byt 63, 62, 31, 63

.dsb 256-(*&255)

;-- sprite 7 
PGS_M7 
.byt 63, 62, 31, 63
.byt 63, 56, 7, 63
.byt 63, 32, 1, 63
.byt 62, 0, 0, 31
.byt 56, 0, 0, 7
.byt 32, 0, 0, 1
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 0, 0, 0, 0
.byt 32, 0, 0, 1
.byt 56, 0, 0, 7
.byt 62, 0, 0, 31
.byt 63, 32, 1, 63
.byt 63, 56, 7, 63
.byt 63, 62, 31, 63



;-- sprite 8
PGS_M8

.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 63, 63, 63
.byt 63, 62, 31, 63
.byt 63, 56, 7, 63
.byt 63, 32, 1, 63
.byt 62, 0, 0, 31
.byt 56, 0, 0, 7
.byt 32, 0, 0, 1
.byt 32, 0, 0, 1
.byt 56, 0, 0, 7
.byt 62, 0, 0, 31
.byt 63, 32, 1, 63
.byt 63, 56, 7, 63
.byt 63, 62, 31, 63

;-- sprite 9
PGS_M9
.byt $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F

;-- sprite 10
PGS_M10
.byt $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
