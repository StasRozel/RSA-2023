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

.const
		newline byte 13, 10, 0
		LTRL1 sdword 5
		LTRL2 byte 'Lenght + 10001:          ', 0
		LTRL3 byte 'String copy11111:         ', 0
		LTRL4 byte 'RSA-2023', 0
		LTRL5 byte 'Test String', 0
		LTRL6 byte '23', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres sdword 0
		stringsk sdword 0
		stringsstr dword ?
		mainstrx dword ?
		mainstry dword ?
		mainstrz dword ?
.code

;------------- min --------------
min PROC,
	minx : sdword, miny : sdword  
; -------- save registers -------
push ebx
push edx
; -------------------------------
mov edx, minx
cmp edx, miny

jl right1
jg wrong1
right1:
push minx

pop ebx
mov minres, ebx

jmp next1
wrong1:
push miny

pop ebx
mov minres, ebx

next1:
; ------ restore registers ------
pop edx
pop ebx
; -------------------------------
mov eax, minres
ret
min ENDP
;---------------


;------------- strings --------------
strings PROC,
	stringsa : dword, stringsb : dword  
; -------- save registers -------
push ebx
push edx
; -------------------------------

push stringsa
push offset buffer
call lenght
push eax
push LTRL1
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov stringsk, ebx


push offset LTRL2
call outstr


push stringsk
call outnum

push offset newline
call outstr


push stringsb
push offset buffer
call strcopy
mov stringsstr, eax

push offset LTRL3
call outstr


push stringsstr
call outstr

push offset newline
call outstr

; ------ restore registers ------
pop edx
pop ebx
; -------------------------------
ret
strings ENDP
;---------------


;------------- MAIN --------------
main PROC
mov mainstrx, offset LTRL4
push offset newline
call outstr


push mainstrx
call outstr

push offset newline
call outstr


push mainstrx
call outstr

push offset newline
call outstr

mov mainstry, offset LTRL5
mov mainstrz, offset LTRL6

push mainstry
push mainstrx
call strings

push offset newline
call outstr


push mainstrx
call outstr


push mainstrx
call outstr

push offset newline
call outstr

push 0
call ExitProcess
main ENDP
end main
