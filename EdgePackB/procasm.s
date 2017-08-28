#define 	x0  #22
#define 	y0  #90
#define 	dx2  #2
#define 	dy1 #12
#define 	dy2  #6

_updatevars
.(
;--- calcul abx
	lda #0 
	sta op1+1 
	sta op2+1
	lda _edgex
	sta op1
	sec 
	sbc _edgey
	sta op2 
	lda op1+1
	sbc op2+1
	sta op2+1
	
	lda dx2
	sta op1 
	lda #0 
	sta op1+1
	jsr mul16i 
	stx tmp1 
	sec 
	lda x0 
	sbc tmp1 
	sta _abx 

;--- calcul aby 	aby = y0 + dy2 * ( edgex + edgey ) - edgez * dy1 ;

	clc 
	lda _edgex
	adc _edgey 
	sta op2 

	lda dy2 
	sta op1 
	lda #0 
	sta op1+1 
	sta op2+1 
	jsr mul16i 
	stx tmp1 

	clc 
	lda y0 
	adc tmp1 
	sta tmp0 

	lda _edgez 
	sta op1 
	lda dy1 
	sta op2 
	lda #0 
	sta op1+1 
	sta op2+1 
	jsr mul16i 
	stx tmp1 
	
	sec 
	lda tmp0 
	sbc tmp1 
	sta _aby 

;----calcul	   tab = edgex * 8 + edgey ;
	lda _edgex
	clc 
	asl
	asl
	asl 
	adc _edgey 
	sta _tab 

	rts 
.)

_testbit
.(

	ldy #2
	lda (sp),y
	tax
	inx
	dey
	dey
	lda (sp),y
boucle
	lsr
	dex
	bne boucle
	bcc fin
	inx
fin
	lda #0
	rts
	
.)

_delai
.(
	ldy #0
	lda (sp),y
	tay
delai1
	ldx #255
delai2
	dex
	bne delai2
	dey
	bne delai1
	rts
.)

_mode_jeu
.(
	lda #10 
	sta $26A
	lda #8
	sta $24E
	lda #6 
	sta $24F
.)
_caps_invis
.(
	lda #0 
	sta 48041
.)