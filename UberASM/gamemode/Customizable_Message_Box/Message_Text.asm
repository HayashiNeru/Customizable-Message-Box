table "Message_Char_List.txt"

;The length of all messages must be a multiple of 256!(Including header) And if a message exceeds 256 bytes, the message with the next number cannot be used.

;$F0-$F7 is Set text's color.


	   ;Width = 18 characters
	   ;Height = 8 characters
	   ;123456789012345678
Msg0000:
	; Box Frame Tile
	db $D0,$D1,$D0
	db $E0,    $E0
	db $D0,$D1,$D0

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111101,%00111101,%01111101
	db %00111101,          %01111101
	db %10111101,%10111101,%11111101

	  ;  H   W
	db $08,$12	;H = Height/W = Width

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000010

	  ; ???????
	db $00,$00


;	End header
;	Text start
	db "This    is     not"
	db "original   message"
	db "box.              ",$F7
	db "I think ASM  isn't"
	db "useful  other than"
	db "hacking  old  game"
	db "ROMs.             ",$F6
	db "I'm ASM beginner. "
	db $FF

Msg0001:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111001,%00111001,%00111001
	db %00111001,          %00111001
	db %00111001,%00111001,%00111001

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F


	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000010

	  ; ???????
	db $00,$00
	
	db "Sorry.  This  code"
	db "might    ",$F2,"spaghetti"
	db "code.             ",$F6
	db "                  "
	db "Now, This ASM code"
	db "can use  up to 256"
	db "messages       per"
	db "level.            "
	db $FF

Msg0002:
	; Box Frame Tile
	db $D0,$D1,$D0
	db $D2,    $D2
	db $D0,$D1,$D0

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111010,%00111010,%01111010
	db %00111010,          %01111010
	db %10111010,%10111010,%11111010

	  ;  H   W
	db $0C,$1C	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111010

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000000

	  ; ???????
	db $00,$00
	
	db $93,$A7,$A8,$B2,$9F,$A8,$B2,$9F,$B3,$A7,$A4,$9F,$9F,$AB,$A0,$B1,$A6,$A4,$B2,$B3,$9F,$AC,$A4,$B2,$B2,$A0,$A6,$A4
	db $A1,$AE,$B7,$9B,$9F,$93,$A7,$A4,$9F,$B2,$A8,$B9,$A4,$9F,$A4,$B7,$A2,$AB,$B4,$A3,$A8,$AD,$A6,$9F,$A8,$B3,$BD,$B2
	db $A1,$AE,$B1,$A3,$A4,$B1,$9F,$9F,$A8,$B2,$9F,$9F,$C5,$CB,$B7,$C4,$C5,$9B,$9F,$9F,$80,$AD,$A3,$9F,$9F,$B3,$A7,$A4
	db $AC,$A0,$B7,$A8,$AC,$B4,$AC,$9F,$AD,$B4,$AC,$A1,$A4,$B1,$9F,$AE,$A5,$9F,$A2,$A7,$A0,$B1,$A0,$A2,$B3,$A4,$B1,$B2
	db $A8,$B2,$9F,$C6,$C6,$C9,$9B,$9F,$88,$B3,$9F,$B4,$B2,$A8,$AD,$A6,$9F,$83,$8C,$80,$9F,$8C,$AE,$A3,$A4,$9F,$C7,$9B
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $96,$A7,$A4,$AD,$9F,$A0,$9F,$9F,$B3,$A7,$A4,$9F,$AB,$A0,$B1,$A6,$A4,$B2,$B3,$9F,$9F,$AC,$A4,$B2,$B2,$A0,$A6,$A4
	db $A1,$AE,$B7,$9F,$9F,$9F,$AE,$AF,$A4,$AD,$A4,$A3,$9D,$9F,$9F,$B3,$A7,$A4,$9F,$9F,$9F,$9F,$B2,$A2,$B1,$A4,$A4,$AD
	db $A8,$B2,$AD,$BD,$B3,$9F,$A1,$AB,$A8,$AD,$AA,$B2,$9B,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F

	db $FF

Msg0003:
	; Box Frame Tile
	db $20,$21,$22
	db $23,    $24
	db $25,$26,$27

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00110110,%00110110,%00110110
	db %00110110,          %00110110
	db %00110110,%00110110,%00110110

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00110110

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000001

	  ; ???????
	db $00,$00
	
	db "Wait, what  if the"
	db "message   box   is"
	db "4bpp?             "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db $FF

