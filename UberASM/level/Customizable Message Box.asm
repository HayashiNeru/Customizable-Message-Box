
	!MSGOpenRam		=	$1869|!addr	;#$00 = Not Open, #$01 = Opening Box, #$02 = Load Message, #$03 = Opened Message Box
							;#$04 = Clear Message, #$05 = Closing Box, #$06 = Closed Message Box

	!MsgNumRam		=	$1927|!addr

	!FreeRam		=	$7FE800

	!HDMAChannel		=	7
	!Delay			=	$08		;Per frame. should $01~$10

	!SFXNum			=	$22
	!SFXBank		=	$1DFC


	!WindowingRam		=	$04A0|!addr

	
	!StripeIndex		=	$7F837B
	!StripeImage		=	$7F837D


	!ControlBox		=	!FreeRam		;$186A|!addr
	!BoxXstartRam		=	!FreeRam+$01		;$0F42|!addr
	!BoxXendRam		=	!FreeRam+$02		;$0F43|!addr
	!BoxYstartRam		=	!FreeRam+$03		;$0F44|!addr
	!BoxYendRam		=	!FreeRam+$04		;$0F45|!addr

	!MsgXPosRam		=	!FreeRam+$05		;$0F3A|!addr
	!MsgYPosRam		=	!FreeRam+$06		;$0F3B|!addr
	!MsgWidthRam		=	!FreeRam+$07		;$0F3C|!addr
	!MsgHeightRam		=	!FreeRam+$08		;$0F3D|!addr

	!Pointer		=	!FreeRam+$09		;$1923|!addr	;2 Bytes

;	!TilesBackup		=	$414000


macro WindowX(Width,Xstart1)
.BoxX<Width>
	LDA !ControlBox : TAX
	LDA #<Xstart1>			;Center of Window's X position
	SEC : SBC .BoxXTable<Width>,x
	STA !BoxXstartRam
	LDA #<Xstart1>-1		;Center of Window's X position - 1
	CLC : ADC .BoxXTable<Width>,x	;Load Window's width table
	STA !BoxXendRam
	RTS
endmacro

macro WindowY(Height,Ystart1)
.BoxY<Height>
	LDA !ControlBox : TAX
	LDA #<Ystart1>			;Center of Window's Y position
	SEC : SBC .BoxYTable<Height>,x
	STA !BoxYstartRam
	LDA #<Ystart1>-1		;Center of Window's Y position - 1
	CLC : ADC .BoxYTable<Height>,x
	STA !BoxYendRam
	RTS
endmacro


;nmi:


;	LDA !MSGOpenRam
;	JSL $0086DF

;VRamRoutine:
;	dw Return
;	dw BackUp
;	dw Return, Return
;	dw Restore
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;	dw Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return, Return
;BackUp:
	
;	RTL

;Restore:
;	RTL
init:
	LDA #$00	
	STA !ControlBox	
	STA !BoxXstartRam
	STA !BoxXendRam
	STA !BoxYstartRam
	STA !BoxYendRam
	STA !MsgXPosRam
	STA !MsgYPosRam
	STA !MsgWidthRam
	STA !MsgHeightRam
	STA !Pointer

	RTL

main:

	LDA $13D4|!addr		;When paused
	BEQ +
	JMP Return		;Don't run
+
	LDA !MSGOpenRam
	JSL $0086DF

MSGRoutine:
	dw Return
	dw OpenWindow
	dw OpenMSG
	dw WaltingKey
	dw Erase
	dw CloseWindow
	dw ResetFlag
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger
	dw GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger, GotoTrigger

GotoTrigger:

	LDA !MSGOpenRam
	CMP #$FF
	BNE +
	JMP .SetFlag
+
	LDA !MSGOpenRam : CLC : ADC #$01 : STA !MSGOpenRam
	JMP Return

.SetFlag
	LDA #$01
	STA !MSGOpenRam

	JMP Return

OpenWindow:
	JSR Freeze

	LDA #!SFXNum			;Message Sound
	STA !SFXBank|!addr		;

	LDA #$01<<!HDMAChannel    	;\  
	TSB $0D9F|!addr           	;/  enable HDMA channel X

	LDA !ControlBox
	CLC : ADC #$01
	STA !ControlBox			;ControlBox + 1

	JSR Clip
	JSR Windowing

	LDA !ControlBox
	CMP #$13
	BEQ +
	JMP Return
