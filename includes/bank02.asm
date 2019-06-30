.segment "BANK02"
reset2:
	.include "includes\reset.asm"

;attrib_addy_lo:
	.byte $c9,$ca,$cb,$cc,$cd,$ce
	.byte $d1,$d2,$d3,$d4,$d5,$d6
	.byte $d9,$da,$db,$dc,$dd,$de
	.byte $e1,$e2,$e3,$e4,$e5,$e6
	.byte $e9,$ea

nmi2:
	.include "includes\nmi.asm"
irq2:	rti

.segment "ADDYS2"
;cursor_y:
	.byte $1e,$1e,$1e,$1e,$1e,$1e
	.byte $3e,$3e,$3e,$3e,$3e,$3e
	.byte $5e,$5e,$5e,$5e,$5e,$5e
	.byte $7e,$7e,$7e,$7e,$7e,$7e
	.byte $9e,$9e
;cursor_x:
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e
;letter_addy:
	.byte $00,$13,$25,$43,$55,$66
	.byte $76,$8a,$a5,$bd,$d3,$e8
	.byte $00,$15,$29,$46,$5a,$70
	.byte $84,$a0,$b4,$ce,$de,$00
	.byte $1e,$3a
;letter_length:
	.byte $4a,$44,$77,$46,$43,$3e
	.byte $4c,$6a,$5e,$54,$52,$52
	.byte $52,$4d,$70,$4f,$56,$4d
	.byte $6c,$4c,$66,$3f,$71,$77
	.byte $6d,$5f
;letter_bank:
	.byte $00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$02
	.byte $02,$02
.segment "SPR_PAL2"

	.byte $1e,$15,$00,$1e
	.byte $1e,$15,$40,$2a
	.byte $31,$15,$80,$1e
	.byte $31,$15,$c0,$2a

	.byte $0f,$19,$29,$00, $0f,$21,$31,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
	.byte $0f,$30,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
.segment "nt2"
	.incbin "gfx\alphabet.nam"
.segment "CHR2"
	.incbin "gfx\alphabet.chr"
	.incbin "gfx\alphabet.chr"

.segment "SAMPLES2"
.align 64
letter_x:
	.include "includes\letters\letter_x.asm"
.align 64
letter_y:
	.include "includes\letters\letter_y.asm"
.align 64
letter_z:
	.include "includes\letters\letter_z.asm"

.segment "VECTORS2"
	.addr nmi2
	.addr reset2
	.addr irq2
