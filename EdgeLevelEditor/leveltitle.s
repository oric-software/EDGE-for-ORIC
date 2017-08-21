
_Edgetitlecopy
.(

	
	ldy #2
	lda (sp),y
	sta tmp6
	iny
	lda (sp),y
	sta tmp6+1
	
	ldy #0
	lda (sp),y
	
	tay
	
	lda EdgetitleAdressLow,y
	sta tmp0
	lda EdgetitleAdressHigh,y
	sta tmp0+1
	
	ldy #18
boucle
	lda (tmp6),y
	sta (tmp0),y
	dey
	bne boucle
	lda (tmp6),y
	sta (tmp0),y
	rts
.)

_Edgetitleprint
.(
	ldy #0
	lda (sp),y
	sta tmp6
	
	ldy #2
	lda (sp),y
	sta tmp7
	
	ldy tmp7
	
	lda EdgetitleAdressLow,y
	sta tmp0
	lda EdgetitleAdressHigh,y
	sta tmp0+1
	
	lda #0
	sta tmp2
	
boucle0

	ldy #0
	lda ScreenAdressLow,y
	clc
	adc tmp6
	adc tmp2
	sta tmp1
	lda ScreenAdressHigh,y
	adc #0
	sta tmp1+1
	
	lda tmp2
	tay
	lda (tmp0),y
	sta tmp3
	cmp #0
	bne suite1
	jmp fin
suite1
	cmp #08
	bcc suite2
	jmp suite3
suite2
	lda tmp3
	ldx #8
	ldy #0
boucle3
	lda tmp3
	sta (tmp1),y
	
	lda tmp1
	clc
	adc #40
	sta tmp1
	lda tmp1+1
	adc #0
	sta tmp1+1

	dex
	bne boucle3
	jmp suite4
suite3
	lda #0
	sta tmp3+1
	clc
	asl tmp3
	rol tmp3+1
	clc
	asl tmp3
	rol tmp3+1
	clc
	asl tmp3
	rol tmp3+1
	lda #$98
	clc
	adc tmp3+1
	sta tmp3+1
	ldx #8
	ldy #0
boucle1
	lda (tmp3),y
	clc
	adc #64
	sta (tmp1),y
	
	lda tmp1
	clc
	adc #40
	sta tmp1
	lda tmp1+1
	adc #0
	sta tmp1+1
	
	lda tmp3
	clc
	adc #1
	sta tmp3
	lda tmp3+1
	adc #0
	sta tmp3+1

	dex
	bne boucle1
suite4
	inc tmp2
	jmp boucle0
fin
	rts
.)