+
	LDA #$02
	STA !MSGOpenRam				; Open stripe
	JMP Return

OpenMSG:
	JSR Freeze

	REP #$20 
	LDA #$0000
	STA $22		;Layer 3 X to $0000
	LDA #$0000
	STA $24		;Layer 3 Y to $0000
	SEP #$20

.MessageStripe

	REP #$10
	LDX #$0000

	LDA !MsgNumRam : XBA : LDA #$00		;Put the message number in the high bits of X.
						;
	REP #$20
	STA !Pointer : TAY
	SEP #$20


	LDA Messages+16,y : CLC : ADC #$02 :  STA !MsgHeightRam

	;Originally, in place of ‘LDA Messages’, ‘Msg0000’ table should be loaded when !MsgNumRam = #$00,
	;and ‘Msg0001’ table should be loaded when !MsgNumRam = #$01.

	LDA Messages+17,y : CLC : ADC #$01 : LSR : EOR #$FF : SEC : SBC #$F0 : STA !MsgXPosRam
	LDA #$05 : STA !MsgYPosRam
	LDA Messages+18,y : STA !ControlBox		; !ControlBox = YXPCCCTT pointer.
..Header

	LDA !MsgNumRam : XBA : LDA #$00
	REP #$20 : TAY : SEP #$20
	LDA Messages+17,y				; Bring Width from message's header
	CLC : ADC #$02 : STA !MsgWidthRam

	LDA !MsgYPosRam : ASL #$05 : CLC : ADC !MsgXPosRam
	XBA
	LDA !MsgYPosRam : LSR #$03 : CLC : ADC #%01010000

	REP #$20
	STA !StripeImage,x
	SEP #$20

	LDA !MsgWidthRam : ASL #$01 : SEC : SBC #$01
	XBA : LDA #$00
	REP #$20
	STA !StripeImage+2,x
	SEP #$20

	LDA !MsgYPosRam : CLC : ADC #$01 : STA !MsgYPosRam
	INX #$0004

..Tile
	LDA !MsgNumRam : XBA : LDA #$00
	REP #$20
	TAY				;Set MsgNumRam×#$0100 To Y
	SEP #$20

	LDA !MsgHeightRam
	CMP #$01
	BNE +
	JMP ...Bottom
+
	LDA !MsgHeightRam : SEC : SBC #$02
	CMP Messages+16,y
	BNE ...Middle

...Top
	LDA !MsgWidthRam
	CMP #$01
	BNE +
	JMP ....BorderUR
+
	LDA !MsgWidthRam : SEC : SBC #$02
	CMP Messages+17,y
	BNE ....BorderUp
....BorderUL
	LDA Messages+8,y : XBA : LDA Messages,y
	REP #$20
	STA !StripeImage,x
	JMP ...TileEnd

....BorderUp
	LDA Messages+9,y : XBA : LDA Messages+1,y
	REP #$20
	STA !StripeImage,x
	JMP ...TileEnd

....BorderUR
	LDA Messages+10,y : XBA : LDA Messages+2,y
	REP #$20
	STA !StripeImage,x
	JMP ...LineEnd

...Middle
	LDA !MsgWidthRam
	CMP #$01
	BNE +
	JMP ....BorderR
+
	LDA !MsgWidthRam : SEC : SBC #$02
	CMP Messages+17,y
	BNE ....Text

....BorderL
	LDA Messages+11,y : XBA : LDA Messages+3,y
	REP #$20
	STA !StripeImage,x
	JMP ...TileEnd

....Text
	REP #$20
	LDA !Pointer : TAY
	SEP #$20

	LDA Messages+24,y			; Load Character
	CMP #$F0				; If Character number > $F0
	BCS ....ChangeColor

....NormalText
	LDA Messages+24,y
	XBA : LDA !ControlBox : XBA		; !ControlBox = YXPCCCTT pointer.
	REP #$20
	STA !StripeImage,x
	INY : TYA : STA !Pointer
	JMP ...TileEnd

....ChangeColor
	LDA !ControlBox : AND #%11100011
	STA !ControlBox				; Clear CCC from yxpCCCtt
	
	LDA Messages+24,y : AND #%00000111	; $F0~$F7 to $00~$07
	ASL #$02 : ORA !ControlBox		; Input Color info to YXPCCCTT pointer.
	STA !ControlBox

	REP #$20
	INY : TYA : STA !Pointer
	SEP #$20
	JMP ..Tile				; This character isn't appear to message box.

....BorderR
	LDA Messages+12,y : XBA : LDA Messages+4,y
	REP #$20
	STA !StripeImage,x
	JMP ...LineEnd

...Bottom
	LDA !MsgWidthRam
	CMP #$01
	BNE +
	JMP ....BorderDR
+
	LDA !MsgWidthRam : SEC : SBC #$02
	CMP Messages+17,y
	BNE ....BorderDown

....BorderDL
	LDA Messages+13,y : XBA : LDA Messages+5,y
	REP #$20
	STA !StripeImage,x
	JMP ...TileEnd

....BorderDown
	LDA Messages+14,y : XBA : LDA Messages+6,y
	REP #$20
	STA !StripeImage,x
	JMP ...TileEnd

....BorderDR
	LDA Messages+15,y : XBA : LDA Messages+7,y
	REP #$20
	STA !StripeImage,x
	JMP ...LineEnd


...TileEnd
	SEP #$20
	INX #$0002
	LDA !MsgWidthRam
	SEC : SBC #$01
	STA !MsgWidthRam		;!MsgWidthRam = !MsgWidthRam - 1. = Next Character
	JMP ..Tile

...LineEnd
	SEP #$20
	INX #$0002
	LDA !MsgHeightRam : SEC : SBC #$01 : STA !MsgHeightRam
	LDA !MsgHeightRam
	CMP #$00
	BEQ +
	JMP ..Header			;End Loop
+

	LDA #$FF
	STA !StripeImage,x

	REP #$20
	TYA
	STA !StripeIndex
	SEP #$30

	LDA #$13
	STA !ControlBox

	LDA #$03
	STA !MSGOpenRam
	RTL

WaltingKey:
	JSR Freeze

	LDA $16					; \ If the player has pressed the BYET button...
	AND #%11110000				; |
	BNE .Press				; /

	LDA $18					; \ If the player has pressed the AX-- button...
	AND #%11000000				; |
	BEQ Return
	
.Press
	LDA #$04
	STA !MSGOpenRam
	RTL

Erase:
	REP #$20
	LDA #$0000
	STA !StripeIndex
	SEP #$20

	JSR Freeze
	LDX #$00 : LDY #$00

.EraseLoop
	LDA .EraseTable,y
	STA !StripeImage,x
	INY
	INX
	CPY #$07
	BMI .EraseLoop

	TYA
	STA !StripeIndex

	LDA #$05
	STA !MSGOpenRam

	RTL
.EraseTable
	db %01010000,%10100000,%01000011,%11111111,$FC,%00111000,$FF

CloseWindow:
	JSR Freeze

	JSR Windowing

	LDA !ControlBox : SEC : SBC #$01 : STA !ControlBox

	LDA !ControlBox
	BNE Return

	LDA #$06
	STA !MSGOpenRam
	RTL

ResetFlag:
	LDA #$01<<!HDMAChannel    	;\  
	TRB $0D9F|!addr           	;/  disable HDMA channel X

	STZ $9D			;Unfreeze
	STZ $13FB|!addr		;Unfreeze
	STZ $13D3|!addr		;Enable pause

	STZ !MSGOpenRam		;Flag Set to 0

	JMP Return


Return:
	RTL



Freeze:

	LDA #$01
	STA $9D ;> Freezing sprites and animated tiles
	STA $13FB|!addr ;> Freezing player
	STA $13D3|!addr ;> Disable Pause

	RTS

Clip:

	LDA #%00100010		;\  Clip to black: Inside, Prevent colot math: Inside
	TSB $44     		; | Add subscreen instead of fixed color: True
	LDA #%11010000		; |
	TRB $44     		;/ 

	LDA #%00100000 		; Backdrop for color math
	STA $40     		; mirror of $2131

	LDA #%00100010		;\  values for enabling/inverting BG1/BG2 on window 1/2
	STA $41     		; | mirror of $2123
	LDA #%00100000		; | values for enabling/inverting BG3/BG4 on window 1/2
	STA $42     		; | mirror of $2124
	LDA #%00100010		; | values for enabling/inverting OBJ/Color on window 1/2
	STA $43     		; | mirror of $2125
	            		; | Window 1 enabled on BG1, BG2, BG4, OBJ, Color
	            		; | Window 2 enabled on BG1, BG2, BG4, OBJ, Color
	RTS

