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
age resb 4                

section .text
global _start

_start:

; write(1, prompt, len)
mov rax, 1                 
mov rdi, 1                
mov rsi, prompt           
mov rdx, prompt_len       
syscall

; read(0, age, 4)
mov rax, 0               
mov rdi, 0              
mov rsi, age        
mov rdx, 4
syscall

; convert ASCII to integer
mov rsi, age
xor rax, rax
xor rbx, rbx

convert_loop:
mov bl, [rsi]
cmp bl, 10                
je done_convert

cmp bl, '-'
je invalid

sub bl, '0'
cmp bl, 9               
ja invalid

imul rax, 10       
add rax, rbx          

inc rsi             
jmp convert_loop

done_convert:

cmp rax, 130   
jg invalid

cmp rax, 0              
jl invalid

; categorize
cmp rax, 12
jle child

cmp rax, 19
jle teen

cmp rax, 59
jle adult

jmp senior

invalid:
mov rax, 1
mov rdi, 1
mov rsi, msg_invalid
mov rdx, msg_invalid_len
syscall
jmp exit

child:
mov rax, 1
mov rdi, 1
mov rsi, msg_child
mov rdx, msg_child_len
syscall
jmp exit

teen:
mov rax, 1
mov rdi, 1
mov rsi, msg_teen
mov rdx, msg_teen_len
syscall
jmp exit

adult:
mov rax, 1
mov rdi, 1
mov rsi, msg_adult
mov rdx, msg_adult_len
syscall
jmp exit

senior:
mov rax, 1
mov rdi, 1
mov rsi, msg_senior
mov rdx, msg_senior_len
syscall

exit:
mov rax, 60                 ; syscall: exit
xor rdi, rdi                ; status 0
syscall
