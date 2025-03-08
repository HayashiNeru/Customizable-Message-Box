;Original Source: https://www.smwcentral.net/?p=section&a=details&id=27671
;Vertical mode 4 parallax kit by NerDose
;00 is normal speed, 01 is half speed, 02 is 1/4th speed etc until 4
ParallaxPointers:   db $00,$00,$00,$00,$01,$01,$02,$02
					db $03,$03,$04,$04,$00,$00,$00,$00
					db $00,$00,$00,$00,$04,$04,$03,$03
					db $02,$02,$01,$01,$00,$00,$00,$00
					
; Freerams and whatnot					
!YoffsetFreeRam = $7F9E40
!XoffsetFreeRam = $7F9E00
!ParallaxBuffer = $7E0F3A

!ScrollPointer = $1487|!addr

!FreeVertScroll = 1 ;makes the camera always follow mario

;################################################################

init:
LDA #$02
STA $42

LDA #$00
STA $2126
LDA #$FF
STA $2127

STZ $1411|!addr
LDA #$02 ;set background mode to 2
STA $3E 
JSR SetParallaxBuffer
JSR SetOffsetFreeram
JSR LoadTiles
RTL

;###############################################################

LoadTiles:
PHP

LDA #$80 ;mode 80 for VRAM address
STA $2115

REP #$20
	STZ $22 ;l3 x position
	STZ $24 ;l3 y position
	
;DMA
LDY #$01 ; 2 registers write once
STY $4300

LDY #$18 ;2118 VRAM Data Write low byte
STY $4301


LDA #$0080 ;256 bytes
STA $4305

LDA #!XoffsetFreeRam ;get the offset data
STA $4302
LDY #!XoffsetFreeRam>>16 ;get the offset data Bank
STY $4304

LDA #$4FFF ;write to vram address 5000 (layer 3 tilemap)
STA $2116

SEP #$20 ;8 bit A
LDA #$01 ;activate dma channel 0
STA $420B
PLP
RTS

SetOffsetFreeram:
	
	LDX #$00
	LDY #$00
	
	PHX
	LDA ParallaxPointers,y				
	ASL
	TAX
	REP #$20
	LDA !ParallaxBuffer,x
	AND #$03FF
	CLC : ADC #$4000
	PLX
	STA $20
	SEP #$20
	
	.loop:
	
	PHX
	LDA ParallaxPointers,y
	ASL
	TAX
	REP #$20
	LDA !ParallaxBuffer,x
	AND #$03FF
	CLC : ADC #$4000
	PLX
	STA !YoffsetFreeRam,x
	SEP #$20

	LDA $1E
	STA !XoffsetFreeRam,x ;store layer position to low byte
	
	LDA $1F				  ;store high byte of l position
	AND #$03			  ;the first two bits
	CLC : ADC #$40       ;D21 - - - VV
	;D = offset direction (mode 4 only)
	;1 = enable layer 1
	;2 = enable layer 2
	;VV = offset distance high byte
	STA !XoffsetFreeRam+1,x ;store in freeram high byte
	
	CPY #$1F
	BPL .end
	INX
	INX
	
	INY
	BRA .loop
	
	.end:
RTS

SetParallaxBuffer:
   REP #$20                             ;/  16 bit action starts here. (To load the x position of the BG)
   LDA $1C                              ;\  Load BG x Position
   STA !ParallaxBuffer
   
   LDA $1C
   LSR 
   STA !ParallaxBuffer+2
   
   LDA $1C
   LSR #2
   STA !ParallaxBuffer+4
   
   LDA $1C
   LSR #3
   STA !ParallaxBuffer+6
   
   LDA $1C
   LSR #4
   STA !ParallaxBuffer+8
   SEP #$20   
RTS

;#################################################################
	
main:
if !FreeVertScroll

  LDA #$01
  STA $1404|!addr

endif

  REP #$20
  LDA.w #.Scroll : STA !ScrollPointer
  LDA.w #.Scroll>>8 : STA !ScrollPointer+1
  SEP #$20

RTL

.Scroll
  PHB : PHK : PLB
  PHP
  SEP #$20
JSR SetParallaxBuffer
JSR SetOffsetFreeram
  REP #$20
  PLP
  PLB
RTL

;###################################################################

nmi:					
JSR LoadTiles
RTL