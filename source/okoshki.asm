.486
.MODEL flat, stdcall
option casemap:none

includelib user32.lib
includelib kernel32.lib
includelib Winmm.lib
includelib gdi32.lib
includelib ole32.lib
includelib Advapi32.lib
includelib Oleaut32.lib

include windows.inc
include user32.inc
include kernel32.inc
include language.inc
include Gdi32.inc
include macros.asm
include ole32.inc
include Advapi32.inc
include oaidl.inc
include Oleaut32.inc

extern GetStdHandle@4:NEAR
;extern ExitProcess@4:near
;extern WriteConsoleA@20:near
;extern Sleep@4:near
;extern timeSetEvent@20:near

;extern wsprintfA:near
;extern GetCommandLineA@0:near			;kernel32
;extern GetCursorPos@4:near
;extern GetDC@4:near
;extern GetDesktopWindow@0:near
;extern GetPixel@12:near
;extern GetShellWindow@0:near
;extern mouse_event@20:near
;extern SetConsoleCursorPosition@8:near
extern GlobalAlloc@8:near			;kernel32
extern GlobalLock@4:near			;kernel32
extern MultiByteToWideChar@24:near		;kernel32 	перевод сторок к юникоду
extern CLSIDFromString@8:near			;ole32 		получение CLSID по UNICOD строке
extern ProgIDFromCLSID@8:near			;ole32
;extern timeGetTime@0:near
extern WideCharToMultiByte@32:near		;kernel32 	перевод сторок из юникода
extern CLSIDFromProgID@8:near			;ole32
extern StringFromCLSID@8:near
extern RegOpenKeyExA@20:near
extern lstrcpyA@8:near
extern RegQueryValueExA@24:near
extern CharToOemA@8:near
extern CoInitialize@4:near
extern IIDFromString@8:near
extern CoCreateInstance@20:near
extern CoUninitialize@0:near
extern RegCloseKey@4:near
extern RegEnumKeyExA@32:near
extern GlobalFree@4:near

;SetSysColors

CsStyl	equ CS_VREDRAW + CS_HREDRAW + CS_GLOBALCLASS  ;CS_BYTEALIGNWINDOW

;///-----
ANT_ed1_x	equ	69  ;65
ANT_ed1_y	equ	10
ANT_ed1_x1	equ	650
ANT_ed1_y1	equ	19
;-----

WINDOWINFO STRUCT

	cbSize	  DWORD	? ;
    	rcWindow  RECT 	<?>;
    	rcClient  RECT 	<?>;
    	dwStyle   DWORD ?;
    	dwExStyle DWORD ?;
   dwWindowStatus DWORD ?;
  cxWindowBorders UINT 	?;
  cyWindowBorders UINT 	?;
   atomWindowType ATOM	?;
  wCreatorVersion WORD 	?;


WINDOWINFO ENDS

Obris 		PROTO :DWORD
AntWimMin	PROTO :DWORD, :DWORD, :DWORD
;wsprintf	PROTO :DWORD, :DWORD, :DWORD

.data
	WCst	 WNDCLASSEX	<?>
	MSGw1	 MSG	<?>

	HINST	dd	0
	WCstNam	db	"Wcls1", 0
	Wnam	db	"oko", 0
	strEr1A	db	"Erorr!!!", 0
	WCedit	db	"EDIT",0
	str001	db	"Object: ", 0
	str002	db	"->",0
	strPust	db	0
	vZagol	db	"Necromantus (c) bot007 version 2.03", 0
	StrIUn	db	"{00000000-0000-0000-C000-000000000046}", 0
	strAD	db	0Dh, 0Ah, 0
	strEr1	db	"Class ", 0
	strEr2	db	" not registred", 0
	s	db	"\", 0
	dntch	db	": ", 0
	strnet	db	"---", 0
	strsp1	db	" - ", 0
	strSK1	db	"CLSID", 0
	strclo	db	"CLSID:  ", 0
	strPGo	db	"ProgID: ", 0
	strNmo	db	"Name:   ", 0
	StrDl1	db	"Dll's: ", 0
	StrDl2	db	"InprocServer32", 0
	StrDl3	db	"LocalServer32", 0
	Str1	db	"Create object... ", 0
	StrOK	db	"OK", 0
	StrFL	db	"Fail", 0
	StrInt	db	"Interface", 0
	strdis1	db	"Dispach not suported", 0
	strdis2	db	"Dispach:", 0
	strdis3	db	"  %1u Function's",0
	strdis4	db	"  %1u Var's",0
	strdis5	db	"  %1u Type's",0
	strdis6	db	" - Functions:",0
	strdis7	db	"  %1u) ",0
	strdis8	db	"  * ",0
	strdis9	db	"VIRTUAL",0
	strdis10	db	"PUREVIRTUAL",0
	strdis11	db	"NONVIRTUAL",0
	strdis12	db	"STATIC",0
	strdis13	db	"DISPATCH",0
	strdis14	db	"FUNC",0
	strdis15	db	"PROPERTYGET",0
	strdis16	db	"PROPERTYPUT",0
	strdis17	db	"PROPERTYPUTREF",0

	Whdl	dd	0
	Whedit1	dd	0
	Whedit2	dd	0
	Whbtn1	dd	0

	strCL	dd	?
	strPG	dd	?
	hkey1	dd	?
	strNm	dd	?
	ObjIUn	dd	?

	CLSID1	GUID	<?>
	IdespIn	GUID	sIID_IDispatch
	IUnkn	GUID	sIID_IUnknown
	
	WCBUTT	db	"BUTTON",0
;-----------------------------------------
	TMPrect	RECT	<?>
;	TMPpnt 	POINT	<?>
;		dd	0
;	TMPINF1	WINDOWINFO <?>
;	mass1	dd	COLOR_BTNTEXT

;	mass2	dd	0


.code

main 	proc
	invoke	GetModuleHandle, NULL
	mov	HINST,	EAX
	mov	WCst.hInstance, EAX
	invoke	CoInitialize, 0
	mov	WCst.style, CsStyl
	mov	WCst.lpfnWndProc, offset WProc1
	invoke	LoadCursor, NULL, IDC_ARROW
	mov	WCst.hCursor, EAX
	mov	WCst.lpszClassName, offset WCstNam
	RGB 0, 0, 5
	;RGB 200, 200, 200

	invoke	CreateSolidBrush, EAX
	mov	WCst.hbrBackground, EAX
	mov	WCst.cbSize, sizeof WNDCLASSEX
	invoke	LoadIcon, NULL, IDI_WINLOGO
	mov	WCst.hIcon, EAX
	mov	WCst.hIconSm, EAX

	invoke	RegisterClassEx, offset WCst
	;------------цвет окон
;	RGB 0, 0, 0
;	mov	mass2,	EAX
;	invoke	SetSysColors, 1, offset mass1, offset mass2

	;----------------
	invoke	CreateWindowEx, NULL, offset WCstNam, offset vZagol, WS_OVERLAPPEDWINDOW or WS_THICKFRAME, 1, 1, 790, 400, NULL, NULL, HINST, NULL
	cmp	EAX,	0
	jnz	dle1
	call	ERROps
	jmp	EXT

dle1: 	invoke	ShowWindow, Whdl, SW_SHOWNORMAL
	invoke	UpdateWindow, Whdl

Tskl:	invoke	GetMessage, offset MSGw1, NULL, NULL, NULL
	cmp	EAX,	0
	jz	EXT
	invoke	TranslateMessage, offset MSGw1
	invoke	DispatchMessage, offset MSGw1
	jmp	Tskl


EXT:	invoke	CoUninitialize
	invoke	ExitProcess, NULL


main 	endp
;-----------------
Obris	proc hWinC :DWORD
	local	y2	:DWORD
	local	x2	:DWORD
	local	y1	:DWORD
	local	x1  	:DWORD
	local	HDC1 	:DWORD
	local	hWinP 	:DWORD

	invoke	GetParent, hWinC
	mov	hWinP,	EAX
	invoke	GetWindowRect, hWinC, addr x1
	invoke	ScreenToClient, hWinP, addr x1
	invoke	ScreenToClient, hWinP, addr x2
	invoke  GetDC, hWinP
	mov	HDC1,	EAX
	dec	x1
	dec	y1
	inc	x2
	inc	y2
	RGB 50, 200, 50
	invoke  CreatePen, PS_SOLID, 0, EAX
	invoke  SelectObject, HDC1, EAX
	invoke	MoveToEx, HDC1, x1, y1, 0
	invoke	LineTo, HDC1, x2, y1
	invoke	LineTo, HDC1, x2, y2
	invoke	LineTo, HDC1, x1, y2
	invoke	LineTo, HDC1, x1, y1

	ret 8
Obris	endp
;-----------------------------------
WProc1	proc USES esi edi ebx, hWin   :DWORD,
             uMsg   :DWORD,
             wParam :DWORD,
             lParam :DWORD

.if uMsg == WM_CREATE
	mov	EAX,	hWin
	mov	Whdl,	EAX
	invoke	CreateWindowEx, NULL, offset WCedit, 0, WS_VISIBLE or WS_CHILD, ANT_ed1_x, ANT_ed1_y, ANT_ed1_x1, ANT_ed1_y1, hWin, 2h, HINST, NULL
	mov	Whedit1, EAX
	invoke	CreateWindowEx, NULL, offset WCedit, 0, WS_VISIBLE or WS_CHILD or ES_MULTILINE or ES_AUTOHSCROLL or ES_AUTOVSCROLL, 10d, 40d, 750d, 300d, hWin, 3h, HINST, NULL
	mov	Whedit2, EAX
	invoke	CreateWindowEx, NULL, offset WCBUTT, offset str002, WS_VISIBLE or WS_CHILD, 725, 7, 40, 24, hWin, 3h, HINST, NULL
	mov	Whbtn1,	EAX
	mov	EAX,	0h
.else
	mov	EAX,	Whdl
 .if hWin == EAX
  .if uMsg == WM_CTLCOLORBTN
	jmp	CTCT1
  .elseif uMsg == WM_CTLCOLOREDIT
CTCT1:	RGB 50, 200, 50
	invoke  SetTextColor, wParam, EAX
	RGB 0, 0, 5
	push EAX
	invoke  SetBkColor, wParam, EAX
	pop EAX
	invoke	CreateSolidBrush, EAX
  .elseif uMsg == WM_PAINT
	invoke	GetWindowRect, Whdl, offset TMPrect
	invoke	AntWimMin, offset TMPrect, 500d, 300d

	invoke	Obris, Whedit1
	invoke	Obris, Whedit2
	invoke  GetDC, hWin
	mov	wParam, EAX
	RGB 50, 200, 50
	invoke  SetTextColor, wParam, EAX
	RGB 0, 0, 5
	invoke  SetBkColor, wParam, EAX
	invoke  TextOut, wParam, 10, 10, offset str001, 8
	jmp	def1

  .elseif uMsg == WM_COMMAND
	mov	EDI,	wParam
	mov	EBX,	wParam
	shr	EBX,	16d
	mov	EAX,	lParam

   .if EAX == Whbtn1
    .if BX == BN_CLICKED
	invoke	SetWindowText, Whedit2, offset strPust
	call	mine2

    .endif
   .endif
	mov	EAX,	0

  .elseif uMsg == WM_SIZING
	invoke	AntWimMin, lParam, 500d, 300d
	jmp	def1
  .elseif uMsg == WM_DESTROY
	invoke PostQuitMessage, NULL
	mov	EAX,	0h
  .else
	jmp	def1
  .endif
 .else
def1:	invoke DefWindowProc, hWin, uMsg, wParam, lParam
 .endif
.endif
	ret 16
WProc1	endp
;-----------------------------------
AntWimMin proc USES ebx, LpRec :DWORD, Xmin :DWORD, Ymin :DWORD
	local Xr	:DWORD
	local Yr	:DWORD

	mov	ebx,	LpRec
	mov	EAX,	[ebx][8]
	sub	EAX,	[ebx]
.if EAX > Xmin
	mov	Xmin,	EAX
.endif
	mov	EAX,	[ebx][12]
	sub	EAX,	[ebx][4]
.if EAX > Ymin
	mov	Ymin,	EAX
.endif
	mov	EAX,	[ebx]
	add	EAX,	Xmin
	mov	[ebx][8], EAX
	mov	EAX,	[ebx][4]
	add	EAX,	Ymin
	mov	[ebx][12], EAX
	;Передвинем контролы
	mov	EAX,	Xmin
	sub	EAX,	140
	invoke	MoveWindow, Whedit1, ANT_ed1_x, ANT_ed1_y, EAX, ANT_ed1_y1, TRUE
 	mov	EAX,	Xmin
	sub	EAX,	65
	invoke	MoveWindow, Whbtn1, EAX, 7, 40, 24, TRUE
	push	TRUE
	mov	EAX,	Ymin
	sub	EAX,	100
	push	EAX
 	mov	EAX,	Xmin
	sub	EAX,	40
	push	EAX
	push	40d
	push	10d
	push	Whedit2
	call	MoveWindow
;	invoke	UpdateWindow, Whdl

	ret 12
AntWimMin endp
;-----------------------------------
ERROps	proc
	push	EBP
	mov	EBP,	ESP
	push	0			;-4 буфер ошибки
	push	0			;-8 код ош
	push	0			;-12 язык

	invoke	GetLastError
	mov	[EBP][-8d],	EAX
	mov	EAX,	EBP
	sub	EAX,	4d

	invoke	FormatMessage, FORMAT_MESSAGE_ALLOCATE_BUFFER + FORMAT_MESSAGE_FROM_SYSTEM, NULL, [EBP][-8d], LANG_USER_DEFAULT, EAX, NULL, NULL

	mov	EAX,	EBP
	sub	EAX,	4d

	invoke	MessageBox, NULL, EAX, offset strEr1A, MB_OK

	mov	ESP,	EBP
	pop	EBP
	ret
ERROps	endp
;-----------------------
Napisat	proc lpStr1 :DWORD
	local	lng1	:DWORD
	local	lng2	:DWORD
	local	buf1	:DWORD
;Whedit2
	invoke	GetWindowTextLength, Whedit2
	mov	lng1,	EAX
	mov	lng2,	EAX
	invoke	lstrlen, lpStr1
	add	lng1,	EAX
	inc	lng1
	inc	lng2
	invoke	GlobalAlloc, GMEM_ZEROINIT, lng1
	mov	buf1,	EAX
	invoke	GetWindowText, Whedit2, buf1, lng2
	mov	EAX,	buf1
	dec	lng2
	add	lng2,	EAX
	invoke	lstrcpy, lng2, lpStr1
	invoke	SetWindowText, Whedit2, buf1
	invoke	GlobalFree, buf1
	invoke	UpdateWindow, Whdl

	ret	4
Napisat	endp
;-----------------------
;----------StrLn-----------------
StrLn	proc
	push	EBP
	mov	EBP,	ESP
	mov	EBX,	DWORD ptr [ESP + 8]
	mov	EAX,	0
	cmp	EBX,	0h
	jz	PKnSt
tsk1:	cmp	byte ptr [EBX][EAX], 0
	jz	PKnSt
	inc	EAX
	jmp	tsk1
PKnSt:	pop	EBP
	ret	4
StrLn	endp
;----------StrLn-----------------
;----------PcStrIUn------------------ получает CLSID из анси
PcStrIUn proc
	push	EBP
	mov	EBP,	ESP
	push	0
	push	[EBP][8d]
	call	StrLn
	inc	EAX
	mov	CL,	1
	sal	EAX,	CL
	push	EAX				; ---размер буфера
	push	EAX				;ppp
	push	40h				;ppp
	call	GlobalAlloc@8
	mov	[EBP][-4d],	EAX		; - буфер для юникод строки
	push	EAX				; ---адрес буфера
	push	-1
	push	[EBP][8d]
	push	0
	push	CP_ACP
	call	MultiByteToWideChar@24
	push	[EBP][12d]
	push	[EBP][-4d]
	call	IIDFromString@8
	push	EAX

	push	[EBP][-4d]
	call	GlobalFree@4
	pop	EAX

	mov	ESP,	EBP
	pop	EBP
	ret 	8
PcStrIUn endp
;----------PcStrIUn------------------
;----------pAD--------------------
pAD	proc
	push	EBP
	mov	EBP,	ESP
	push	offset strAD		;перевод стороки
	call	Napisat			;----------
	pop	EBP
	ret
pAD	endp
;----------pAD--------------------
;----------PcStrCls------------------ получает CLSID
PcStrCls proc
	push	EBP
	mov	EBP,	ESP
	push	0
	push	[EBP][8d]
	call	StrLn
	inc	EAX
	mov	CL,	1
	sal	EAX,	CL
	push	EAX				; ---размер буфера
	push	EAX				;ppp
	push	40h				;ppp
	call	GlobalAlloc@8
	mov	[EBP][-4d],	EAX		; - буфер для юникод строки
	push	EAX				; ---адрес буфера
	push	-1
	push	[EBP][8d]
	push	0
	push	CP_ACP
	call	MultiByteToWideChar@24
	push	offset CLSID1
	push	[EBP][-4d]
	call	CLSIDFromString@8
	push	EAX

	push	[EBP][-4d]
	call	GlobalFree@4
	pop	EAX

	mov	ESP,	EBP
	pop	EBP
	ret 	4
PcStrCls endp
;----------PcStrCls------------------
;----------OpisEr-------------------
OpisEr	proc	strCL1 :DWORD
	push	offset strEr1
	call	Napisat
	;mov	EAX,	param
	;mov	EAX,	dword ptr [EAX][1+4]
	push	strCL1
	call	Napisat
	push	offset strEr2
	call	Napisat
	call	pAD
	ret	4
OpisEr	endp
;----------OpisEr-------------------
;----------StrLnW-----------------
StrLnW	proc
	push	EBP
	mov	EBP,	ESP
	mov	EBX,	DWORD ptr [ESP + 8]
	mov	EAX,	0
	push	ECX
	xor	ECX,	ECX
tsk1:	cmp	word ptr [EBX][ECX], 0h
	jz	PKnSt
	inc	EAX
	inc	ECX
	inc	ECX
	jmp	tsk1
PKnSt:	pop	ECX
	pop	EBP
	ret	4
StrLnW	endp
;----------StrLnW-----------------

