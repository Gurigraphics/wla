 ;Headers
  .include "Header.inc"
  .include "Snes_Init.asm"

 ;Needed to satisfy interrupt definition in "Header.inc".
 VBlank:
   RTI

 .bank 0
 .section "MainCode"

 Start:
    ; Initialize the SNES.
    Snes_Init

    ; Set the background color to green.
    sep #$20        ; Set the A register to 8-bit.
    lda #%10000000  ; Force VBlank by turning off the screen.
    sta $2100
    lda #%11100000  ; Load the low byte of the green color.
    sta $2122
    lda #%00000000  ; Load the high byte of the green color.
    sta $2122
    lda #%00001111  ; End VBlank, setting brightness to 15 (100%).
    sta $2100


    lda #$10    ; carrega o decimal 10 no acumulador A
    sta $7E0000 ; salva o que estiver em A neste endereço

    lda $7E0000 ; carrega o conteudo deste endereço no acumulador A    
    clc         ; limpa o carry para não dar erro
    adc #$40    ; adiciona o decimal 40 ao valor do acumulador A
    sta $7E0000 ; salva o conteudo do acumulador A neste endereço
    sta $7E0001  
    sta $7E0002  
    sta $7E0003  
    sta $7E0004  

    ; Depois de executar abra o "Memory Editor" e pesquise pelo endereço 7E0000
    ; Se funcionou haverá 5 valores: 50 50 50 50 50

; Loop forever.
Forever:
    jmp Forever

.ends
