
.export Main
.segment "CODE"

.proc Main
  ldx #$B2
  stx $00

  ldx #$F5
  stx $01

  lda $00
  clc
  adc $01

  sta $02

  lda #0
  adc #0
  sta $03

  rts
.endproc  
