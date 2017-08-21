
_CharsetEDGE

.byt 0
.byt 0
.byt 62
.byt 2
.byt 62
.byt 34
.byt 62
.byt 0

.byt 32
.byt 32
.byt 62
.byt 34
.byt 34
.byt 34
.byt 62
.byt 0

.byt 0
.byt 0
.byt 62
.byt 32
.byt 32
.byt 32
.byt 62
.byt 0

.byt 2
.byt 2
.byt 62
.byt 34
.byt 34
.byt 34
.byt 62
.byt 0

.byt 0
.byt 0
.byt 62
.byt 34
.byt 62
.byt 32
.byt 62
.byt 0

.byt 62
.byt 32
.byt 62
.byt 32
.byt 32
.byt 32
.byt 32
.byt 0

.byt 0
.byt 0
.byt 62
.byt 34
.byt 34
.byt 62
.byt 2
.byt 62

.byt 32
.byt 32
.byt 62
.byt 34
.byt 34
.byt 34
.byt 34
.byt 0

.byt 8
.byt 0
.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 0

.byt 0
.byt 0
.byt 4
.byt 4
.byt 4
.byt 36
.byt 60
.byt 0

.byt 32
.byt 32
.byt 34
.byt 36
.byt 56
.byt 36
.byt 34
.byt 0

.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 0

.byt 0
.byt 0
.byt 62
.byt 42
.byt 42
.byt 42
.byt 42
.byt 0

.byt 0
.byt 0
.byt 62
.byt 34
.byt 34
.byt 34
.byt 34
.byt 0

.byt 0
.byt 0
.byt 62
.byt 34
.byt 34
.byt 34
.byt 62
.byt 0

.byt 0
.byt 0
.byt 62
.byt 34
.byt 34
.byt 62
.byt 32
.byt 32

.byt 0
.byt 0
.byt 62
.byt 34
.byt 34
.byt 62
.byt 2
.byt 2

.byt 0
.byt 0
.byt 62
.byt 32
.byt 32
.byt 32
.byt 32
.byt 0

.byt 0
.byt 0
.byt 62
.byt 32
.byt 62
.byt 2
.byt 62
.byt 0

.byt 32
.byt 32
.byt 62
.byt 32
.byt 32
.byt 32
.byt 30
.byt 0

.byt 0
.byt 0
.byt 34
.byt 34
.byt 34
.byt 34
.byt 62
.byt 0

.byt 0
.byt 0
.byt 34
.byt 34
.byt 34
.byt 20
.byt 28
.byt 0

.byt 0
.byt 0
.byt 42
.byt 42
.byt 42
.byt 42
.byt 62
.byt 0

.byt 0
.byt 0
.byt 34
.byt 20
.byt 8
.byt 20
.byt 34
.byt 0

.byt 0
.byt 0
.byt 34
.byt 34
.byt 34
.byt 62
.byt 2
.byt 62

.byt 0
.byt 0
.byt 62
.byt 2
.byt 28
.byt 32
.byt 62
.byt 0

.byt 63,32,32,32

_charset_chiffres

.byt 62
.byt 34
.byt 34
.byt 34
.byt 34
.byt 34
.byt 62
.byt 0

.byt 24
.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 8
.byt 0

.byt 62
.byt 2
.byt 2
.byt 62
.byt 32
.byt 32
.byt 62
.byt 0

.byt 62
.byt 2
.byt 2
.byt 62
.byt 2
.byt 2
.byt 62
.byt 0

.byt 34
.byt 34
.byt 34
.byt 62
.byt 2
.byt 2
.byt 2
.byt 0

.byt 62
.byt 32
.byt 32
.byt 62
.byt 2
.byt 2
.byt 62
.byt 0

.byt 62
.byt 32
.byt 32
.byt 62
.byt 34
.byt 34
.byt 62
.byt 0

.byt 62
.byt 2
.byt 2
.byt 4
.byt 8
.byt 8
.byt 8
.byt 0

.byt 62
.byt 34
.byt 34
.byt 62
.byt 34
.byt 34
.byt 62
.byt 0

.byt 62
.byt 34
.byt 34
.byt 62
.byt 2
.byt 2
.byt 62
.byt 0



_PGS_definechar
.(
	ldy #26*8+1
	
	lda #$08
	sta tmp0
	lda #$9A
	sta tmp0+1
	
boucle0
	dey
	lda _CharsetEDGE,y
	sta (tmp0),y
	tya
	bne boucle0
	
	
	ldy #13*8+1
	
	lda #$08
	sta tmp0
	lda #$9B
	sta tmp0+1
	
boucle1
	dey
	lda _charset_touches,y
	sta (tmp0),y
	tya
	bne boucle1
	
		
	ldy #10*8+1
	
	lda #$80
	sta tmp0
	lda #$99
	sta tmp0+1
	
boucle2
	dey
	lda _charset_chiffres,y
	sta (tmp0),y
	tya
	bne boucle2
	rts
.)