Msg0004:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F	;Box Frame Tile

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111001,%00111001,%00111001
	db %00111001,          %00111001
	db %00111001,%00111001,%00111001

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000010

	  ; ???????
	db $00,$00
	
	db "Now  I   know  how"
	db "to  run   a  table"
	db "within a  table in"
	db "a loop statement. "
	db "But  I  can't  fix"
	db "yoshi tongue's bug"
	db "                  "
	db "                  "
	db $FF

Msg0005:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F	;Box Frame Tile

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111001,%00111001,%00111001
	db %00111001,          %00111001
	db %00111001,%00111001,%00111001

	  ;  H   W
	db $08,$11	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000010

	  ; ???????
	db $00,$00
	
	db "ABCDEFGHIJKLMNOPQ"
	db "RSTUVWXYZ01234567"
	db "                 "
	db "Aww!!            "
	db "                 "
	db "F0-F7 is Change  "
	db "text color.      "
	db "                 "
	db $FF
Msg0006:
	; Box Frame Tile
	db $5A,$5B,$5A
	db $6A,    $6A
	db $5A,$5B,$5A

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111110,%00111110,%01111110
	db %00111110,          %01111110
	db %10111110,%10111110,%11111110

	  ;  H   W
	db $0A,$1A	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111110

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000000

	  ; ???????
	db $00,$00
	
	db $F4,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$F7,$1F,$13,$27,$28,$32,$1F,$1F,$1F,$1F,$2C,$24,$32,$32,$20,$26,$24
	db $F4,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$F7,$1F,$21,$2E,$37,$1F,$20,$2F,$2F,$24,$20,$31,$24,$23,$1F,$2E,$2D
	db $F4,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$F7,$1F,$0B,$20,$38,$24,$31,$1F,$1F,$44,$1B,$1F,$1F,$00,$2B,$32,$2E
	db $F4,$80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$F7,$1F,$13,$27,$28,$32,$1F,$2B,$24,$35,$24,$2B,$1F,$1F,$34,$32,$24
	db $F4,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$F7,$1F,$0C,$2E,$23,$24,$1F,$46,$1F,$1F,$3B,$03,$28,$31,$24,$22,$33
	db $F4,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$F7,$1F,$22,$2E,$2B,$2E,$31,$1F,$2C,$2E,$23,$24,$3C,$1D,$1F,$32,$2E
	db $F4,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$F7,$1F,$33,$27,$28,$32,$1F,$1F,$1F,$1F,$2C,$24,$32,$32,$20,$26,$24
	db $F4,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$F7,$1F,$21,$2E,$37,$1F,$20,$2B,$32,$2E,$1F,$4B,$21,$2F,$2F,$1B,$1F
	db $F4,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$F7,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
	db $F4,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$F7,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F

	db $FF
Msg0007:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F	;Box Frame Tile

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111010,%00111010,%00111010
	db %00111010,          %00111010
	db %00111010,%00111010,%00111010

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111010

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000001

	  ; ???????
	db $00,$00
	
	db "Mode 2 and 3 isn't"
	db "have a 2bpp layer."
	db "Therefore,    this"
	db "message box cannot"
	db "be 2bpp either.   "
	db "                  "
	db "                  "
	db "                  "
	db $FF
Msg0008:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F	;Box Frame Tile

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111010,%00111010,%00111010
	db %00111010,          %00111010
	db %00111010,%00111010,%00111010

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111010

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000000

	  ; ???????
	db $00,$00
	
	db "This level is Mode"
	db "2.                "
	db "Message      boxes"
	db "can't be displayed"
	db "on    BGs     with"
	db "Offset-per-Tile   "
	db "applied.          "
	db "                  "
	db $FF
Msg0009:
	; Box Frame Tile
	db $1F,$1F,$1F
	db $1F,    $1F
	db $1F,$1F,$1F

	; Box Frame Prop
	;   YXPCCCTT  YXPCCCTT  YXPCCCTT
	db %00111001,%00111001,%00111001
	db %00111001,          %00111001
	db %00111001,%00111001,%00111001

	  ;  H   W
	db $0A,$1A	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; Layer(L1=00, L2=01, L3=10, L4=11)
	  ;       LL
	db %00000010

	  ; ???????
	db $00,$00
	
	db "This level is Mode 0.     "
	db "That's  why  4bpp  message"
	db "boxes  can't  be  used  at"
	db "this level.               "
	db "                          "
	db "                          "
	db "                          "
	db "                          "
	db "                          "
	db "                          "
	db $FF
Msg000A:
Msg000B:
Msg000C:
Msg000D:
Msg000E:
Msg000F: