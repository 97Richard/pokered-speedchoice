PermaOptions2String::
	db "DELAYS<LNBRK>"
	db "        :<LNBRK>"
	db "METRONOME ONLY<LNBRK>"
	db "        :<LNBRK>"
	db "SHAKE MOVES<LNBRK>"
	db "        :<LNBRK>"
	db "EXPERIENCE<LNBRK>"
	db "        :<LNBRK>"
	db "GOOD EARLY WILDS<LNBRK>"
	db "        :<LNBRK>"
	db "BETTER MARTS<LNBRK>"
	db "        :<LNBRK>"
	db "SELECT TO<LNBRK>"
	db "        :@"

PermaOptions2Pointers::
	dw Options_Delays
	dw Options_MetronomeOnly
	dw Options_ShakeMoves
	dw Options_EXP
	dw Options_GoodEarlyWilds
	dw Options_BetterMarts
	dw Options_SelectTo
	dw Options_PermaOptionsPage
	
Options_Delays:: ; 3
	ld hl, SHORT_DELAYS_ADDRESS
	ld b, SHORT_DELAYS
	ld c, 3
	ld de, .NormalFast
	jp Options_TrueFalse
.NormalFast
	dw .Off
	dw .On
.Off
	db "NORMAL@"
.On
	db "FAST  @"
	
Options_MetronomeOnly:: ; 5
	ld hl, METRONOME_ONLY_ADDRESS
	ld b, METRONOME_ONLY
	ld c, 5
	jp Options_OnOff
	
Options_ShakeMoves::
	ld hl, ALL_MOVES_SHAKE_ADDRESS
	ld b, ALL_MOVES_SHAKE
	ld c, 7
	ld de, .NormalAll
	jp Options_TrueFalse
.NormalAll
	dw .Off
	dw .On
.Off
	db "NORMAL@"
.On
	db "ALL   @"
	
Options_EXP:
	ld hl, .Data
	jp Options_Multichoice
	
.Data:
	multichoiceoptiondata EXP_FORMULA_ADDRESS, EXP_FORMULA_SHIFT, EXP_FORMULA_SIZE, 9, NUM_OPTIONS, .Strings
.Strings:
	dw .Normal
	dw .BW
	dw .None
.Strings_End:
	
.Normal
	db "NORMAL@"
.BW
	db "B/W   @"
.None
	db "NONE  @"
	
Options_GoodEarlyWilds:: ; 11
	ld hl, GOOD_EARLY_WILDS_ADDRESS
	ld b, GOOD_EARLY_WILDS
	ld c, 11
	jp Options_OnOff
	
Options_BetterMarts::
	ld hl, BETTER_MARTS_ADDRESS
	ld b, BETTER_MARTS
	ld c, 13
	jp Options_OnOff
	
Options_SelectTo:: ; 15
	ld hl, .Data
	jp Options_Multichoice
	
.Data:
	multichoiceoptiondata SELECTTO_ADDRESS, SELECTTO_SHIFT, SELECTTO_SIZE, 15, NUM_OPTIONS, .Strings
.Strings:
	dw .None
	dw .Bike
	dw .Jack
.Strings_End:
	
.None
	db "NONE@"
.Bike
	db "BIKE@"
.Jack
	db "JACK@"
