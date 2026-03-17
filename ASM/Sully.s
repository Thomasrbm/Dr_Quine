; i = 5
extern fopen, fprintf, fclose, sprintf, access, system

section .data
    s: db "; i = %2$d%1$cextern fopen, fprintf, fclose, sprintf, access, system%1$c%1$csection .data%1$c    s: db %3$c%4$s%3$c, 0%1$c    file_name: db %3$cSully_%%d.s%3$c, 0%1$c    mode: db %3$cw%3$c, 0%1$c    cmd: db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%1$c%1$csection .bss%1$c    buf: resb 200%1$c%1$csection .text%1$c    global main%1$c%1$cmain:%1$c    push r12%1$c    push r13%1$c    mov r12d, %2$d%1$c    lea rdi, [rel buf]%1$c    lea rsi, [rel file_name]%1$c    mov edx, r12d%1$c    xor eax, eax%1$c    call sprintf wrt ..plt%1$c    lea rdi, [rel buf]%1$c    xor esi, esi%1$c    call access wrt ..plt%1$c    test eax, eax%1$c    jnz .next%1$c    dec r12d%1$c%1$c.next:%1$c    cmp r12d, 0%1$c    jl .done%1$c    lea rdi, [rel buf]%1$c    lea rsi, [rel file_name]%1$c    mov edx, r12d%1$c    xor eax, eax%1$c    call sprintf wrt ..plt%1$c    lea rdi, [rel buf]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    mov r13, rax%1$c    mov rdi, r13%1$c    lea rsi, [rel s]%1$c    mov edx, 10%1$c    mov ecx, r12d%1$c    mov r8d, 34%1$c    lea r9, [rel s]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    mov rdi, r13%1$c    call fclose wrt ..plt%1$c    lea rdi, [rel buf]%1$c    lea rsi, [rel cmd]%1$c    mov edx, r12d%1$c    xor eax, eax%1$c    call sprintf wrt ..plt%1$c    lea rdi, [rel buf]%1$c    call system wrt ..plt%1$c%1$c.done:%1$c    pop r13%1$c    pop r12%1$c    xor eax, eax%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0
    file_name: db "Sully_%d.s", 0
    mode: db "w", 0
    cmd: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && ./Sully_%1$d", 0

section .bss
    buf: resb 200

section .text
    global main

main:
    push r12
    push r13
    mov r12d, 5
    lea rdi, [rel buf]
    lea rsi, [rel file_name]
    mov edx, r12d
    xor eax, eax
    call sprintf wrt ..plt
    lea rdi, [rel buf]
    xor esi, esi
    call access wrt ..plt
    test eax, eax
    jnz .next
    dec r12d

.next:
    cmp r12d, 0
    jl .done
    lea rdi, [rel buf]
    lea rsi, [rel file_name]
    mov edx, r12d
    xor eax, eax
    call sprintf wrt ..plt
    lea rdi, [rel buf]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    mov r13, rax
    mov rdi, r13
    lea rsi, [rel s]
    mov edx, 10
    mov ecx, r12d
    mov r8d, 34
    lea r9, [rel s]
    xor eax, eax
    call fprintf wrt ..plt
    mov rdi, r13
    call fclose wrt ..plt
    lea rdi, [rel buf]
    lea rsi, [rel cmd]
    mov edx, r12d
    xor eax, eax
    call sprintf wrt ..plt
    lea rdi, [rel buf]
    call system wrt ..plt

.done:
    pop r13
    pop r12
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits