;*****************************************************************
; clear_nametable: clears the entire nametable A ($2000) and its
;   corresponding attribute table on the NES PPU
; 
;   Operation:
;     - Resets the PPU address latch by reading PPU_STATUS
;     - Sets the PPU address to $2000 (start of nametable A)
;     - Writes 0s to all 960 bytes of nametable data (32x30 tiles)
;     - Writes 0s to all 64 bytes of the attribute table
;     - Leaves the PPU ready to receive further data if needed
;*****************************************************************
.proc clear_nametable
 	lda PPU_STATUS ; reset address latch
 	lda #$20 ; set PPU address to $2000
 	sta PPU_ADDR
 	lda #$00
 	sta PPU_ADDR

 	; empty nametable A
 	lda #0
 	ldy #DISPLAY_SCREEN_HEIGHT ; clear 30 rows
 	rowloop:
 		ldx #DISPLAY_SCREEN_WIDTH ; 32 columns
 		columnloop:
 			sta PPU_DATA
 			dex
 			bne columnloop
 		dey
 		bne rowloop

 	; empty attribute table
 	ldx #64 ; attribute table is 64 bytes
 	loop:
 		sta PPU_DATA
 		dex
 		bne loop

 	rts
.endproc



