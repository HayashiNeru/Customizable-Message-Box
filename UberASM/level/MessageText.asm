table "MessageCharList.txt"

;The length of all messages must be a multiple of 256!(Including header) And if a message exceeds 256 bytes, the message with the next number cannot be used.

;$F0~$F7 is Set text's color.

Messages:
	   ;Width = 18 characters
	   ;Height = 8 characters
	   ;123456789012345678
Msg0000:
	  ; ↖  ↑  ↗  ←  →  ↙  ↓  ↘
	db $D0,$D1,$D0,$E0,$E0,$D0,$D1,$D0	;Box Frame Tile
	db $3D,$3D,$7D,$3D,$7D,$BD,$BD,$FD	;Box Frame Prop(YXPCCCTT)

	  ;  H   W
	db $08,$12	;H = Height/W = Width

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; ???????
	db $00,$00,$00,$00
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
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00

Msg0001:
	  ; ↖  ↑  ↗  ←  →  ↙  ↓  ↘
	db $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F	;Box Frame Tile
	db $39,$39,$39,$39,$39,$39,$39,$39	;Box Frame Prop(YXPCCCTT)

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; ???????
	db $00,$00,$00,$00
	
	db "Sorry.  This  code"
	db "might    ",$F2,"spaghetti"
	db "code.             ",$F6
	db "                  "
	db "Now, This ASM code"
	db "can use  up to 256"
	db "messages       per"
	db "level.            "
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00

Msg0002:
;	This message is exceeds 256 bytes. So there is no Msg03 here, this message takes up 512 bytes.
	  ; ↖  ↑  ↗  ←  →  ↙  ↓  ↘
	db $D0,$D1,$D0,$E0,$E0,$D0,$D1,$D0	;Box Frame Tile
	db $2D,$2D,$6D,$2D,$6D,$AD,$AD,$ED	;Box Frame Prop(YXPCCCTT)

	  ;  H   W
	db $0C,$1C	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00101101

	  ; Blank tile
	db $1F

	  ; ???????
	db $00,$00,$00,$00
	
	db $93,$A7,$A8,$B2,$9F,$A8,$B2,$9F,$B3,$A7,$A4,$9F,$9F,$AB,$A0,$B1,$A6,$A4,$B2,$B3,$9F,$AC,$A4,$B2,$B2,$A0,$A6,$A4
	db $A1,$AE,$B7,$9B,$9F,$93,$A7,$A4,$9F,$B2,$A8,$B9,$A4,$9F,$A4,$B7,$A2,$AB,$B4,$A3,$A8,$AD,$A6,$9F,$A8,$B3,$BD,$B2
	db $A1,$AE,$B1,$A3,$A4,$B1,$9F,$9F,$A8,$B2,$9F,$9F,$C5,$CB,$B7,$C4,$C5,$9B,$9F,$9F,$80,$AD,$A3,$9F,$9F,$B3,$A7,$A4
	db $AC,$A0,$B7,$A8,$AC,$B4,$AC,$9F,$AD,$B4,$AC,$A1,$A4,$B1,$9F,$AE,$A5,$9F,$A2,$A7,$A0,$B1,$A0,$A2,$B3,$A4,$B1,$B2
	db $A8,$B2,$9F,$C6,$C6,$C9,$9B,$9F,$9F,$9F,$88,$B3,$9F,$9F,$9F,$B4,$B2,$A8,$AD,$A6,$9F,$9F,$B2,$B3,$B1,$A8,$AF,$A4
	db $A8,$AC,$A0,$A6,$A4,$9F,$B3,$A0,$A1,$AB,$A4,$9B,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $96,$A7,$A4,$AD,$9F,$A0,$9F,$9F,$AC,$A4,$B2,$B2,$A0,$A6,$A4,$9F,$9F,$A1,$AE,$B7,$9F,$B3,$A7,$A0,$B3,$9F,$A8,$B2
	db $B3,$AE,$AE,$9F,$AB,$A0,$B1,$A6,$A4,$9F,$AE,$AF,$A4,$AD,$B2,$9D,$9F,$9F,$B3,$A7,$A4,$9F,$B2,$A2,$B1,$A4,$A4,$AD
	db $A1,$B1,$A8,$A4,$A5,$AB,$B8,$9F,$A1,$AB,$A8,$AD,$AA,$B2,$9B,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F
	db $9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F,$9F




	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

Msg0003:
Msg0004:
	  ; ↖  ↑  ↗  ←  →  ↙  ↓  ↘
	db $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F	;Box Frame Tile
	db $39,$39,$39,$39,$39,$39,$39,$39	;Box Frame Prop(YXPCCCTT)

	  ;  H   W
	db $08,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; ???????
	db $00,$00,$00,$00
	
	db "I  don't know  how"
	db "to  run   a  table"
	db "within a  table in"
	db "a loop statement. "
	db "And  I  can't  fix"
	db "yoshi tongue's bug"
	db "                  "
	db "                  "
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00

Msg0005:
	  ; ↖  ↑  ↗  ←  →  ↙  ↓  ↘
	db $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F	;Box Frame Tile
	db $39,$39,$39,$39,$39,$39,$39,$39	;Box Frame Prop(YXPCCCTT)

	  ;  H   W
	db $07,$12	;H = Height/W = Width,

      ;Text YXPCCCTT
	db %00111001

	  ; Blank tile
	db $1F

	  ; ???????
	db $00,$00,$00,$00
	
	db "ABCDEFGHIJKLMNOPQ"
	db "RSTUVWXYZ01234567"
	db "                 "
	db "Aww!!            "
	db "                 "
	db "F0~F7 = Change   "
	db "text color.      "
	db "                 "
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
Msg0006:
Msg0007:
Msg0008:
Msg0009:
Msg000A:
Msg000B:
Msg000C:
Msg000D:
Msg000E:
Msg000F:
