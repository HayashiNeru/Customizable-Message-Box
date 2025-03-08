
	!MSGOpenRam		=	$1869|!addr	;#$00 = Not Open, #$01 = Opening Box, #$02 = Load Message, #$03 = Opened Message Box
							;#$04 = Clear Message, #$05 = Closing Box, #$06 = Closed Message Box

	!MsgNumRam		=	$1927|!addr

	!FreeRam		=	$435000

	!HDMAChannel		=	7

	!SFXNum			=	$22
	!SFXBank		=	$1DFC

	!Layer4_Tile_Address	=	$5800


	!WindowingRam		=	$04A0|!addr

	!ControlBox		=	!FreeRam
	!BoxXstartRam		=	!FreeRam+$01
	!BoxXendRam		=	!FreeRam+$02
	!BoxYstartRam		=	!FreeRam+$03
	!BoxYendRam		=	!FreeRam+$04

	!MsgXPosRam		=	!FreeRam+$05
	!MsgYPosRam		=	!FreeRam+$06
	!MsgWidthRam		=	!FreeRam+$07
	!MsgHeightRam		=	!FreeRam+$08

	!Pointer		=	!FreeRam+$09		; 2 Bytes

	!Tiles_Count_RAM	=	!FreeRam+$0B		; 2 Bytes

	!Tiles_Position		=	$436000		; 1680(Hex = $690) Bytes
	!Tiles_Backup		=	$436690		; 840(Hex = $348) Bytes


macro WindowX(Width,Xstart1)
.BoxX<Width>
	LDA !ControlBox
	TAX
	LDA #<Xstart1>			;Center of Window's X position
	CLC : ADC $03
	SEC : SBC .BoxXTable<Width>,x
	STA !BoxXstartRam
	LDA #<Xstart1>-1		;Center of Window's X position - 1
	CLC : ADC $03
	CLC : ADC .BoxXTable<Width>,x	;Load Window's width table
	STA !BoxXendRam
	RTS
endmacro

macro WindowY(Height,Ystart1)
.BoxY<Height>
	LDA !ControlBox
	TAX
	LDA #<Ystart1>			;Center of Window's Y position
	CLC : ADC $04
	SEC : SBC .BoxYTable<Height>,x
	STA !BoxYstartRam
	LDA #<Ystart1>-1		;Center of Window's Y position - 1
	CLC : ADC $04
	CLC : ADC .BoxYTable<Height>,x
	STA !BoxYendRam
	RTS
endmacro

	; Do not edit this!

	!Header_Length		=	$0017
	!Table_Index		=	$00		; 6 Bytes
	!X_Offset		=	$03		; 8 Bit
	!Y_Offset		=	$04		; 8 Bit

nmi:
	LDA !MSGOpenRam
	ASL : TAX
	JSR.w (VRamRoutine,x)
	RTL

VRamRoutine:
	dw NMI_Return
	dw BackUp
	dw Drawing_Message
	dw NMI_Return
	dw NMI_Return
	dw Restore
	dw NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
	dw NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return,NMI_Return
BackUp:

	LDA !ControlBox
	CMP #$05
	BMI +

	JSR Backup_Tiles
	+

	RTS

Drawing_Message:
	LDA !ControlBox
	CMP #$01
	BEQ +
	RTS
	+


	LDY #$10
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgHeightRam

	LDY #$11
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgWidthRam

	JSR Drawing_Tiles

	LDA #$03
	STA !MSGOpenRam				; Please Erase this line


	RTS
Restore:
	LDA !ControlBox
	CMP #$12
	BNE +
	JSR Drawing_Tiles

	+
NMI_Return:
	RTS

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
	STA !MsgNumRam
	STA !MsgNumRam+1
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
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger
	dw GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger,GotoTrigger

GotoTrigger:

	LDA !MSGOpenRam
	CMP #$FF
	BNE +
	JMP .SetFlag
+
	LDA !MSGOpenRam
	CLC : ADC #$01
	STA !MSGOpenRam
	JMP Return

.SetFlag
	LDA #$01
	STA !MSGOpenRam

	JMP Return

OpenWindow:
	JSR Freeze

	LDA !ControlBox
	CMP #$00
	BNE +

	LDA #!SFXNum			; Message Sound
	STA !SFXBank|!addr		;

	LDY #$10
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgHeightRam

	LDY #$11
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgWidthRam
	+

	LDA !ControlBox
	CMP #$01
	BNE +
	JSR Clip
	JSR Set_Position
	+

	LDA #$01<<!HDMAChannel    	;\  
	TSB $0D9F|!addr           	;/  enable HDMA channel X

	LDA !ControlBox
	CLC : ADC #$01
	STA !ControlBox			;ControlBox + 1

	JSR Windowing

	LDA !ControlBox
	CMP #$13
	BNE +
	LDA #$02
	STA !MSGOpenRam				; Open stripe
	LDA #$00
	STA !ControlBox