;----------PcZapCls------------------
PcZapCls proc
	push 	EBP
	mov	EBP,	ESP
	push	0
	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	push	offset CLSID1
	call	StringFromCLSID@8
	push	[EBP][-4d]
	call	StrLnW
	inc	EAX
	push	0
	push	0
	push	EAX
	Push	EAX			;---память для ANSI стоорки PROGID---
	push	40h
	call	GlobalAlloc@8
	mov	strCL,	EAX
	push	EAX
	push	-1d
	push	[EBP][-4d]
	push	0
	push	CP_ACP
	call	WideCharToMultiByte@32

	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	push	offset CLSID1
	call	ProgIDFromCLSID@8
	cmp	EAX,	S_OK
	jz	dle2
	mov	strPG,	offset strnet
	jmp	dle3				;не найден прогИД
dle2:	push	[EBP][-4d]
	call	StrLnW
	inc	EAX
	push	0
	push	0
	push	EAX
	Push	EAX			;---память для ANSI стоорки PROGID---
	push	40h
	call	GlobalAlloc@8
	mov	strPG,	EAX
	push	EAX
	push	-1d
	push	[EBP][-4d]
	push	0
	push	CP_ACP
	call	WideCharToMultiByte@32

dle3:	mov	ESP,	EBP
	pop	EBP
	ret
PcZapCls endp
;----------PcZapCls------------------
;----------PcOpnReg------------------
PcOpnReg proc
	push	EBP
	mov	EBP,	ESP
	push	0				;EBP - 4
	push	[EBP][8d]
	call	StrLn
	mov	ECX,	EAX
	cmp	ECX,	0
	jz	dle
	inc	EAX
dle:	add	EAX,	2Dh
	push	EAX				;выделяем память
	push	40h
	call	GlobalAlloc@8
	mov	[EBP][-4d],	EAX		;a1 буфер для пути к класу
	push	offset strSK1
	push	[EBP][-4d]
	call	lstrcpyA@8
	mov	EAX,	[EBP][-4d]
	add	EAX,	5h
	push	offset s			; добавляем \
	push	EAX
	call	lstrcpyA@8
	inc	EAX
	push	strCL				; добавляем АСКИ ИД класа
	push	EAX
	call	lstrcpyA@8
	cmp	ECX,	0
	jz	dle2
	mov	EAX,	[EBP][-4d]
	add	EAX,	2Ch
	push	offset s
	push	EAX
	call	lstrcpyA@8
	inc	EAX
	push	[EBP][8d]
	push	EAX
	call	lstrcpyA@8
dle2:	push	offset hkey1
	push	KEY_QUERY_VALUE
	push	0
	push	[EBP][-4d]			; наш буер
	push	HKEY_CLASSES_ROOT
	call	RegOpenKeyExA@20
	mov	ESP,	EBP
	pop	EBP
	ret	4
PcOpnReg endp
;----------PcOpnReg------------------
;----------ReadReg-------------------
ReadReg	proc
	push	EBP
	mov	EBP,	ESP

	push	hkey1
	push	0
	push	offset strNm
	call	PcRegGV
	push	strNm
	call	StrLn
	cmp	EAX,	0
	jnz	dle5
	mov	EAX,	offset strnet
	mov	strNm,	EAX
dle5:


	mov	ESP,	EBP
	pop	EBP
	ret
ReadReg	endp
;----------ReadReg-------------------
;----------PcRegGV------------------- (ключ, строка, результат)
PcRegGV	proc
	push	EBP
	mov	EBP,	ESP
	push	0				;EBP - 4 размер
	push	0				;EBP - 8 тип
	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX				;адрес размер -4
	push	0				;адрес буфера данных
	sub	EAX,	4d
	push	EAX				;адрес буфера для типа -8
	push	0				;зарезервировано
	push	[EBP][12d]			;p Имя параметра (0 по умолчанию)
	push	[EBP][16d]
	call	RegQueryValueExA@24
	mov	EAX,	[EBP][-4d]
	push	EAX
	push	40h
	call	GlobalAlloc@8
	mov	EDX,	[EBP][8d]
	mov	[EDX],	EAX
	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	push	[EDX]
	sub	EAX,	4d
	push	EAX
	push	0
	push	[EBP][12d]
	push	[EBP][16d]
	call	RegQueryValueExA@24
	mov	ESP,	EBP
	pop	EBP
	ret	12
PcRegGV	endp
;----------PcRegGV-------------------
;----------Opis-------------------
Opis	proc
	push	EBP
	mov	EBP,	ESP
	push	offset strNmo
	call	Napisat
	push	strNm
	call	Napisat
	call	pAD
	push	offset strclo
	call	Napisat
	push	strCL
	call	Napisat
	call	pAD
	push	offset strPGo
	call	Napisat
	push	strPG
	call	Napisat
	call	pAD
	mov	ESP,	EBP
	pop	EBP
	ret
