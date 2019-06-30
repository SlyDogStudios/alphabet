	pha
	txa
	pha
	tya
	pha
	inc nmi_num

	lda #$00
	sta $2003
	lda #$02
	sta $4014

	lda $4015
	and #$10
	beq :+
		ldx color_switch
		lda #$23
		sta $2006
		lda attrib_addy_lo, x
		sta $2006
		lda #$55
		sta $2007
		jmp :++
:	ldx color_switch
	lda #$23
	sta $2006
	lda attrib_addy_lo, x
	sta $2006
	lda #$00
	sta $2007
	lda #$00
	sta no_control
:

	lda #$01
	sta $4016
	lda #$00
	sta $4016
	lda control_pad
	sta control_old
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad
	dex
	bne :-

	lda #$00
	sta $2006
	sta $2006
	sta $2005
	sta $2005
	pla
	tay
	pla
	tax
	pla

;	lda #$0f						; Jeremiah saying "Choose a slot!"
;	sta $4010
;	lda #$3f
;	sta $4011
;    lda #$a4
;	sta $4012
;	lda #$8f
;	sta $4013
;	lda #$0f
;	sta $4015
;	lda #$1f
;	sta $4015



