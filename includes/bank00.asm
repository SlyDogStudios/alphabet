.segment "BANK00"
reset0:
	.include "includes\reset.asm"

attrib_addy_lo:
	.byte $c9,$ca,$cb,$cc,$cd,$ce
	.byte $d1,$d2,$d3,$d4,$d5,$d6
	.byte $d9,$da,$db,$dc,$dd,$de
	.byte $e1,$e2,$e3,$e4,$e5,$e6
	.byte $e9,$ea

nmi0:
	.include "includes\nmi.asm"
irq0:	rti

.segment "ADDYS0"
cursor_y:
	.byte $1e,$1e,$1e,$1e,$1e,$1e
	.byte $3e,$3e,$3e,$3e,$3e,$3e
	.byte $5e,$5e,$5e,$5e,$5e,$5e
	.byte $7e,$7e,$7e,$7e,$7e,$7e
	.byte $9e,$9e
cursor_x:
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e
letter_addy:
	.byte $00,$13,$25,$43,$55,$66
	.byte $76,$8a,$a5,$bd,$d3,$e8
	.byte $00,$15,$29,$46,$5a,$70
	.byte $84,$a0,$b4,$ce,$de,$00
	.byte $1e,$3a
letter_length:
	.byte $4a,$44,$77,$46,$43,$3e
	.byte $4c,$6a,$5e,$54,$52,$52
	.byte $52,$4d,$70,$4f,$56,$4d
	.byte $6c,$4c,$66,$3f,$71,$77
	.byte $6d,$5f
letter_bank:
	.byte $00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$02
	.byte $02,$02
.segment "SPR_PAL0"
the_sprites:
	.byte $1e,$15,$00,$1e
	.byte $1e,$15,$40,$2a
	.byte $31,$15,$80,$1e
	.byte $31,$15,$c0,$2a
palette:
	.byte $0f,$19,$29,$00, $0f,$21,$31,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
	.byte $0f,$30,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00, $0f,$00,$00,$00
.segment "nt0"
nt:
	.incbin "gfx\alphabet.nam"
.segment "CHR0"
gfx:
	.incbin "gfx\alphabet.chr"
	.incbin "gfx\alphabet.chr"


.segment "SAMPLES0"
.align 64
letter_a:
	.include "includes\letters\letter_a.asm"
.align 64
letter_b:
	.include "includes\letters\letter_b.asm"
.align 64
letter_c:
	.include "includes\letters\letter_c.asm"
.align 64
letter_d:
	.include "includes\letters\letter_d.asm"
.align 64
letter_e:
	.include "includes\letters\letter_e.asm"
.align 64
letter_f:
	.include "includes\letters\letter_f.asm"
.align 64
letter_g:
	.include "includes\letters\letter_g.asm"
.align 64
letter_h:
	.include "includes\letters\letter_h.asm"
.align 64
letter_i:
	.include "includes\letters\letter_i.asm"
.align 64
letter_j:
	.include "includes\letters\letter_j.asm"
.align 64
letter_k:
	.include "includes\letters\letter_k.asm"
.align 64
letter_l:
	.include "includes\letters\letter_l.asm"


.segment "VECTORS0"
	.addr nmi0
	.addr reset0
	.addr irq0
