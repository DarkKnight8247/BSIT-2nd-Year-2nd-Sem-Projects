section .data
menu db "============================",10
     db "      UNIT CONVERTER",10
     db "============================",10
     db "1. Inches to Centimeters",10
     db "2. Centimeters to Inches",10
     db "3. Meters to Centimeters",10
     db "4. Centimeters to Meters",10
     db "5. Exit",10
     db "Enter choice: "
menu_len equ $ - menu

msg1 db 10,"You chose Inches -> Centimeters",10
msg1_len equ $ - msg1

msg2 db 10,"You chose Centimeters -> Inches",10
msg2_len equ $ - msg2

msg3 db 10,"You chose Meters -> Centimeters",10
msg3_len equ $ - msg3

msg4 db 10,"You chose Centimeters -> Meters",10
msg4_len equ $ - msg4

section .bss
choice resb 2

section .text
global _start

_start:

; print menu
mov eax,4
mov ebx,1
mov ecx,menu
mov edx,menu_len
int 0x80

; read choice
mov eax,3
mov ebx,0
mov ecx,choice
mov edx,2
int 0x80

; compare choices
cmp byte [choice],'1'
je inches_cm

cmp byte [choice],'2'
je cm_inches

cmp byte [choice],'3'
je meters_cm

cmp byte [choice],'4'
je cm_meters

cmp byte [choice],'5'
je exit

jmp exit

; option 1
inches_cm:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,msg1_len
int 0x80
jmp exit

; option 2
cm_inches:
mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,msg2_len
int 0x80
jmp exit

; option 3
meters_cm:
mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,msg3_len
int 0x80
jmp exit

; option 4
cm_meters:
mov eax,4
mov ebx,1
mov ecx,msg4
mov edx,msg4_len
int 0x80
jmp exit

exit:
mov eax,1
mov ebx,0
int 0x80