+	JMP Return

OpenMSG:
	JSR Freeze

	LDA !ControlBox
	CMP #$00
	BEQ +
	JMP Return
	+

	LDY #$14
	LDA [!Table_Index],y
	AND #%00000011
	ASL : TAX
	JSR.w (Clip_Layer,x)

	REP #$10
	LDX #$0000
.Border_UL
	LDY #$0000
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$0008
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x

	INX #$0004

	LDY #$0011
	LDA [!Table_Index],y
	STA !MsgWidthRam

.Border_Above
	LDY #$0001
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x

	LDY #$0009
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x

	LDA !MsgWidthRam
	SEC : SBC #$01
	STA !MsgWidthRam

	INX #$0004

	LDA !MsgWidthRam
	CMP #$00
	BEQ +
	JMP .Border_Above
	+
.Border_UR
	LDY #$0002
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$000A
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x
	INX #$0004

	LDY #$0012
	LDA [!Table_Index],y
	STA $03

	LDY #$0010
	LDA [!Table_Index],y
	STA !MsgHeightRam

	LDY #!Header_Length

.Border_Left
	PHY
	LDY #$0003
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$000B
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x
	INX #$0004

	LDY #$0011
	LDA [!Table_Index],y
	STA !MsgWidthRam
	PLY
.Text
	LDA [!Table_Index],y
	CMP #$F0
	BCC +
	JMP ..Special_Character
	+
..Normal_Character

	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDA $03
	STA !Tiles_Position+3,x
	INX #$0004

	LDA !MsgWidthRam
	SEC : SBC #$01
	STA !MsgWidthRam
	JMP ..Skip

..Special_Character

	LDA $03
	AND #%11100011
	STA $03

	LDA [!Table_Index],y
	AND #%00000111
	ASL #$02
	ORA $03
	STA $03


..Skip
	INY #$0001
	

	LDA !MsgWidthRam
	CMP #$00
	BEQ +
	JMP .Text
	+

.Border_Right
	PHY
	LDY #$0004
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$000C
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x
	INX #$0004

	LDY #$0011
	LDA [!Table_Index],y
	STA !MsgWidthRam

	LDA !MsgHeightRam
	SEC : SBC #$01
	STA !MsgHeightRam

	PLY

	LDA !MsgHeightRam
	CMP #$00
	BEQ +
	JMP .Border_Left
	+

.Border_DL
	LDY #$0005
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$000D
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x

	INX #$0004

	LDY #$0011
	LDA [!Table_Index],y
	STA !MsgWidthRam

.Border_Down
	LDY #$0006
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x

	LDY #$000E
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x

	LDA !MsgWidthRam
	SEC : SBC #$01
	STA !MsgWidthRam

	INX #$0004

	LDA !MsgWidthRam
	CMP #$00
	BEQ +
	JMP .Border_Down
	+
.Border_DR
	LDY #$0007
	LDA [!Table_Index],y
	STA !Tiles_Position+2,x
	LDY #$000F
	LDA [!Table_Index],y
	STA !Tiles_Position+3,x

.End

	SEP #$10

	LDA #$01
	STA !ControlBox


	RTL					; Please Erase this line
Clip_Layer:
	dw .Layer1,.Layer2,.Layer3,.Layer4

.Layer1
	LDA #%00100000
	STA $41
	LDA #%00100010
	STA $42

	LDA $0D9D|!addr
	AND #%00000001
	CMP #%00000001
	BEQ +
	LDA $44
	ORA #%10000010
	AND #%10001111
	STA $44
	+
	RTS
.Layer2
	LDA #%00000010
	STA $41
	LDA #%00100010
	STA $42

	LDA $0D9D|!addr
	AND #%00000010
	CMP #%00000010
	BEQ +
	LDA $44
	ORA #%10000010
	AND #%10001111
	STA $44
	+
	RTS
.Layer3
	LDA #%00100010
	STA $41
	LDA #%00100000
	STA $42

	LDA $0D9D|!addr
	AND #%00000100
	CMP #%00000100
	BEQ +
	LDA $44
	ORA #%10000010
	AND #%10001111
	STA $44
	+
	RTS
.Layer4
	LDA #%00100010
	STA $41
	LDA #%00000000
	STA $42

	LDA $0D9D|!addr
	AND #%00001000
	CMP #%00001000
	BEQ +
	LDA $44
	ORA #%10000010
	AND #%10001111
	STA $44
	+
	RTS

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
	LDA #$13
	STA !ControlBox

	JSR Freeze
	JSR Restore_Tiles

	LDA #$05
	STA !MSGOpenRam

	RTL

CloseWindow:
	JSR Freeze

	JSR Clip
	JSR Windowing

	LDA !ControlBox
	SEC : SBC #$01
	STA !ControlBox

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
	STA $9D 	;> Freezing sprites and animated tiles
	STA $13FB|!addr ;> Freezing player
	STA $13D3|!addr ;> Disable Pause

Set_Table_Index:
	REP #$30
	LDA !MsgNumRam
	ASL
	CLC : ADC !MsgNumRam
	TAY
	LDA MsgList,y
	STA !Table_Index
	SEP #$20
	LDA MsgList+2,y
	STA !Table_Index+2
	SEP #$10
	RTS

Clip:

	LDA #%00100010		;\  Clip to black: Inside, Prevent colot math: Inside
	TSB $44     		; | Add subscreen instead of fixed color: True
	LDA #%11010000		; |
	TRB $44     		;/ 

	;LDA #%00100000 		; Backdrop for color math
	;TSB $40     		; mirror of $2131

	LDA #%00100010		;\  values for enabling/inverting BG1/BG2 on window 1/2
	STA $41     		; | mirror of $2123
	LDA #%00100010		; | values for enabling/inverting BG3/BG4 on window 1/2
	STA $42     		; | mirror of $2124
	LDA #%00100010		; | values for enabling/inverting OBJ/Color on window 1/2
	STA $43     		; | mirror of $2125
	            		; | Window 1 enabled on BG1, BG2, BG4, OBJ, Color
	            		; | Window 2 enabled on BG1, BG2, BG4, OBJ, Color
	RTS

Windowing:
	JSR Set_BG_Pos
	LDA $0A
	SEC : SBC #$04
	AND #%00000111		; Bring Bit 1 - 3
	EOR #%11111111
	CLC : ADC #$05
	STA $03

	LDA $0C
	SEC : SBC #$01
	AND #%00000111		; Bring Bit 1 - 3
	EOR #%11111111
	CLC : ADC #$08
	STA $04

	LDY #$11
	LDA [!Table_Index],y	; Bring Width from message's header
	ASL : TAX
	JSR.w (.BoxX,x)

	LDY #$10
	LDA [!Table_Index],y	; Bring Width from message's header
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
	LDA #$00
	XBA
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
	SEC : SBC !BoxYstartRam
	INC						; YEnd - Ystart + 1 lines...this must be >= 0 or it will break horribly
	BEQ +
	TAY
	LDA !BoxXendRam
	XBA
	LDA !BoxXstartRam	; you can make this a single lda after the rep #$20 if these addresses are guaranteed consecutive
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

incsrc "Message_List.asm"
incsrc "Message_Text.asm"
Restore_Tiles:

	REP #$30
	LDX #$0000
	LDY #$0000
.Loop
	LDA !Tiles_Backup,x
	PHA

	TXA
	ASL #$01
	TAX

	PLA
	STA !Tiles_Position+2,x

	TXA
	LSR #$01
	TAX

	INX #$0002
	INY #$0001
	TYA
	CMP !Tiles_Count_RAM
	BPL +
	JMP .Loop
	+

	SEP #$30

	RTS

Set_Position:
	JSR Set_BG_Pos
	LDY #$14
	LDA [!Table_Index],y
	AND #%00000011
	TAX

	LDA BG_Tilemap_Size,x		; Load BG tile's size
	STA $07				; Set To $07

	TXA : ASL : TAX			; X = X × 2
	REP #$20
	LDA BG_Tilemap_Address,x	; Load BG tile's address
	STA $08				; Set To $08

	LDA #$0000
	STA !Tiles_Count_RAM
	SEP #$20
	LDX #$00
.CountTiles
	LDA #$00
	XBA
	LDA !MsgWidthRam
	REP #$20
	CLC : ADC !Tiles_Count_RAM
	STA !Tiles_Count_RAM
	SEP #$20

	INX
	TXA
	CMP !MsgHeightRam
	BPL +
	JMP .CountTiles
	+

	REP #$10			; Set X/Y to 16 bit

	LDY #$0011
	LDA [!Table_Index],y
	CLC : ADC #$01
	LSR
	EOR #$FF
	SEC : SBC #$F1
	STA !MsgXPosRam

	LDA #$00
	STA !MsgYPosRam

	LDA #$00
	STA !X_Offset
	STA !Y_Offset
	LDX #$0000
	REP #$20
