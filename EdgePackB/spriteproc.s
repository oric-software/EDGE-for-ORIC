;;;;====== MODULE DE MANIPULATION DES SPRITES


	.zero

	*= $30
	
PGS_SCWORK .dsb 2
PGS_SCWA .dsb 2
PGS_SCWB .dsb 2
PGS_C .dsb 2
tmpT .dsb 2
tmpS .dsb 2
tmpM .dsb 2
tmpMask .dsb 2
tmpL .dsb 1
numspr .dsb 1

	.text

tmpTX .dsb 1
tmpTY .dsb 1
tmpTH .dsb 1
tmpTL .dsb 1
tmpCL .dsb 1
tmpHY .dsb 1
tmpCTX .dsb 1
tmpCTY .dsb 1

;Sauvegarde de la zone complète d affichage des sprites
gloTX1 .dsb 1
gloTX2 .dsb 1
gloTY1 .dsb 1
gloTY2 .dsb 1 
gloST  .dsb 1

_PGS_initsprite
PGS_initsprite
.(
	lda #41
	sta gloTX1
	lda #0
	sta gloTX2
	lda #201
	sta gloTY1
	lda #0
	sta gloTY2
	lda #0
	sta gloST
	
	rts
.)

_PGS_putspriteref
.(
	jsr PGS_putsprite
	jsr _PGS_refreshscr
	rts
.)
	
_PGS_putsprite
PGS_putsprite
.(
	sei
	jsr PGS_getargs
	jsr PGS_affectvars
	jsr PGS_calcpos
	jsr PGS_preptmpvar
	
	jsr PGS_calcdest
	ldx tmp
	lda #1
	sta PGS_STATUT,x
	lda numspr
	sta PGS_N,x
	
	lda #1
	sta gloST
	cli
	rts
.)
PGS_getargs
.(
	ldy #0
	lda (sp),y
	sta tmp
	
	iny
	iny
	lda (sp),y
	sta numspr
	
	iny
	iny
	lda (sp),y
	sta op1

	iny
	iny
	lda (sp),y
	sta op2
	
	rts
.)

PGS_affectvars
.(
	ldx tmp
	lda PGS_STATUT,x
	beq premiere
	lda PGS_CX,x
	sta PGS_OX
	sta tmpTX
	lda PGS_CY,x
	sta PGS_OY
	sta tmpTY
	rts
premiere
	lda op1
	sta PGS_OX
	sta tmpTX
	lda op2
	sta PGS_OY
	sta tmpTY
	lda numspr
	sta PGS_N,x
	rts
.)


;
;  tmpTX = min(OX, CX)
;  tmpTL = max(x1+l1,x2+l2)-tmpTX
;

PGS_calcpos
.(
	ldx tmp
;;	PosXmin = x/6; ==> on ignore dans un premier temps : l appel se fait sur des coordonnées octet
	lda op1
	sta PGS_CX,x
	
	cmp PGS_OX
	bcs suite1     ; tentative
	sta tmpTX
	lda #0
	sta tmpCTX
	jmp suite2
suite1
	lda PGS_OX
	sta tmpTX
	lda PGS_CX,x
	sec
	sbc tmpTX
	sta tmpCTX

suite2
	lda tmpTX
	cmp gloTX1
	bcs suite8
	sta gloTX1
suite8	
	clc
	lda PGS_CX,x
	ldy numspr
	adc PGS_CL,y
	sta tmpL
	ldy PGS_N,x
	lda PGS_OX
	clc
	adc PGS_CL,y
	cmp tmpL
	bcs suite5
	lda tmpL
suite5
	cmp gloTX2
	bcc suite9
	sta gloTX2
suite9
	sec
	sbc tmpTX
	sta tmpTL
	
;;	PosYmin = y;
	ldx tmp
	lda op2
	sta PGS_CY,x
	
	cmp PGS_OY

	bcs suite3

	sta tmpTY
	lda #0
	sta tmpCTY
	jmp suite4
suite3
	lda PGS_OY
	sta tmpTY
	lda PGS_CY,x
	sec
	sbc tmpTY
	sta tmpCTY
suite4
	lda tmpTY
	cmp gloTY1
	bcs suite6
	sta gloTY1
suite6
	clc
	lda PGS_CY,x
	ldy numspr
	adc PGS_CH,y
	sta tmpL
	ldy PGS_N,x
	lda PGS_OY
	clc 
	adc PGS_CH,y
	cmp tmpL	
	bcs global6
	lda tmpL
global6
	cmp gloTY2
	bcc suite7
	sta gloTY2
suite7
	sec
	sbc tmpTY
	sta tmpTH
	
	rts
.)


