
	sei
	ldx #$00
	stx $4015
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx $2001

:	lda #$00
	sta $000, x
	sta $100, x
	sta $300, x
	sta $400, x
	sta $500, x
	sta $600, x
	sta $700, x
	lda #$f7
	sta $200, x
	inx
	bne :-

:	bit $2002
	bpl :-

	lda #$00
	sta alpha_offset
	ldx alpha_offset
	lda letter_bank, x
	sta letter_bank, x

	ldx #32      ;; number of 256-byte pages to copy
	lda #<gfx  ;; load the source address into a pointer in zero page
	sta pt
	lda #>gfx
	sta pt+1
	ldy #0       ;; starting index into the first page
	sty $2006
	sty $2006
:	lda (pt),y  ;; copy one byte
	sta $2007
	iny
	bne :-  ;; repeat until we finish the page
	inc pt+1  ;; go to the next page
	dex
	bne :-  ;; repeat until we've copied enough pages


	ldy #$00						; Load the title screen
	ldx #$04						;
	lda #<nt						;
	sta pt							;
	lda #>nt						;
	sta pt+1						;
	lda #$20						;
	sta $2006						;
	lda #$00						;
	sta $2006						;
:	lda (pt),y						;
	sta $2007						;
	iny								;
	bne :-							;
		inc pt+1					;
		dex							;
		bne :-						;


	ldx #$00						; Pull in bytes for sprites and their
:	lda the_sprites, x				;  attributes which are stored in the
	sta tl, x						;  'the_sprites' table. Use X as an index
	inx								;  to load and store each byte, which
	cpx #16							;  get stored starting in $200, where
	bne :-							;  'tl' is located at.

:	bit $2002
	bpl :-

	lda #$3f
	sta $2006
	ldx #$00
	stx $2006
:	lda palette,x
	sta $2007
	inx
	cpx #32
	bne :-

	lda #$00
	sta $2006
	sta $2006
	sta $2005
	sta $2005

	lda #%10000000
;         ||||||||
;         ||||||++- Base nametable address
;         ||||||     (0 = $2000; 1 = $2400; 2 = $2800; 3 = $2C00)
;         |||||+--- VRAM address increment per CPU read/write of PPUDATA
;         |||||      (0: add 1, going across; 1: add 32, going down)
;         ||||+---- Sprite pattern table address for 8x8 sprites
;         ||||       (0: $0000; 1: $1000; ignored in 8x16 mode)
;         |||+----- Background pattern table address (0: $0000; 1: $1000)
;         ||+------ Sprite size (0: 8x8; 1: 8x16)
;         |+------- PPU master/slave select
;         |          (0: read backdrop from EXT pins; 1: output color on EXT pins)
;         +-------- Generate an NMI at the start of the
;                    vertical blanking interval (0: off; 1: on)
	sta $2000
	lda #%00011000
;         ||||||||
;         |||||||+- Grayscale (0: normal color; 1: produce a monochrome display)
;         ||||||+-- 1: Show background in leftmost 8 pixels of screen; 0: Hide
;         |||||+--- 1: Show sprites in leftmost 8 pixels of screen; 0: Hide
;         ||||+---- 1: Show background
;         |||+----- 1: Show sprites
;         ||+------ Intensify reds (and darken other colors)
;         |+------- Intensify greens (and darken other colors)
;         +-------- Intensify blues (and darken other colors)
	sta $2001



:	lda no_control
	bne :+++
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq :+
		lda #$01
		sta no_control
		sta play_sound
:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq :+
		lda alpha_offset
		sec
		sbc #$01
		sta alpha_offset
:	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq :+
		lda alpha_offset
		clc
		adc #$01
		sta alpha_offset
:
	lda play_sound
	beq :+
		dec play_sound
		ldx alpha_offset
		stx color_switch
		lda letter_bank, x
		sta letter_bank, x
		lda #$0f
		sta $4010
		lda letter_addy, x
		sta $4012
		lda letter_length, x
		sta $4013
		lda #$10
		sta $4015
		lda #$01
		sta no_control

:
	lda alpha_offset
	cmp #26
	bne :+
		lda #0
		sta alpha_offset
		beq :++
:
	cmp #$ff
	bne :+
		lda #25
		sta alpha_offset
:	tax
	lda cursor_y, x
	sta tl
	lda cursor_x, x
	sta tl+3

	lda tl
	sta tr
	clc
	adc #19
	sta bl
	sta br
	lda tl+3
	sta bl+3
	clc
	adc #12
	sta tr+3
	sta br+3

	lda nmi_num						; Wait for an NMI to happen before running
:	cmp nmi_num						; the main loop again
	beq :-							;

	jmp :--------




