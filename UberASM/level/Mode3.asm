!SpritePriority		= 1	;If set to 0, Priority-enabled foreground not obscures the player

!Tile16x16		= 1	;If set to 1, Set tile size as 16x16
!Intro			= 1	;If set to 1, it will be disabled in the intro.
!TileMirroring		= $02	;00 = 32x32, 01 = 32x64, 02 = 64x32, 03 = 64x64
!DirectColorMode	= 1	;If set to 1, Enable Direct Color Mode



init:


if !Intro

LDA $71
CMP #$0A
BEQ .NoChange

endif

if !Tile16x16
!SET16	= $10
else
!SET16	= $00
endif

LDA.b #$03+!SET16	; \ mode 3
STA.b $3E		; /


LDA #%00111000+!TileMirroring		; \ Swap Layer 1 and Layer 2 tilemap
STA $2107				; /
LDA #%00110001				; \ Swap Layer 2 and Layer 1 tilemap
STA $2108				; /

LDA #$01 
STA $1413|!addr

LDA #$01 
STA $1414|!addr

LDA #$00
STA $1417|!addr

;---S4321
LDA.b #%00010010	; \  sprites & layer 2
STA.w $212C		;  | on MainScreen
STA.w $212E		; /
LDA.b #%00000001	; \  layer 1
STA.w $212D		;  | on SubScreen
STA.w $212F		; /

if !DirectColorMode
LDA $44
ORA #%00000001		;Set direct color mode
STA $44
endif

if !SpritePriority
LDA #%00000000
STA $64
endif

REP #$20		; Set layer 1 scroll as layer 3 scroll
LDA #$0D43
STA $4330
LDA.w #.table
STA $4332
SEP #$20
LDA.b #.table>>16
STA $4334
STA $4337
LDA #$08
TSB $0D9F|!addr

.NoChange

RTL

.table
db $01 : dw $0022|!dp
db $00

main:
LDA $1887|!addr			;\ Layer 2 Earthquake Effect
CMP #$01			;|
BMI .Skip01			;|

LDA $1887|!addr			;|
AND #%00000001			;|
BNE .Skip01			;|

LDA $1887|!addr			;|
AND #%00000010			;|
BEQ .Skip02			;|

LDA #$02			;|
STA $1417|!addr			;|
JMP .return00			;|

.Skip02				;|
LDA #$FE			;|
STA $1417|!addr			;|
JMP .return00			;|

.Skip01				;|
LDA #$00			;|
STA $1417|!addr			;/

.return00

RTL