PGS_preptmpvar
.(
; The Y position is in y register
	ldy op2
	lda CacheAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)

	adc op1				; Add X coordinate
	sta PGS_SCWORK
	lda CacheAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition
	sta PGS_SCWORK+1
	
;; Identification des mémoires tampon du sprite x (stocké dans tmp)	
	ldx numspr
	lda PGS_CL,x
	sta tmpCL
	lda PGS_CH,x
	sta tmpHY

	lda PGS_SPTRL,x
	sta tmpS
	sta tmpM
	lda PGS_SPTRH,x
	sta tmpS+1
	lda PGS_MPTRH,x
	sta tmpM+1
	
	
	lda #<PGS_mask
	sta tmpMask
	lda #>PGS_mask
	sta tmpMask+1
	
	rts
.)

PGS_calcdest
.(
;;; écrire le sprite sur la zone cache 
;;	boucler sur le nombre de lignes du sprite de 0 à HY
	
	ldx #0

pgetiq_boucleY2
	
;;		boucler sur le nombre de colonnes du sprite de 0 à CL

	ldy #0

pgetiq_boucleX2

	lda (tmpM),y
	ora (tmpMask),y
	and (PGS_SCWORK),y
	sta (PGS_SCWORK),y
	lda (tmpMask),y
	eor #63
	and (tmpS),y
	ora (PGS_SCWORK),y
	and #63					;;			On ecrase un éventuel code genant		
	adc #64
	sta (PGS_SCWORK),y		;;			Mettre A dans le tampon
	
	
	iny					;;			Ajouter 1 à Adresse Ecran
	cpy tmpCL
	bcc pgetiq_boucleX2		;;		fin boucle
	
	inx
	cpx tmpHY
	bcs pgetiq_finboucleY2
	
;;		Ajouter 40  à Adresse Ecran
	clc
	lda PGS_SCWORK
	adc #40
	sta PGS_SCWORK
	lda PGS_SCWORK+1
	adc #0
	sta PGS_SCWORK+1
	
;;  incrémenter aussi les compteurs de tmp
	lda tmpCL
	clc
	adc tmpS
	sta tmpS
	sta tmpM
	lda tmpCL
	clc
	adc tmpMask
	sta tmpMask
	
	jmp pgetiq_boucleY2
	
;;	fin boucle
	
pgetiq_finboucleY2

	rts
.)