Opis	endp
;----------Opis-------------------
;----------PcServ-----------------
PcServ	proc
	push	offset StrDl1
	call	Napisat
	call	pAD
	push	offset StrDl2
 	call	Pcvivs
	push	offset StrDl3
 	call	Pcvivs

	ret
PcServ	endp
;----------PcServ-----------------
;----------Pcvivs-----------------
Pcvivs	proc
	push	EBP
	mov	EBP,	ESP
	push	0
	push	[EBP][8d]
	call	PcOpnReg
	push	hkey1
	push	0				;имя свойства, поумолчанию
	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	call	PcRegGV
	push	[EBP][-4d]
	call	StrLn
	cmp	EAX,	0d
	jz	ext
	push	offset strsp1
	call	Napisat
	push	[EBP][8d]
	call	Napisat
	push	offset dntch
	call	Napisat
	push	[EBP][-4d]
	call	Napisat
ext:	mov	ESP,	EBP
	pop	EBP
	ret 4
Pcvivs	endp
;----------Pcvivs-----------------
;----------PcCrObj-----------------
PcCrObj	proc
	push	EBP
	mov	EBP,	ESP
	push	0
	push	offset Str1
	call	Napisat

	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	push	offset IUnkn
	push	CLSCTX_INPROC_SERVER OR CLSCTX_LOCAL_SERVER
	push	0
	push	offset CLSID1
	call	CoCreateInstance@20

	cmp	EAX,	S_OK
	jz	MOK
	push	offset StrFL
	call	Napisat
	xor	EAX,	EAX
	jmp	EXT
MOK:	push	offset StrOK
	call	Napisat
	mov	EAX,	[EBP][-4d]
EXT:	mov	ESP,	EBP
	pop	EBP
	ret
PcCrObj	endp
;----------PcCrObj-----------------
;----------PcPrvI-----------------(ключ, строка ключ, зн по умолч)
PcPrvI	proc
	push	EBP
	mov	EBP,	ESP
	push	10h
	push	40h
	call	GlobalAlloc@8
	push	EAX			;-4 buffer GUID
	push	0			;-8 новый интерфейс


	push	[EBP][-4d]
	push	[EBP][12d]
	call	PcStrIUn
	cmp	EAX,	S_OK
	jz	dle
	jmp	ext

dle:	mov	EAX,	EBP
	sub	EAX,	8d
	push	EAX
	push	[EBP][-4d]
	push	ObjIUn
	mov	EAX,	ObjIUn
	mov	EAX,	[EAX]
	call	DWORD PTR [EAX]
	cmp	EAX,	S_OK
	jz	dle2
	jmp	ext

dle2:	push	offset strsp1
	call	Napisat
	push	[EBP][8d]
	call	Napisat
	call	pAD

	push	[EBP][-8d]
	mov	EAX,	[EBP][-8d]
	mov	EAX,	[EAX]
	call	dword ptr [EAX + 8d]


ext:	push	[EBP][-4d]
	call	GlobalFree@4

	mov	ESP,	EBP
	pop	EBP
	ret	12
PcPrvI	endp
;----------PcPrvI-----------------
;----------PcEnReg-----------------(строка раздел, адрес вызыв. проц)
PcEnReg	proc
	push	EBP
	mov	EBP,	ESP
	push	0			;-4 regkey
	push	0			;-8 lpcName
	push	0			;-12 schetchik
	push	100h
	push	40h
	call	GlobalAlloc@8
	push	EAX			;-16 buffer
	push	0			;-20 новый ключ
	push	0			;-24 указатель на строку, значение по умолчанию с новым ключем

	mov	EAX,	EBP
	sub	EAX,	4d
	push	EAX
	push	KEY_ENUMERATE_SUB_KEYS OR KEY_QUERY_VALUE
	push	0
	push	[EBP][12d]
	push	HKEY_CLASSES_ROOT
	call	RegOpenKeyExA@20
	cmp	EAX,	ERROR_SUCCESS
	jz	dle
	jmp	exter

dle:	mov	EAX,	100h			;следущий ключ
	mov	[EBP][-8d], EAX

	push	0
	push	0
	push	0
	push	0
	mov	EAX,	EBP
	sub	EAX,	8d
	push	EAX				;адрес размера буфера
	push	[EBP][-16d]
	push	[EBP][-12d]
	push	[EBP][-4d]
	call	RegEnumKeyExA@32
	cmp	EAX,	0
	jz	dle1
	jmp	Ext

