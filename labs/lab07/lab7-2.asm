%include 'in_out.asm'

SECTION .data
msg1: DB 'Введите B: ',0
msg2: DB "Наибольшее число: ",0
A: DD 20
C: DD 50

SECTION .bss
max: RESB 10
B: RESB 10

SECTION .text
GLOBAL _start
_start:
    mov eax, msg1
    call sprint

    mov ecx
    mov edx, 10
    call sread

    mov eax, B
    call atoi
    mov [B], eax

    mov ecx, [A]
    mov [max], ecx

    cmp ecx, [C]
    jg check_B
    mov ecx, [C]
    mov [max], ecx
check_B:
    mov eax, max
    call atoi
    mov [max], eax

    mov ecx, [max]
    cmp ecx, [B]
    jg fin
    mov ecx, [B]
    mov [max], ecx
fin:
    mov eax, msg2
    call sprint
    mov eax, [max]
    call iprintLF
    call quit