_PGS_refreshscr
.(
	sei
	lda gloST
	bne suite1
	rts
suite1
	
	ldy gloTY1
	
	lda CacheAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc gloTX1			; Add X coordinate
	sta tmpT
	lda CacheAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition		
	sta tmpT+1			
	
	
	lda PictureAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc gloTX1			; Add X coordinate
	sta PGS_SCWA
	lda PictureAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition		
	sta PGS_SCWA+1			
	
	
	lda ScreenAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc gloTX1			; Add X coordinate
	sta PGS_SCWB
	lda ScreenAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition		
	sta PGS_SCWB+1			

	
	lda gloTX2
	sec
	sbc gloTX1
	sta tmpTL

	lda gloTY2
	sec
	sbc gloTY1
	sta tmpTH
	
	;;	boucler sur le nombre de lignes du sprite de 0 à tmpTH

	ldx #0

pgetiq_boucleY
	
;;		boucler sur le nombre de colonnes du sprite de 0 à tmpTL

	ldy #0

pgetiq_boucleX
	
	lda (tmpT),y
	sta (PGS_SCWB),y		;;	recopier le cache à l écran
	lda (PGS_SCWA),y
	sta (tmpT),y			;;  écraser le cache avec la "picture"

	iny						;;	Ajouter 1 à Adresse Ecran
	cpy tmpTL
	bcc pgetiq_boucleX		;;	fin boucle
	
	inx
	cpx tmpTH
	bcs pgetiq_finboucleY
	
;;		Ajouter 40  à Adresse Ecran
	lda #40
	clc
	adc PGS_SCWB
	sta PGS_SCWB
	lda PGS_SCWB+1
	adc #0
	sta PGS_SCWB+1
	
	lda #40
	clc
	adc PGS_SCWA
	sta PGS_SCWA
	lda PGS_SCWA+1
	adc #0
	sta PGS_SCWA+1
;;  incrémenter aussi les compteurs de tmp
	lda #40
	clc
	adc tmpT
	sta tmpT
	lda tmpT+1
	adc #0
	sta tmpT+1

	jmp pgetiq_boucleY
	
;;	fin boucle
	
pgetiq_finboucleY
	cli

	jmp PGS_initsprite

.)


_PGS_erasprite
.(
	sei
	
	ldy #0
	lda (sp),y
	sta tmp

	jsr PGS_affectvars
	sei
	lda PGS_OX
	sta tmpTX
	lda PGS_OY
	sta tmpTY
	
	ldx tmp
	lda PGS_N,x
	sta numspr
	tay
	
	lda PGS_CL,y
	sta tmpCL
	lda PGS_CH,y
	sta tmpHY
	
	lda tmpTX
	cmp gloTX1
	bcs suite8
	sta gloTX1
suite8	
	clc
	adc tmpCL
	cmp gloTX2
	bcc suite9
	sta gloTX2
suite9
	
;;	PosYmin = y;
	lda tmpTY
	cmp gloTY1
	bcs suite6
	sta gloTY1
suite6
	clc
	adc tmpHY
	cmp gloTY2
	bcc suite7
	sta gloTY2
suite7
	
	ldy PGS_OY
	lda CacheAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc PGS_OX				; Add X coordinate
	sta PGS_SCWA
	lda CacheAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition
	sta PGS_SCWA+1	
	
	ldy PGS_OY
	lda PictureAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc PGS_OX				; Add X coordinate
	sta PGS_C
	lda PictureAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition
	sta PGS_C+1			

;;	boucler sur le nombre de lignes du sprite de 0 à HY
	ldx numspr
	lda PGS_CL,x
	sta tmpCL
	lda PGS_CH,x
	sta tmpHY

	lda tmpHY
	adc #1
	sta tmpHY
	
	ldx #0

pgetiq_boucleY
	
;;		boucler sur le nombre de colonnes du sprite de 0 à CL

	ldy #0

pgetiq_boucleX
	
	lda (PGS_C),y
	sta (PGS_SCWA),y		;;	recopier la zone C sur l écran


	iny						;;			Ajouter 1 à Adresse Ecran
	cpy tmpCL
	bcc pgetiq_boucleX		;;		fin boucle
	
	inx
	cpx tmpHY
	bcs pgetiq_finboucleY
;;		Ajouter 40  à Adresse Ecran

	lda PGS_SCWA
	clc
	adc #40
	sta PGS_SCWA
	lda PGS_SCWA+1
	adc #0
	sta PGS_SCWA+1

;;  incrémenter aussi les compteurs de tmp
	lda #40
	clc
	adc PGS_C
	sta PGS_C
	lda #0
	adc PGS_C+1
	sta PGS_C+1

	jmp pgetiq_boucleY
	
;;	fin boucle
	
pgetiq_finboucleY

	ldx tmp
	lda #0
	sta PGS_STATUT,x
	cli
	rts
.)


