
.dsb 256-(*&255)

PGS_mask  .dsb 140
PGS_maskx .byt 4
PGS_masky .byt 24

tmpA	.dsb 1
zoneA	.dsb 1

triangle1
.byt 0, 1
.byt 0, 7
.byt 0, 31
.byt 1, 63
.byt 7, 63
.byt 31, 63
.byt 31, 63
.byt 7, 63
.byt 1, 63
.byt 0, 31
.byt 0, 7
.byt 0, 1

triangle2
.byt 32, 0
.byt 56, 0 
.byt 62, 0 
.byt 63, 32
.byt 63, 56
.byt 63, 62
.byt 63, 62
.byt 63, 56
.byt 63, 32
.byt 62, 0 
.byt 56, 0 
.byt 32, 0 

_specialmask
.(
	ldx #140
	lda #0
boucle1
	sta PGS_mask,x
	dex
	bne boucle1
	
	lda zoneA
	bne suite1
	rts
suite1
	sta tmpA

	
	lsr tmpA
	bcc suite2
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoint+2
	lda #<PGS_mask+2
	sta PGS_maskpoint+1
boucle3
	ldy #2
boucle2
	lda triangle2,x
PGS_maskpoint
	sta $1234
	inx
	inc PGS_maskpoint+1
	cpx #24
	beq suite2
	dey
	bne boucle2
	lda PGS_maskpoint+1
	clc
	adc #2
	sta PGS_maskpoint+1
	jmp boucle3
	
suite2
	lsr tmpA
	bcc suite3
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoin2+2
	sta boucle5+2
	lda #<PGS_mask+26
	sta PGS_maskpoin2+1
	sta boucle5+1
boucle4
	ldy #2
boucle5
	lda $1234
	ora triangle1,x
PGS_maskpoin2
	sta $1234
	inx
	inc boucle5+1
	inc PGS_maskpoin2+1
	cpx #24
	beq suite3
	dey
	bne boucle5
	lda PGS_maskpoin2+1
	clc
	adc #2
	sta PGS_maskpoin2+1
	sta boucle5+1
	jmp boucle4
	
suite3
	lsr tmpA
	bcc suite4
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoin3+2
	sta boucle7+2
	lda #<PGS_mask+50
	sta PGS_maskpoin3+1
	sta boucle7+1
boucle6
	ldy #2
boucle7
	lda $1234
	ora triangle2,x
PGS_maskpoin3
	sta $1234
	inx
	inc PGS_maskpoin3+1
	inc boucle7+1
	cpx #24
	beq suite4
	dey
	bne boucle7
	lda PGS_maskpoin3+1
	clc
	adc #2
	sta PGS_maskpoin3+1
	sta boucle7+1
	jmp boucle6
	
suite4
	lsr tmpA
	bcc suite5
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoin4+2
	lda #<PGS_mask+48
	sta PGS_maskpoin4+1
boucle8
	ldy #2
boucle9
	lda triangle1,x
PGS_maskpoin4
	sta $1234
	inx
	inc PGS_maskpoin4+1
	cpx #24
	beq suite5
	dey
	bne boucle9
	lda PGS_maskpoin4+1
	clc
	adc #2
	sta PGS_maskpoin4+1
	jmp boucle8
	
suite5
	lsr tmpA
	bcc suite6
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoin5+2
	sta boucle11+2
	lda #<PGS_mask+24
	sta PGS_maskpoin5+1
	sta boucle11+1
boucle10
	ldy #2
boucle11
	lda $1234
	ora triangle2,x
PGS_maskpoin5
	sta $1234
	inx
	inc PGS_maskpoin5+1
	inc boucle11+1
	cpx #24
	beq suite6
	dey
	bne boucle11
	lda PGS_maskpoin5+1
	clc
	adc #2
	sta PGS_maskpoin5+1
	sta boucle11+1
	jmp boucle10
	
suite6
	lsr tmpA
	bcc suite7
	ldx #0
	lda #>PGS_mask
	sta PGS_maskpoin6+2
	sta boucle13+2
	lda #<PGS_mask
	sta PGS_maskpoin6+1
	sta boucle13+1
boucle12
	ldy #2
boucle13
	lda $1234
	ora triangle1,x
PGS_maskpoin6
	sta $1234
	inx
	inc PGS_maskpoin6+1
	inc boucle13+1
	cpx #24
	beq suite7
	dey
	bne boucle13
	lda PGS_maskpoin6+1
	clc
	adc #2
	sta PGS_maskpoin6+1
	sta boucle13+1
	jmp boucle12
	
suite7
	rts
	
.)
	
	
_PGS_erasemask
.(

	lda #0
	sta zoneA 
	
	ldx #140
	lda #0
boucle1
	sta PGS_mask,x
	dex
	bne boucle1
	
	rts
	
.)
	
