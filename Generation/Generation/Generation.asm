.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "E:/Универ/2_курс/Курсач_КПО/RSA-2023/Debug/GenLib.lib"
ExitProcess PROTO:DWORD 
.stack 4096


 outnum PROTO : DWORD

 outstr PROTO : DWORD

 strcopy PROTO : DWORD, : DWORD

 lenght PROTO : DWORD, : DWORD

 atoii  PROTO : DWORD,  : DWORD

 strcomp  PROTO : DWORD,  : DWORD, : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 byte '1', 0
		LTRL2 byte 'Hello123', 0
		LTRL3 byte 'Привет Мир!', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		mainstr dword ?
		mainstrw dword ?
		mainlen sdword 0
.code

;------------- MAIN --------------
main PROC

mov mainstr, offset LTRL1
mov mainstrw, offset LTRL2

push offset LTRL3
call outstr

push offset newline
call outstr


push mainstrw
push mainstr
push offset buffer
call strcomp
push eax

pop ebx
mov mainlen, ebx


push mainlen
call outnum

push 0
call ExitProcess
main ENDP
end main