_PGS_puttile

PGS_getargt
.(
	ldy #0
	lda (sp),y
	sta numspr
	
	iny
	iny
	lda (sp),y
	sta op1

	iny
	iny
	lda (sp),y
	sta op2
.)

PGS_puttile
.(
	sei
	lda op1
	sta tmpTX
	lda op2
	sta tmpTY
	
	ldy numspr
	lda PGS_CL,y
	sta tmpCL
	lda PGS_CH,y
	sta tmpHY
	
	lda tmpTX
	cmp gloTX1
	bcs suite8
	sta gloTX1
suite8	
	clc
	adc tmpCL
	cmp gloTX2
	bcc suite9
	sta gloTX2
suite9
	
;;	PosYmin = y;
	lda tmpTY
	cmp gloTY1
	bcs suite6
	sta gloTY1
suite6
	clc
	adc tmpHY
	cmp gloTY2
	bcc suite7
	sta gloTY2
suite7
	
; The Y position is in y register
	ldy tmpTY
	lda CacheAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)

	adc tmpTX				; Add X coordinate
	sta PGS_SCWORK
	lda CacheAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition
	sta PGS_SCWORK+1
	
	
	ldy tmpTY
	lda PictureAdressLow,y	; Get the LOW part of the screen adress
	clc						; Clear the carry (because we will do an addition after)
	adc tmpTX			; Add X coordinate
	sta PGS_SCWA
	lda PictureAdressHigh,y	; Get the HIGH part of the screen adress
	adc #0					; Eventually add the carry to complete the 16 bits addition		
	sta PGS_SCWA+1			

;; Identification des mémoires tampon du sprite x (stocké dans tmp)	

	ldx numspr
	lda PGS_SPTRL,x
	sta tmpS
	sta tmpM
	lda PGS_SPTRH,x
	sta tmpS+1
	lda PGS_MPTRH,x
	sta tmpM+1
	

.)

PGS_calctile
.(
;;; écrire le sprite sur la zone cache 
;;	boucler sur le nombre de lignes du sprite de 0 à HY
	
	ldx #0

pgetiq_boucleY2
	
;;		boucler sur le nombre de colonnes du sprite de 0 à CL

	ldy #0

pgetiq_boucleX2

	lda (PGS_SCWORK),y		;;	recopier la zone écran dans E
	and (tmpM),y				;;			Ajouter le Masque à A AND : A = A & M
	ora (tmpS),y				;;			Faire OR avec le sprite : A = A OR S
	and #63						;;			On ecrase un éventuel code genant		
	adc #64
	sta (PGS_SCWORK),y				;;			Mettre A dans le tampon
	sta (PGS_SCWA),y	
	
	iny					;;			Ajouter 1 à Adresse Ecran
	cpy tmpCL
	bcc pgetiq_boucleX2		;;		fin boucle
	
	inx
	cpx tmpHY
	bcs pgetiq_finboucleY2
	
;;		Ajouter 40  à Adresse Ecran
	clc
	lda PGS_SCWORK
	adc #40
	sta PGS_SCWORK
	lda PGS_SCWORK+1
	adc #0
	sta PGS_SCWORK+1
	
	clc
	lda PGS_SCWA
	adc #40
	sta PGS_SCWA
	lda PGS_SCWA+1
	adc #0
	sta PGS_SCWA+1
	
;;  incrémenter aussi les compteurs de tmp
	lda tmpCL
	clc
	adc tmpS
	sta tmpS
	sta tmpM
	
	jmp pgetiq_boucleY2
	
;;	fin boucle
	
pgetiq_finboucleY2

	lda #1
	sta gloST
	cli
	rts
.)


