global main     ; функция main - точка входа

extern printf ; подключаем функцию printf
extern scanf
extern exit

section .bss
    array resb 5

section .data
    string db '%d',0
    output_str db '%d ',0
    dsds db 'HELLO', 10

section .text
main:
    and rsp, -16
    xor rax, rax
    mov rcx, 0x05
    xor ebx, ebx

    cycle:
    push rcx
    sub rsp, 8

    mov rdi, string
    lea rsi, [array + ebx]

    call scanf
    inc ebx

    add rsp, 8
    pop rcx

    loop cycle


    mov rcx, 0x05
    xor ebx, ebx
cycle2:
    push rcx
    sub rsp, 8

    lea rdx, [array + ebx]
    lea rdi, [output_str]

    movsx rsi, byte [rdx]
    call printf

    inc ebx


    add rsp,8
    pop rcx

    loop cycle2
    and rsp, -16
    call exit
