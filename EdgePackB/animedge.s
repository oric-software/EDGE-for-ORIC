
animcolors
.byt  0
.byt  3
.byt  6
.byt  2
.byt  5
.byt  1
.byt  4

flaganim
.byt 0

_animate
.(
	sei
	
	ldy #58
	
boucle0
	tya
	tax
	lda ScreenAdressLow,y
	sta tmp3
	lda ScreenAdressHigh,y
	sta tmp3+1
	iny
	lda ScreenAdressLow,y
	sta tmp2
	lda ScreenAdressHigh,y
	sta tmp2+1
	ldy #0
	lda (tmp2),y
	sta (tmp3),y
	txa
	tay
	iny
	cpy #58+113
	bne boucle0
	ldx flaganim
	cpx #0
	bne suite1
	lda ScreenAdressLow,y
	sta tmp3
	lda ScreenAdressHigh,y
	sta tmp3+1
	ldy #0
	lda (tmp3),y
	tay
	lda animcolors,y
	ldy #0
	sta (tmp3),y
	lda #1
	sta flaganim
	cli
	rts
suite1
	lda #0
	sta flaganim
	cli
	rts
	
.)


_inittitle
.(
	sei
	
	ldy #58
	lda ScreenAdressLow,y
	sta tmp3
	lda ScreenAdressHigh,y
	sta tmp3+1

	lda #<TitleAdress
	sta tmp4
	lda #>TitleAdress
	sta tmp4+1

	ldx #114
boucle1
	ldy #5
boucle0
	dey
	lda (tmp4),y
	sta (tmp3),y
	tya
	bne boucle0
	ldy #6
	lda #7
	sta (tmp3),y
	lda tmp3
	clc
	adc #40
	sta tmp3
	lda tmp3+1
	adc #0
	sta tmp3+1
	lda tmp4
	clc
	adc #7
	sta tmp4
	lda tmp4+1
	adc #0
	sta tmp4+1
	dex
	bne boucle1
	cli
	rts
.)

