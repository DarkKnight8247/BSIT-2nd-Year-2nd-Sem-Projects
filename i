section .data
prompt db "Enter your age: ",0
prompt_len equ $ - prompt

msg_invalid db "Invalid age",10,0
msg_invalid_len equ $ - msg_invalid

msg_child db "Category: Child",10,0
msg_child_len equ $ - msg_child

msg_teen db "Category: Teen",10,0
msg_teen_len equ $ - msg_teen

msg_adult db "Category: Adult",10,0
msg_adult_len equ $ - msg_adult

msg_senior db "Category: Senior",10,0
msg_senior_len equ $ - msg_senior

section .bss
age resb 4   ; allow space for 3 digits + newline

section .text
global _start

_start:
; print prompt
mov eax,4
mov ebx,1
mov ecx,prompt
mov edx,prompt_len
int 0x80

; read age input
mov eax,3
mov ebx,0
mov ecx,age
mov edx,4
int 0x80

; convert ASCII to integer
mov esi,age
xor eax,eax
xor ebx,ebx

convert_loop:
mov bl,[esi]
cmp bl,10       ; newline?
je done_convert

; check if negative sign
cmp bl,'-'
je invalid

sub bl,'0'
cmp bl,9        ; check if valid digit
ja invalid

imul eax,10
add eax,ebx
inc esi
jmp convert_loop

done_convert:
; age is now in eax

; check if >130
cmp eax,130
jg invalid

; check if negative (just extra safety)
cmp eax,0
jl invalid

; compare for categories
cmp eax,12
jle child

cmp eax,19
jle teen

cmp eax,59
jle adult

jmp senior

invalid:
mov eax,4
mov ebx,1
mov ecx,msg_invalid
mov edx,msg_invalid_len
int 0x80
jmp exit

child:
mov eax,4
mov ebx,1
mov ecx,msg_child
mov edx,msg_child_len
int 0x80
jmp exit

teen:
mov eax,4
mov ebx,1
mov ecx,msg_teen
mov edx,msg_teen_len
int 0x80
jmp exit

adult:
mov eax,4
mov ebx,1
mov ecx,msg_adult
mov edx,msg_adult_len
int 0x80
jmp exit

senior:
mov eax,4
mov ebx,1
mov ecx,msg_senior
mov edx,msg_senior_len
int 0x80

exit:
mov eax,1
mov ebx,0
int 0x80