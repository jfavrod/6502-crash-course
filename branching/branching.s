.export Main
.segment "CODE"

.proc Main
  ; Initialize Health, Damage, and the Return Value
  lda #25
  sta $00 ; health
  lda #30
  sta $01 ; damage
  lda #0
  sta $02 ; return

  lda $01
  cmp $00 ; compare's what's in the A register (damage)
          ; to what's in the given memory location (health).
          ; if A >= $00, the carry flag will be true
          ; otherwise, the carry flag will be clear (i.e. false)
  bcc not_lethal ; if carry flag is clear, goto label

  ; Set return value to "1" to indicate the player has died.
  lda #1
  sta $02

; Label
not_lethal:
  rts
.endproc