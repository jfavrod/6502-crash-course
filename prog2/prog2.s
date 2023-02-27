.export Main
.segment "CODE"

.proc Main
  ldx #10
  stx $00
  stx $01

  inc $00
  dec $01

  ldx $00
  stx $0300
  ldx $01
  stx $0301

  rts
.endproc
