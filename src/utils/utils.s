;*****************************************************************
; ppu_update: waits until next NMI, turns rendering on (if not already), uploads OAM, palette, and nametable update to PPU
;*****************************************************************
.proc ppu_update
	lda #1
	sta nmi_ready
	loop:
		lda nmi_ready
		bne loop
	rts
.endproc

;*****************************************************************
; ppu_off: waits until next NMI, turns rendering off (now safe to write PPU directly via PPU_DATA)
;*****************************************************************
.proc ppu_off
	lda #2
	sta nmi_ready
	loop:
		lda nmi_ready
		bne loop
	rts
.endproc

;*****************************************************************
; increment_zp_16: adds a value to a 16-bit zero page address
;   Parameters:
;     amount      - constant to add to the 16-bit value
;     address_lo  - label for the low byte of the 16-bit value
;     address_hi  - label for the high byte of the 16-bit value
;   Operation:
;     Adds `amount` to address_lo, carrying into address_hi if needed
;*****************************************************************
.macro increment_zp_16 amount, address_lo, address_hi
	lda address_lo
	clc
	adc amount
	sta address_lo

	bcc :+

	inc address_hi

	:
.endmacro

;*****************************************************************
; decrement_zp_16: subtracts a value from a 16-bit zero page address
;   Parameters:
;     amount      - constant to subtract from the 16-bit value
;     address_lo  - label for the low byte of the 16-bit value
;     address_hi  - label for the high byte of the 16-bit value
;   Operation:
;     Subtracts `amount` from address_lo, borrowing from address_hi if needed
;*****************************************************************
.macro decrement_zp_16 amount, address_lo, address_hi
	lda address_lo
	sec
	sbc amount
	sta address_lo

	bcs :+

	dec address_hi

	:
.endmacro

