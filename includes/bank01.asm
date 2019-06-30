.segment "BANK01"
reset1:
	.include "includes\reset.asm"

;attrib_addy_lo:
	.byte $c9,$ca,$cb,$cc,$cd,$ce
	.byte $d1,$d2,$d3,$d4,$d5,$d6
	.byte $d9,$da,$db,$dc,$dd,$de
	.byte $e1,$e2,$e3,$e4,$e5,$e6
	.byte $e9,$ea

nmi1:
	.include "includes\nmi.asm"
irq1:	rti

.segment "ADDYS1"
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
.segment "SPR_PAL1"

	.byte $1e,$15,$00,$1e
	.byte $1e,$15,$40,$2a
	.byte $31,$15,$80,$1e
	.byte $31,$15,$c0,$2a

	.byte $0f,$19,$29,$00, $0f,$21,$31,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
	.byte $0f,$30,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
.segment "nt1"
	.incbin "gfx\alphabet.nam"
.segment "CHR1"
	.incbin "gfx\alphabet.chr"
	.incbin "gfx\alphabet.chr"

.segment "SAMPLES1"
.align 64
letter_m:
	.include "includes\letters\letter_m.asm"
.align 64
letter_n:
	.include "includes\letters\letter_n.asm"
.align 64
letter_o:
	.include "includes\letters\letter_o.asm"
.align 64
letter_p:
	.include "includes\letters\letter_p.asm"
.align 64
letter_q:
	.include "includes\letters\letter_q.asm"
.align 64
letter_r:
	.include "includes\letters\letter_r.asm"
.align 64
letter_s:
	.include "includes\letters\letter_s.asm"
.align 64
letter_t:
	.include "includes\letters\letter_t.asm"
.align 64
letter_u:
	.include "includes\letters\letter_u.asm"
.align 64
letter_v:
	.include "includes\letters\letter_v.asm"
.align 64
letter_w:
	.include "includes\letters\letter_w.asm"

.segment "VECTORS1"
	.addr nmi1
	.addr reset1
	.addr irq1