Windowing:
	LDA !MsgNumRam : XBA : LDA #$00
	REP #$30 : TAY : SEP #$20
	LDA Messages+17,y	; Bring Width from message's header
	SEP #$10
	ASL : TAX
	JSR.w (.BoxX,x)


	LDA !MsgNumRam : XBA : LDA #$00
	REP #$30 : TAY : SEP #$20
	LDA Messages+16,y	; Bring Height from message's header
	SEP #$10
	ASL : TAX
	JSR.w (.BoxY,x)


	JSR WindowingControl

	REP #$20                  	;\  Get into 16 bit mode
	LDA #$2641                	; | Register $2126 using mode 1
	STA $4300+(!HDMAChannel*16)	; | 43X0 = transfer mode, 43X1 = register
		
	LDA #WindowTable        	; | High byte and low byte of table addresse.
	STA $4302+(!HDMAChannel*16)	; | 43X2 = low byte, 43X3 = high byte

	SEP #$20                  	; / Back to 8 bit mode

	LDA.b #WindowTable>>16   	; | Bank byte of table addresse.
	STA $4304+(!HDMAChannel*16)	;/  = bank byte

	LDA #$40
	STA $4307+(!HDMAChannel*16)

	RTS

.BoxX
	dw .BoxX4,.BoxX4,.BoxX4,.BoxX4,.BoxX4,.BoxX5,.BoxX6,.BoxX7
	dw .BoxX8,.BoxX9,.BoxXA,.BoxXB,.BoxXC,.BoxXD,.BoxXE,.BoxXF
	dw .BoxX10,.BoxX11,.BoxX12,.BoxX13,.BoxX14,.BoxX15,.BoxX16,.BoxX17
	dw .BoxX18,.BoxX19,.BoxX1A,.BoxX1B,.BoxX1C,.BoxX1C,.BoxX1C,.BoxX1C

.BoxY
	dw .BoxY1,.BoxY1,.BoxY2,.BoxY3,.BoxY4,.BoxY5,.BoxY6,.BoxY7
	dw .BoxY8,.BoxY9,.BoxYA,.BoxYB,.BoxYC,.BoxYC,.BoxYC,.BoxYC

	%WindowX(4,$80)
	%WindowX(5,$7C)
	%WindowX(6,$80)
	%WindowX(7,$7C)
	%WindowX(8,$80)
	%WindowX(9,$7C)
	%WindowX(A,$80)
	%WindowX(B,$7C)
	%WindowX(C,$80)
	%WindowX(D,$7C)
	%WindowX(E,$80)
	%WindowX(F,$7C)
	%WindowX(10,$80)
	%WindowX(11,$7C)
	%WindowX(12,$80)
	%WindowX(13,$7C)
	%WindowX(14,$80)
	%WindowX(15,$7C)
	%WindowX(16,$80)
	%WindowX(17,$7C)
	%WindowX(18,$80)
	%WindowX(19,$7C)
	%WindowX(1A,$80)
	%WindowX(1B,$7C)
	%WindowX(1C,$80)


	%WindowY(1,$33)
	%WindowY(2,$37)
	%WindowY(3,$3B)
	%WindowY(4,$3F)
	%WindowY(5,$43)
	%WindowY(6,$47)
	%WindowY(7,$4B)
	%WindowY(8,$4F)
	%WindowY(9,$53)
	%WindowY(A,$57)
	%WindowY(B,$5B)
	%WindowY(C,$5F)

.BoxXTable4:	
	db $00,$01,$03,$04,$05,$06,$08,$09
	db $0A,$0B,$0D,$0E,$0F,$10,$12,$13
	db $14,$15,$17,$18
.BoxXTable5:	
	db $00,$01,$03,$04,$06,$07,$09,$0A
	db $0C,$0D,$0F,$10,$12,$13,$15,$16
	db $18,$19,$1B,$1C
.BoxXTable6:	
	db $00,$02,$03,$05,$07,$08,$0A,$0C
	db $0D,$0F,$11,$13,$14,$16,$18,$19
	db $1B,$1D,$1E,$20
.BoxXTable7:	
	db $00,$02,$04,$06,$08,$09,$0B,$0D
	db $0F,$11,$13,$15,$17,$19,$1B,$1C
	db $1E,$20,$22,$24
