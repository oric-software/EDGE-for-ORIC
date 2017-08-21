
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
	
	lda _dx2
	sta op1 
	lda #0 
	sta op1+1
	jsr mul16i 
	stx tmp1 
	sec 
	lda _x0 
	sbc tmp1 
	sta _abx 

;--- calcul aby 	aby = y0 + dy2 * ( edgex + edgey ) - edgez * dy1 ;

	clc 
	lda _edgex
	adc _edgey 
	sta op2 

	lda _dy2 
	sta op1 
	lda #0 
	sta op1+1 
	sta op2+1 
	jsr mul16i 
	stx tmp1 

	clc 
	lda _y0 
	adc tmp1 
	sta tmp0 

	lda _edgez 
	sta op1 
	lda _dy1 
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

.byt 32
_zstring
.byt 32,32,32,32,32,32,32,32
.byt 0

_build_zstring
.(

	lda #<(_zstring-1)
	sta tmp0
	lda #>(_zstring-1)
	sta tmp0+1
	ldy #9
	lda #0
	sta (tmp0),y
	
	lda _zmask
	sta tmp1
	ldy #8

boucle
	lsr tmp1
	bcs set1
	lda #48
	jmp affich
set1
	lda #49
affich
	sta (tmp0),y
	dey
	bne boucle

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