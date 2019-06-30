letter_addy:
	.byte $00,$10,$20,$30,$50,$60,$70
	.byte $80,$90,$a0,$b0,$c0,$d0,$e0
	.byte $00,$10,$20,$30,$40,$50,$60
	.byte $70,$80,$90,$a0,$b0	
letter_length:
	.byte $4a,$44,$77,$46,$43,$3e,$4c
	.byte $6a,$5e,$54,$52,$52,$52,$4d
	.byte $70,$4f,$56,$4d,$6c,$4c,$66
	.byte $3f,$71,$77,$6d,$5f
letter_bank:
	.byte $00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$03,$03,$03

cursor_y:
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e,$5e,$7e,$9e,$be
	.byte $1e,$3e
cursor_x:
	.byte $1e,$1e,$1e,$1e,$1e,$1e
	.byte $3e,$3e,$3e,$3e,$3e,$3e
	.byte $5e,$5e,$5e,$5e,$5e,$5e
	.byte $7e,$7e,$7e,$7e,$7e,$7e
	.byte $9e,$9e

letter_length_lo:
	.byte $a1,       $41,       $71,       $61,       $31,       $e1,       $c1
	.byte $a1,       $e1,       $41,       $21,       $21,       $21,       $d1
	.byte $01,       $f1,       $61,       $d1,       $c1,       $c1,       $61
	.byte $f1,       $11,       $71,       $d1,       $f1
letter_length_hi:
	.byte $04,       $04,       $07,       $04,       $04,       $03,       $04
	.byte $06,       $05,       $05,       $05,       $05,       $05,       $04
	.byte $07,       $04,       $05,       $04,       $06,       $04,       $06
	.byte $03,       $07,       $07,       $06,       $05
