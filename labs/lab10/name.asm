%include 'in_out.asm'

SECTION .data
namefile db 'name.txt', 0h
prompt db 'Как Вас зовут? ', 0h
message db 'Меня зовут ', 0h

SECTION .bss
input resb 255

SECTION .text
global _start
_start:
    mov eax, prompt
    call sprint

    mov ecx, input
    mov edx, 255
    call sread

    mov ecx, 0777o
    mov ebx, namefile
    mov eax, 8
    int 80h

    mov esi, eax

    mov eax, message
    call slen
    mov edx, eax
    mov ecx, message
    mov ebx, esi
    mov eax, 4
    int 80h

    mov eax, input
    call slen
    mov edx, eax
    mov ecx, input
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
