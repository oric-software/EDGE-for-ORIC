
#define dx1		#0
#define dx2		#2
#define dy1		#12
#define dy2		#6
#define x0		#22
#define y0		#90
#define SPR0	#0


zzx0 .byt 0
zzy0 .byt 0
zza  .byt 0

cubemask  .byt 0


_PGS_cube
.(
	lda SPR0
	sta numspr
	ldy #0
	lda (sp),y
	tax
	lda _EdgemapAdressLow,x
	sta tmpEdge+1
	lda _EdgemapAdressHigh,x
	sta tmpEdge+2
	
	ldy #2
	lda (sp),y
	sta cubemask
	
	lda y0
	sta zzy0
	sta tmp6
	sta tmp7
	lda x0
	sta zzx0
	sta tmp4
	sta tmp5
	
	
	lda #8
	sta tmp1
boucle1	
	lda #8
	sta tmp0
boucle2
tmpEdge
	lda $1234
	and cubemask
	sta tmp3
	lda #8
	sta tmp2
	lda tmp5
	sta op1
boucle3
	lsr tmp3
	bcc no_cube
	lda tmp7
	sta op2
	jsr PGS_puttile
no_cube
	clc
	lda tmp7
	sec
	sbc dy1
	sta tmp7
	dec tmp2
	bne boucle3
	inc tmp4
	inc tmp4
	lda tmp4
	sta tmp5
	lda tmp6
	clc
	adc dy2
	sta tmp6
	sta tmp7
	inc tmpEdge+1
	dec tmp0
	beq suite2
	jmp boucle2
suite2
	lda zzx0
	sec
	sbc dx2
	sta zzx0
	sta tmp4
	sta tmp5
	lda zzy0
	clc
	adc dy2
	sta zzy0
	sta tmp6
	sta tmp7
	dec tmp1
	beq suite1
	jmp boucle1
suite1
	rts
.)