.BoxXTable8:	
	db $00,$02,$04,$06,$08,$0B,$0D,$0F
	db $11,$13,$15,$17,$19,$1B,$1D,$20
	db $22,$24,$26,$28
.BoxXTable9:	
	db $00,$02,$05,$07,$09,$0C,$0E,$10
	db $13,$15,$17,$19,$1C,$1E,$20,$23
	db $25,$27,$2A,$2C
.BoxXTableA:	
	db $00,$03,$05,$08,$0A,$0D,$0F,$12
	db $14,$17,$19,$1C,$1E,$21,$23,$26
	db $28,$2B,$2D,$30
.BoxXTableB:	
	db $00,$03,$05,$08,$0B,$0E,$10,$13
	db $16,$19,$1B,$1E,$21,$24,$26,$29
	db $2C,$2F,$31,$34
.BoxXTableC:	
	db $00,$03,$06,$09,$0C,$0F,$12,$15
	db $18,$1B,$1D,$20,$23,$26,$29,$2C
	db $2F,$32,$35,$38
.BoxXTableD:	
	db $00,$03,$06,$09,$0D,$10,$13,$16
	db $19,$1C,$20,$23,$26,$29,$2C,$2F
	db $33,$36,$39,$3C
.BoxXTableE:	
	db $00,$03,$07,$0A,$0D,$11,$14,$18
	db $1B,$1E,$22,$25,$28,$2C,$2F,$33
	db $36,$39,$3D,$40
.BoxXTableF:	
	db $00,$04,$07,$0B,$0E,$12,$15,$19
	db $1D,$20,$24,$27,$2B,$2F,$32,$36
	db $39,$3D,$40,$44
.BoxXTable10:	
	db $00,$04,$08,$0B,$0F,$13,$17,$1B
	db $1E,$22,$26,$2A,$2D,$31,$35,$39
	db $3D,$40,$44,$48
.BoxXTable11:	
	db $00,$04,$08,$0C,$10,$14,$18,$1C
	db $20,$24,$28,$2C,$30,$34,$38,$3C
	db $40,$44,$48,$4C
.BoxXTable12:	
	db $00,$04,$08,$0D,$11,$15,$19,$1D
	db $22,$26,$2A,$2E,$33,$37,$3B,$3F
	db $43,$48,$4C,$50
.BoxXTable13:	
	db $00,$04,$09,$0D,$12,$16,$1B,$1F
	db $23,$28,$2C,$31,$35,$39,$3E,$42
	db $47,$4B,$50,$54
.BoxXTable14:	
	db $00,$05,$09,$0E,$13,$17,$1C,$20
	db $25,$2A,$2E,$33,$38,$3C,$41,$45
	db $4A,$4F,$53,$58
.BoxXTable15:	
	db $00,$05,$0A,$0F,$13,$18,$1D,$22
	db $27,$2C,$30,$35,$3A,$3F,$44,$49
	db $4D,$52,$57,$5C
.BoxXTable16:	
	db $00,$05,$0A,$0F,$14,$19,$1E,$23
	db $28,$2D,$33,$38,$3D,$42,$47,$4C
	db $51,$56,$5B,$60
.BoxXTable17:	
	db $00,$05,$0B,$10,$15,$1A,$20,$25
	db $2A,$2F,$35,$3A,$3F,$44,$4A,$4F
	db $54,$59,$5F,$64
.BoxXTable18:	
	db $00,$05,$0B,$10,$16,$1B,$21,$26
	db $2C,$31,$37,$3C,$42,$47,$4D,$52
	db $58,$5D,$63,$68
.BoxXTable19:	
	db $00,$06,$0B,$11,$17,$1C,$22,$28
	db $2D,$33,$39,$3F,$44,$4A,$50,$55
	db $5B,$61,$66,$6C
.BoxXTable1A:	
	db $00,$06,$0C,$12,$18,$1D,$23,$29
	db $2F,$35,$3B,$41,$47,$4D,$53,$58
	db $5E,$64,$6A,$70
.BoxXTable1B:	
	db $00,$06,$0C,$12,$18,$1F,$25,$2B
	db $31,$37,$3D,$43,$49,$4F,$55,$5C
	db $62,$68,$6E,$74
.BoxXTable1C:	
	db $00,$06,$0D,$13,$19,$20,$26,$2C
	db $33,$39,$3F,$45,$4C,$52,$58,$5F
	db $65,$6B,$72,$78