dle1:	mov	EAX,	EBP			;открываем новый ключ
	sub	EAX,	20d
	push	EAX
	push	KEY_ENUMERATE_SUB_KEYS OR KEY_QUERY_VALUE
	push	0
	push	[EBP][-16d]
	push	[EBP][-4d]
	call	RegOpenKeyExA@20
	cmp	EAX,	0
	jz	dle2
	jmp	Ext

dle2:	push	[EBP][-20d]
	push	0
	mov	EAX,	EBP
	sub	EAX,	24d
	push	EAX
	call	PcRegGV

	push	[EBP][-20d]
	push	[EBP][-16d]
	push	[EBP][-24d]
	call	DWORD ptr [EBP][8d]

	push	[EBP][-24d]
	call	GlobalFree@4

	push	[EBP][-20d]
	call	RegCloseKey@4

	mov	EAX,	[EBP][-12d]
	inc	EAX
	mov	[EBP][-12d], EAX
	jmp	dle


Ext:	push	[EBP][-4d]
	call	RegCloseKey@4
exter:
	mov	ESP,	EBP
	pop	EBP
	ret	8
PcEnReg	endp
;----------PcEnReg-----------------
;----------PcDesp------------------
PcDesp	proc
	local	Idesp1 :DWORD
	local	ITinf  :DWORD
	local	Tattr  :DWORD
	local	buf256 :DWORD
	local	pTMP   :DWORD
	local	memid1 :DWORD
	local	pName1 :DWORD
	local	pDocSt :DWORD
	local	phelpc :DWORD
	local	pHelpF :DWORD
	local	schet  :DWORD
	
	lea	EAX,	Idesp1
	push	EAX
	push	offset IdespIn
	push	ObjIUn
	mov	EAX,	ObjIUn
	mov	EAX,	[EAX]	;таблица 
	call	DWORD PTR [EAX]	;1 функц 
	cmp	EAX,	S_OK
	jz	dle2
	jmp	ext
dle2:	
	call	pAD
	
	lea	EAX,	ITinf
	push	EAX	;ppTInfo
	push	0	;lcid 
	push	0	;iTInfo 
	push	Idesp1	;This
	mov	EAX,	Idesp1
	mov	EAX,	[EAX]	;таблица 
	call	DWORD PTR [EAX][16d] ;5 функц 
	cmp	EAX,	S_OK
	jz	dle3
	invoke	Napisat, offset strdis1
	call	pAD
	jmp	ext2
	
dle3:	invoke	Napisat, offset strdis2
	call	pAD
	invoke	GlobalAlloc, 40h, 100h
	mov	buf256,	EAX

	;----основная часть----
	lea	EAX,	Tattr
	push	EAX
	push	ITinf
	mov	EAX,	ITinf
	mov	EAX,	[EAX]	;таблица 
	call	(ITypeInfo ptr [EAX]).ITypeInfo_GetTypeAttr
	;---общая информация----
	mov	EAX,	Tattr
	xor	EBX,	EBX
	mov	BX,	(TYPEATTR ptr [EAX]).cVars
	invoke	wsprintf, buf256, offset strdis4, EBX
	invoke	Napisat, buf256
	call	pAD
	;--
	mov	EAX,	Tattr
	xor	EBX,	EBX
	mov	BX,	(TYPEATTR ptr [EAX]).cFuncs
	invoke	wsprintf, buf256, offset strdis3, EBX
	invoke	Napisat, buf256
	call	pAD
	;--
	mov	EAX,	Tattr
	xor	EBX,	EBX
	mov	BX,	(TYPEATTR ptr [EAX]).cImplTypes
	invoke	wsprintf, buf256, offset strdis5, EBX
	invoke	Napisat, buf256
	call	pAD
	;функции
	mov	schet,	0h
	invoke	Napisat, offset strdis6
	call	pAD
tsicl1:	;----
	mov	EDX,	ITinf
	mov	EDX,	[EDX]	;таблица 
	invoke	(ITypeInfo ptr [EDX]).ITypeInfo_GetFuncDesc, ITinf, schet, ADDR pTMP
.if EAX != S_OK
	jmp	KonetsF
.endif	
	
	mov	EDX,	pTMP
	mov	EAX,	(FUNCDESC ptr [EDX]).memid
	mov	memid1,	EAX
	
	mov	pName1,	0
	mov	pDocSt,	0
	mov	phelpc,	0
	mov	pHelpF,	0
	
	mov	EDX,	ITinf
	mov	EDX,	[EDX]	;таблица 
	invoke	(ITypeInfo ptr [EDX]).ITypeInfo_GetDocumentation, ITinf, memid1, ADDR pName1, ADDR pDocSt, ADDR phelpc, ADDR pHelpF
