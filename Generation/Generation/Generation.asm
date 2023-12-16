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
		LTRL1 byte 'RSA-2022', 0
		LTRL2 sdword 10
		LTRL3 sdword 1
		LTRL4 sdword 2
.data
		temp sdword ?
		buffer byte 256 dup(0)
		mainstrx dword ?
		mainx sdword 0
.code

;------------- MAIN --------------
main PROC
mov mainstrx, offset LTRL1

push mainstrx
call outstr

push offset newline
call outstr

push LTRL2

pop ebx
mov mainx, ebx

mov edx, mainx
cmp edx, LTRL3

jg cycle1
jmp cyclenext1
cycle1:

push mainx
call outnum

push offset newline
call outstr

push mainx
push LTRL4
pop ebx
pop eax
sub eax, ebx
push eax

pop ebx
mov mainx, ebx

mov edx, mainx
cmp edx, LTRL3

jg cycle1
cyclenext1:
push 0
call ExitProcess
main ENDP
end main
