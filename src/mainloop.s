mainloop:
 	; skip reading controls if and change has not been drawn
 	lda nmi_ready
 	cmp #0
 	bne mainloop
 	; read the gamepad (updates current_input, input_pressed_this_frame and input_released_this_frame )
 	jsr poll_gamepad
	jsr handle_input



 	; ensure our changes are rendered
 	lda #1
 	sta nmi_ready
 	jmp mainloop


