extern printf
extern scanf
extern exit

section .data
    input_format db "%d", 0
    output_format db "%d", 10, 0

section .bss
    rang resd 1

section .text
    global main


main:
    and rsp, -16

    lea rsi, [rang]
    mov rdi, input_format
    xor rbx, rbx
    call scanf

    push qword [rang]
    push qword 1
    call factorial

    pop rsi
    pop rbx
    ; mov rsi, [rsp]
    xor rbx, rbx
    lea rdi, [output_format]
    call printf

    and rsp, -16
    call exit


factorial:
    mov rbx, [rsp + 8]
    mov rax, [rsp + 16]
    cmp rax, 1
    ja recurse
    jmp exit2

recurse:
    imul rbx, rax
    dec rax
    push rax
    push rbx
    call factorial
    add rsp, 16
exit2:
    mov [rsp + 8], rbx
    ret
