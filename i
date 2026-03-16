section .data
menu db "============================",10
     db "      UNIT CONVERTER",10
     db "============================",10
     db "1. Inches -> Centimeters",10
     db "2. Centimeters -> Inches",10
     db "3. Meters -> Centimeters",10
     db "4. Centimeters -> Meters",10
     db "5. Exit",10
     db "Enter choice: "
menu_len equ $ - menu

prompt db 10,"Enter value: ",0
prompt_len equ $ - prompt

msg_result db "Result: ",0
msg_len equ $ - msg_result

section .bss
choice resb 2
num resb 5    ; buffer to store input number
result resb 10

section .text
global _start

_start:
; --- print menu ---
mov eax,4
mov ebx,1
mov ecx,menu
mov edx,menu_len
int 0x80

; --- read choice ---
mov eax,3
mov ebx,0
mov ecx,choice
mov edx,2
int 0x80

; --- compare choices ---
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

; ---------------------------
; Option 1: Inches -> Centimeters
inches_cm:
call read_number
; multiply number by 254 / 100 to approximate 2.54
mov eax,[num]
imul eax,254
mov ebx,100
idiv ebx
call print_result
jmp exit

; Option 2: Centimeters -> Inches
cm_inches:
call read_number
; multiply by 100 / 254 to approximate division by 2.54
mov eax,[num]
imul eax,100
mov ebx,254
idiv ebx
call print_result
jmp exit

; Option 3: Meters -> Centimeters
meters_cm:
call read_number
; multiply by 100
mov eax,[num]
imul eax,100
call print_result
jmp exit

; Option 4: Centimeters -> Meters
cm_meters:
call read_number
; divide by 100
mov eax,[num]
mov ebx,100
idiv ebx
call print_result
jmp exit

; ---------------------------
; --- Read number from user ---
read_number:
mov eax,4
mov ebx,1
mov ecx,prompt
mov edx,prompt_len
int 0x80

; read input
mov eax,3
mov ebx,0
mov ecx,num
mov edx,5
int 0x80

; convert ASCII to integer (simplest, assumes 1-5 digit input)
mov esi,num
xor eax,eax
xor ebx,ebx
read_loop:
mov bl,[esi]
cmp bl,10        ; newline?
je read_done
sub bl,'0'
imul eax,10
add eax,ebx
inc esi
jmp read_loop
read_done:
mov [num],eax
ret

; --- Print result ---
print_result:
mov eax,4
mov ebx,1
mov ecx,msg_result
mov edx,msg_len
int 0x80

; convert integer to string
mov eax,[num]
mov ecx,result
call int_to_ascii

; print number
mov eax,4
mov ebx,1
mov edx,10
int 0x80
ret

; ---------------------------
; integer to ascii conversion
int_to_ascii:
mov edi,ecx
xor ecx,ecx
mov ebx,10

convert_loop:
xor edx,edx
div ebx
add dl,'0'
push dx
inc ecx
test eax,eax
jnz convert_loop

pop_loop:
pop dx
mov [edi],dl
inc edi
loop pop_loop
mov byte [edi],10  ; newline
ret

exit:
mov eax,1
mov ebx,0
int 0x80