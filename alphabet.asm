.include "includes\constants.asm"

.segment "ZEROPAGE"
.include "includes\zp.asm"

.include "includes\bank00.asm"		; A - L
.include "includes\bank01.asm"		; M - W
.include "includes\bank02.asm"		; X - Z
.include "includes\bank03.asm"		;

; All banks include the chr, nametable,
;  reset, nmi, vectors and general data
