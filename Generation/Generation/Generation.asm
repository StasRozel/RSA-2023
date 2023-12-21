.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 strcopy PROTO : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

 strcomp  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 byte 'œË‚ÂÚ ÏË! œ–Ë‚ÂÚÚÚ ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿', 0
		LTRL2 byte 'GGGGGGGGGGG', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		mainx dword ?
		mainy dword ?
.code

;------------- MAIN --------------
main PROC

mov mainx, offset LTRL1
mov mainy, offset LTRL2

push mainx
call outstr

push 0
call ExitProcess
main ENDP
end main