_PGS_calculesprite
.(

	lda #0
	sta zoneA 

	lda _edgex 
	sta tmp2 
	lda _edgey 
	sta tmp3 
	lda _edgez 
	sta tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq1
	lda #63
	sta zoneA
	jmp caletiq8
	
caletiq1
	
	ldx _edgex 
	inx
	stx tmp2 
	ldx _edgey 
	stx tmp3 
	ldx _edgez 
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq2
	lda zoneA
	ora #%00011000
	sta zoneA
	
caletiq2
	ldx _edgex 
	stx tmp2 
	ldx _edgey 
	inx
	stx tmp3 
	ldx _edgez 
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq3
	lda zoneA
	ora #%00000110
	sta zoneA
	
caletiq3
	ldx _edgex 
	stx tmp2 
	ldx _edgey 
	stx tmp3 
	ldx _edgez 
	inx
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq4
	lda zoneA
	ora #%00100001
	sta zoneA
	
caletiq4
	ldx _edgex 
	inx
	stx tmp2 
	ldx _edgey 
	inx
	stx tmp3 
	ldx _edgez 
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq5
	lda zoneA
	ora #%00001100
	sta zoneA
	
caletiq5
	ldx _edgex 
	inx
	stx tmp2 
	ldx _edgey 
	inx
	stx tmp3 
	ldx _edgez 
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq6
	lda zoneA
	ora #%00001100
	sta zoneA
	
caletiq6
	ldx _edgex 
	inx
	stx tmp2 
	ldx _edgey 
	stx tmp3 
	ldx _edgez 
	inx
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq7
	lda zoneA
	ora #%00110000
	sta zoneA
	
caletiq7
	ldx _edgex 
	stx tmp2 
	ldx _edgey 
	inx
	stx tmp3 
	ldx _edgez 
	inx
	stx tmp4 
	jsr subcalsprite
	lda tmp0
	beq caletiq8
	lda zoneA
	ora #%00000011
	sta zoneA

caletiq8
	ldy #0 
	lda (ap),y
	sta (sp),y 
	iny 
	lda #0 
	sta (sp),y 

	iny
	jmp _specialmask 

.)


subcalsprite
.(
	lda #0
	sta tmp0
	
caletiq1
	lda tmp2
	cmp _Edgesize
.(	
	bcc skip
	jmp caletiq3
skip
.)
	lda tmp3
	cmp _Edgesize
.(	
	bcc skip
	jmp caletiq3
skip
.)
	lda tmp4
	cmp _Edgesize
.(	
	bcc skip
	jmp caletiq3
skip
.)
	lda tmp2 
	asl
	asl
	asl 

	clc
	adc tmp3 
	
	adc _currentEdge 
	sta tmp1 
	lda _currentEdge+1 
	adc #0
	sta tmp1+1 

	ldy #0
	lda (tmp1),y
	sta (sp),y 
	iny 
	lda #0  
	sta (sp),y 

	lda tmp4 
	iny
	sta (sp),y 
	iny
	lda #0 
	sta (sp),y 

	ldy #4 
	jsr _testbit 
	cpx #1
	bne caletiq2
	
	lda #1 
	sta tmp0 

	jmp caletiq3

caletiq2
	inc tmp2 
	inc tmp3 
	inc tmp4 
	jmp caletiq1
caletiq3
	rts

.)