;<-- Выводим результат	
	mov	EAX,	schet
	inc	EAX
	invoke	wsprintf, buf256, offset strdis7, EAX
	invoke	Napisat, buf256
	invoke	WideCharToMultiByte, CP_ACP, 0d, pName1, -1d, buf256, 100h, 0d, 0d
.if EAX != 0
	invoke	Napisat, buf256
.endif	
	call	pAD
	invoke	Napisat, offset strdis8
	mov	EDX,	pTMP
	mov	AX,	word ptr (FUNCDESC ptr [EDX]).funckind
.if AX == FUNC_VIRTUAL
	invoke	Napisat, offset strdis9
.elseif AX == FUNC_PUREVIRTUAL
	invoke	Napisat, offset strdis10
.elseif AX == FUNC_NONVIRTUAL
	invoke	Napisat, offset strdis11
.elseif AX == FUNC_STATIC
	invoke	Napisat, offset strdis12
.elseif AX == FUNC_DISPATCH
	invoke	Napisat, offset strdis13
.endif	

	invoke	Napisat, offset strdis8
	mov	EDX,	pTMP
	mov	AX,	word ptr (FUNCDESC ptr [EDX]).invkind
	and	AX,	INVOKE_FUNC
.if AX == 1h
	invoke	Napisat, offset strdis14
.endif
;.elseif AX == INVOKE_PROPERTYGET
;	invoke	Napisat, offset strdis15
;.elseif AX == INVOKE_PROPERTYPUT
;	invoke	Napisat, offset strdis16
;.elseif AX == INVOKE_PROPERTYPUTREF
;	invoke	Napisat, offset strdis17
;.endif	
	call	pAD
	call	pAD
;<-- Освобождаем Память
.if pName1 != 0d
	invoke	SysFreeString, pName1
.endif	
.if pDocSt != 0d
	invoke	SysFreeString, pDocSt
.endif	
.if pHelpF != 0d
	invoke	SysFreeString, pHelpF
.endif	
	mov	EDX,	ITinf
	mov	EDX,	[EDX]	;таблица 
	invoke	(ITypeInfo ptr [EDX]).ITypeInfo_ReleaseFuncDesc, ITinf, pTMP
	inc	schet
	jmp	tsicl1
KonetsF:	;конец
	invoke	GlobalFree, buf256
	mov	EDX,	ITinf
	mov	EDX,	[EDX]	;таблица 
	invoke	(ITypeInfo ptr [EDX]).ITypeInfo_ReleaseTypeAttr, ITinf, Tattr
	
	push	ITinf
	mov	EAX,	ITinf
	mov	EAX,	[EAX]	;таблица 
	call	DWORD PTR [EAX][8d]	;3 функц 
	
ext2:	push	Idesp1
	mov	EAX,	Idesp1
	mov	EAX,	[EAX]	;таблица 
	call	DWORD PTR [EAX][8d]	;3 функц 
ext:
	ret
PcDesp	endp
;----------PcDesp------------------
;------------------------


mine2	proc
	local	STRCL	:DWORD

	push	offset IUnkn
	push	offset StrIUn
	push	offset vZagol
	
	call	Napisat
	call	pAD
	call	pAD
	invoke	GetWindowTextLength, Whedit1
.if EAX == 0
	jmp	EXT
.endif
	inc	EAX
	push	EAX
	invoke	GlobalAlloc, GMEM_ZEROINIT, EAX
	mov	STRCL,	EAX
	pop	EAX
	invoke	GetWindowText, Whedit1, STRCL, EAX
	push	STRCL
	call	PcStrCls
	cmp	EAX,	S_OK
	jz	Dle1				;не так написан КЛАСИД
	push	STRCL
	call	OpisEr
	jmp	EXTF
Dle1:	call	PcZapCls
	push	0
	call	PcOpnReg
	call	ReadReg
	call	Opis
	call	pAD
	call	PcServ
	call	pAD
	call	pAD
	call	PcCrObj
	mov	ObjIUn,	EAX
	call	pAD
	cmp	ObjIUn,	0d
	jnz	dle5
	jmp	EXTF

dle5:	;push	hkey1
	;call	RegCloseKey@4
	call	pAD
	push	offset StrInt
	call	Napisat
	push	offset dntch
	call	Napisat
	call	pAD

	push	offset StrInt
	push	offset PcPrvI
	call	PcEnReg

	call	PcDesp

	mov	EAX,	[ObjIUn]
	mov	EAX,	[EAX]
	push	ObjIUn
	call	dword ptr [EAX + 8d]
	



EXTF:	invoke	GlobalFree, STRCL
EXT:
	ret
mine2	endp
end main