.Loop
	SEP #$20
	LDA #$00
	XBA
	LDA !X_Offset			; Load !X_Offset
	CLC : ADC !MsgXPosRam		; Add !MsgXPosRam
	REP #$20
	ASL #$03			; Shift 3 bits to left
	CLC : ADC $0A			; Layer 3's X Position
	CLC : ADC #$000C		; Add $0C
	LSR #$03			; Shift 3 bits to right
	AND #%0000000000011111		; Bring 0-4 Bit
	STA !Tiles_Position,x
	SEP #$20

	LDA $07				; 
	AND #%00000001			; If Current Layer's width is 64 tiles
	BEQ +				; 
	LDA #$00
	XBA
	LDA !X_Offset			; Load !X_Offset
	CLC : ADC !MsgXPosRam		; Add !MsgXPosRam
	REP #$20
	ASL #$03			; Shift 3 bits to left
	CLC : ADC $0A			; Layer 3's X Position
	CLC : ADC #$000C		; Add $0C
	ASL #$02			; Shift 2 bits to left
	AND #%0000010000000000		; Bring A Bit
	ORA !Tiles_Position,x
	STA !Tiles_Position,x
	SEP #$20
	+

	LDA #$00
	XBA
	LDA !Y_Offset			; Load !Y_Offset
	CLC : ADC !MsgYPosRam		; Add !MsgYPosRam
	REP #$20
	ASL #$03			; Shift 3 bits to left
	CLC : ADC $0C			; Layer 3's Y Position
	CLC : ADC #$002F		; Add $2F
	ASL #$02			; Shift 2 bits to left
	AND #%0000001111100000		; Bring 5-9 Bit
	ORA !Tiles_Position,x
	STA !Tiles_Position,x
	SEP #$20

	LDA $07				; 
	AND #%00000010			; If Current Layer's height is 64 tiles
	BEQ +
	LDA #$00
	XBA
	LDA !Y_Offset			; Load !Y_Offset
	CLC : ADC !MsgYPosRam		; Add !MsgYPosRam
	REP #$20
	ASL #$03			; Shift 3 bits to left
	CLC : ADC $0C			; Layer 3's Y Position
	CLC : ADC #$002F		; Add $2F
	ASL #$03			; Shift 3 bits to left
	AND #%0000100000000000		; Bring B Bit
	ORA !Tiles_Position,x
	STA !Tiles_Position,x
	SEP #$20
	+
	REP #$20
	LDA !Tiles_Position,x
	CLC : ADC $08
	STA !Tiles_Position,x
	SEP #$20

	LDA !X_Offset
	CLC : ADC #$01
	STA !X_Offset

	LDA !X_Offset
	CMP !MsgWidthRam			; If !X_Offset > !MsgWidthRam
	BPL +
	JMP ..Skip
	+

	LDA #$00
	STA !X_Offset

	LDA !Y_Offset
	CLC : ADC #$01
	STA !Y_Offset

..Skip
	REP #$20
	INX #$0004
	TXA
	LSR #$02
	CMP !Tiles_Count_RAM
	BPL +
	JMP .Loop
	+

	SEP #$30

	RTS

BG_Tilemap_Address:
	dw $3000,$3800,$5000,!Layer4_Tile_Address

BG_Tilemap_Size:
	;  BG1 BG2 BG3 BG4
	db $01,$01,$03,$01	; $00 = 32×32, $01 = 32×64, $02 = 64×32, $03 = 64×64

Set_BG_Pos:
	LDY #$14
	LDA [!Table_Index],y
	AND #%00000011
	ASL #$02 : TAX
	
	REP #$20
	LDA $1A,x
	STA $0A
	LDA $1C,x
	STA $0C
	SEP #$20
	RTS
;===== DMA Routine ======

Backup_Tiles:
	;     i---mmii
	LDA #%10000000
	STA $2115

	LDA #$00
	XBA
	LDA !ControlBox
	SEC : SBC #$05
	REP #$30
	ASL #$06
	TAX
	LDY #$0000
.Loop
	TXA
	LSR #$01
	CMP !Tiles_Count_RAM
	BMI +
	JMP .Brake
	+
	ASL #$02
	TAX

	LDA !Tiles_Position,x
	STA $2116
	
	TXA
	LSR #$01
	TAX

	LDA $2139
	STA !Tiles_Backup,x

	INX #$0002
	INY #$0001

	TYA
	CMP #$0020
	BPL +
	JMP .Loop
	+
.Brake
	SEP #$30
	RTS

Drawing_Tiles:

	LDY #$10
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgHeightRam

	LDY #$11
	LDA [!Table_Index],y
	CLC : ADC #$02
	STA !MsgWidthRam

	;     i---mmii
	LDA #%10000000
	STA $2115

	REP #$20

	LDA #$1604			; register 2116, mode 4
	STA $4300			; random DMA channel
	LDA #!Tiles_Position
	STA $4302
	SEP #$20
	LDA #!Tiles_Position>>16
	STA $4304
	REP #$20
	LDA !Tiles_Count_RAM		; Bytes.
	ASL #$02
	STA $4305
	SEP #$20

	LDA #%00000001
	STA $420B			; enable channel 1

	RTS