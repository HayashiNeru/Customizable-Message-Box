; Original Source: https://www.smwcentral.net/?p=viewthread&t=120885
; Customizable Layer 4 Scrolling Code (for Mode 0)
; orig. code by LMPuny & MolSno, modded by Anas for more customizability (kudos to Fernap for help regarding the defines!)
; you can't have super-slow auto-scrolling, but it requires only four free RAMs!

!ram_x = $0E00|!addr        ;/ 2 bytes of free RAM each! make sure they don't overlap!
!ram_y = $0E02|!addr        ;\ (these are overworld-related RAM addresses)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Horizontal Direction Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!constant_horiz = 0         ; set to 1 to enable constant horizontal auto-scrolling, and to 0 to scroll relative to another layer

!layer_horiz = 3            ; the layer to scroll relative to if '!constant_horiz' is 0 (ignored otherwise). valid values are 1, 2, & 3

!speed_horiz = 1            ; if '!constant_horiz' is 1, the speed in pixels/frame (recommended: 1-8); if 0, how much slower to scroll 
                            ; relative to the layer defined in '!layer_horiz' (i.e., 1 = half speed, 2 = quarter speed, 3 = eighth speed, etc.)
                            ; 0 makes the BG scroll the exact same as the specified layer or not scroll at all depending on '!constant_horiz' 
                            ; additionally, positive values make layer 4 go left, and negative ones make it go right

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Vertical Direction Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!constant_vert = 0          ; same as '!constant_horiz', but for vertical scrolling
!layer_vert = 3             ; same as '!layer_horiz', but for vertical scrolling
!speed_vert = 1             ; positive values make layer 4 go up, and negative ones make it go down

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; General Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!x_pos = 0	; initial X- & Y-positions of layer 4, decimal values 0-65535; only effective when using constant auto-scrolling
!y_pos = 0	
                            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; don't touch unless you know what you're doing!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if !layer_horiz == 1
    !l_x = $1A
elseif !layer_horiz == 2
    !l_x = $1E  
elseif !layer_horiz == 3
    !l_x = $22
else
    !l_x = $00
    error "Invalid value for '\!layer_horiz' (must be 1-3)"
endif

if !layer_vert == 1
    !l_y = $1C
elseif !layer_vert == 2
    !l_y = $20  
elseif !layer_vert == 3
    !l_y = $24
else
    !l_y = $00
    error "Invalid value for '\!layer_vert' (must be 1-3)"
endif
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

nmi: 
    lda $10 : BNE +             ; check if the game is lagging

    lda !ram_x   : STA $2113    ;/
    lda !ram_x+1 : STA $2113    ;| mirrors for L4's X- and Y-positions, 'write twice' registers
    lda !ram_y   : STA $2114    ;|
    lda !ram_y+1 : STA $2114    ;\
+
    rtl

init:	
    ; initializing Mode 0, by LMPuny
    lda #$53 : sta $2109        
    lda #$23 : sta $210A        
    lda #$44 : sta $210C
    stz $3E

    lda #$11 : sta $0D9D|!addr : sta $212C : sta $212E	;/ main & subscreen settings for L4
    lda #$0E : sta $0D9E|!addr : sta $212D : sta $212F	;\

    rep #$20                    ;/
    lda.w #!x_pos : sta !ram_x	;| initialize L4's X- and Y-positions
    lda.w #!y_pos : sta !ram_y	;|
    sep #$20                    ;\

main: 
    lda $13D4|!addr
    bne .return 
    rep #$20

; Layer 4 H-Scroll
        if !constant_horiz
        ldx $9D
        bne .vert
        lda !ram_x
        clc : adc.w #!speed_horiz
        sta !ram_x
    else
        lda !l_x
        if !speed_horiz > 0
            lsr #!speed_horiz
        elseif !speed_horiz < 0
            asl #-speed_horiz
        endif
        sta !ram_x
    endif

; Layer 4 V-Scroll 
.vert:
    if !constant_vert
        ldx $9D
        bne .return
        lda !ram_y
        clc : adc.w #!speed_vert
        sta !ram_y
    else
        lda !l_y
        if !speed_vert > 0
            lsr #!speed_horiz
        elseif !speed_horiz < 0
            asl #-speed_vert
        endif
        sta !ram_y
    endif

.return:
    sep #$20
    rtl