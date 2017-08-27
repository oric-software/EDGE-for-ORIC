
; -- Patterns are in displayhires.s file because of memory space optimisation


_PGS_updatemap
.(
	sei
	lda ScreenAdressLow
	sta tmp3
	lda ScreenAdressHigh
	sta tmp3+1
	
	ldx #48
boucle0
	lda #6
	ldy #0
	sta (tmp3),y
	ldy #9
	cpx #41
	bcs apres1
	lda #7
	jmp apres2
apres1
	lda #6
apres2
	sta (tmp3),y
	lda tmp3
	clc
	adc #40
	sta tmp3
	lda tmp3+1
	adc #0
	sta tmp3+1
	dex
	bne boucle0

	lda ScreenAdressLow
	clc
	adc #1
	sta addecran+1
	sta tmp3
	lda ScreenAdressHigh
	sta addecran+2
	sta tmp3+1
	 
	lda _currentEdge
	sta addedge+1
	lda _currentEdge+1
	sta addedge+2
	
	
	lda #0
	sta tmp7

boucley
	lda #0 
	sta tmp6

boucle10
addedge
	lda $1234
	sta tmp1

	lda #<PATTERN
	sta tmp2
	lda #>PATTERN
	sta tmp2+1
	
	asl tmp1
	ldx #7			; on boucle sur l axe z

boucle1
	asl tmp1
	bcs suite1
	lda tmp2
	clc
	adc #6
	sta tmp2
	lda tmp2+1
	adc #0
	sta tmp2+1
	dex
	bne boucle1
suite1
	ldy #6
boucle2
	dey
	lda (tmp2),y
addecran
	sta $1234
	tya
	beq suite2
	lda addecran+1	
	clc
	adc #40
	sta addecran+1
	lda addecran+2
	adc #0
	sta addecran+2
	jmp boucle2
	
suite2
	inc tmp6
	inc addedge+1
	lda tmp6
	cmp _Edgesize
	beq  suite3
	lda tmp3			; adresse de l écran
	clc
	adc #1
	sta addecran+1
	sta tmp3
	lda tmp3+1
	adc #0
	sta addecran+2
	sta tmp3+1
	jmp boucle10

suite3
	inc tmp7
	lda tmp7
	cmp _Edgesize
	beq suite4
	lda addecran+1			; adresse de l écran
	clc
	adc #33
	sta tmp3
	sta addecran+1
	lda addecran+2
	adc #0
	sta tmp3+1
	sta addecran+2
	jmp boucley

; affichage de la cible sur la map
suite4
	lda _currentMap
	asl
	clc
	adc _currentMap
	sta tmp4
	
	clc
	lda #<_Edgecible
	adc tmp4
	sta tmp4
	lda #>_Edgecible
	adc #0
	sta tmp4+1

	ldy #1
	lda (tmp4),y
	sta tmp5

	ldy #0
	lda (tmp4),y
	asl
	clc
	adc (tmp4),y
	asl
	
	tay
	lda ScreenAdressLow,y
	clc
	adc #1
	adc tmp5
	sta addecran6+1	
	lda ScreenAdressHigh,y
	adc #0
	sta addecran6+2
	
	lda #<patterncible
	sta tmp3
	lda #>patterncible
	sta tmp3+1
	
	ldy #6
boucle4
	dey
	lda (tmp3),y
addecran6
	sta $1234
	tya
	beq suite6
	lda addecran6+1	
	clc
	adc #40
	sta addecran6+1
	lda addecran6+2
	adc #0
	sta addecran6+2
	jmp boucle4
	
suite6
	lda _edgex
	asl
	clc
	adc _edgex
	asl
	tay
	lda ScreenAdressLow,y
	clc
	adc #1
	adc _edgey
	sta addecran4+1	
	lda ScreenAdressHigh,y
	adc #0
	sta addecran4+2
	
	ldy #6
boucle3
	dey
	lda #255
addecran4
	sta $1234
	tya
	beq suite5
	lda addecran4+1	
	clc
	adc #40
	sta addecran4+1
	lda addecran4+2
	adc #0
	sta addecran4+2
	jmp boucle3

; affichage de la cible sur la map

suite5
	cli
	rts
.)