.BoxYTable1:	
	db $00,$00,$00,$01,$01,$01,$01,$01
	db $02,$02,$02,$02,$03,$03,$03,$03
	db $03,$04,$04,$04
.BoxYTable2:	
	db $00,$01,$02,$03,$03,$04,$05,$06
	db $07,$08,$08,$09,$0A,$0B,$0C,$0D
	db $0D,$0E,$0F,$10
.BoxYTable3:	
	db $00,$01,$02,$03,$04,$05,$06,$07
	db $08,$09,$0B,$0C,$0D,$0E,$0F,$10
	db $11,$12,$13,$14
.BoxYTable4:	
	db $00,$01,$03,$04,$05,$06,$08,$09
	db $0A,$0B,$0D,$0E,$0F,$10,$12,$13
	db $14,$15,$17,$18
.BoxYTable5:	
	db $00,$01,$03,$04,$06,$07,$09,$0A
	db $0C,$0D,$0F,$10,$12,$13,$15,$16
	db $18,$19,$1B,$1C
.BoxYTable6:	
	db $00,$02,$03,$05,$07,$08,$0A,$0C
	db $0D,$0F,$11,$13,$14,$16,$18,$19
	db $1B,$1D,$1E,$20
.BoxYTable7:	
	db $00,$02,$04,$06,$08,$09,$0B,$0D
	db $0F,$11,$13,$15,$17,$19,$1B,$1C
	db $1E,$20,$22,$24
.BoxYTable8:
	db $00,$02,$04,$06,$08,$0B,$0D,$0F
	db $11,$13,$15,$17,$19,$1B,$1D,$20
	db $22,$24,$26,$28
.BoxYTable9:	
	db $00,$02,$05,$07,$09,$0C,$0E,$10
	db $13,$15,$17,$19,$1C,$1E,$20,$23
	db $25,$27,$2A,$2C
.BoxYTableA:	
	db $00,$03,$05,$08,$0A,$0D,$0F,$12
	db $14,$17,$19,$1C,$1E,$21,$23,$26
	db $28,$2B,$2D,$30
.BoxYTableB:	
	db $00,$03,$05,$08,$0B,$0E,$10,$13
	db $16,$19,$1B,$1E,$21,$24,$26,$29
	db $2C,$2F,$31,$34
.BoxYTableC:	
	db $00,$03,$06,$09,$0C,$0F,$12,$15
	db $18,$1B,$1D,$20,$23,$26,$29,$2C
	db $2F,$32,$35,$38

WindowingControl:					; From https://smwc.me/1637044
	LDX #$00					; Author: Fernap
	LDA #$00 : XBA
	REP #$10

	LDA !BoxYstartRam
	BEQ +
	TAY						; YStart lines
	REP #$20
	LDA #$00FF					; write FF 00
	JSR WriteWords
	LDA #$0000
	SEP #$20

+
	LDA !BoxYendRam
	SEC : SBC !BoxYstartRam : INC			; YEnd - Ystart + 1 lines...this must be >= 0 or it will break horribly
	BEQ +
	TAY
	LDA !BoxXendRam : XBA : LDA !BoxXstartRam	; you can make this a single lda after the rep #$20 if these addresses are guaranteed consecutive
	REP #$20
	JSR WriteWords
	LDA #$0000
	SEP #$20

+
	LDA.b #223
	SEC : SBC !BoxYendRam				; 223 - YEnd lines
	BEQ +
	TAY
	REP #$20
	LDA #$00FF
	JSR WriteWords

+
	SEP #$30
	RTS

; Writes the 16-bit value in A to !WindowingRam at the 16-bit offset in X, Y times (Y > 0!)
; updates the offset after exiting

WriteWords:
-
	STA !WindowingRam,x
	INX #2
 	DEY
	BNE -
.Return
	RTS

WindowTable:
	db $F0 : dw !WindowingRam+$00-!addr
	db $F0 : dw !WindowingRam+$E0-!addr
	db $00

MsgList:
	dl Msg0000, Msg0001, Msg0002, Msg0003, Msg0004, Msg0005, Msg0006, Msg0007
	dl Msg0008, Msg0009, Msg000A, Msg000B, Msg000C, Msg000D, Msg000E, Msg000F

incsrc "MessageText.asm"
