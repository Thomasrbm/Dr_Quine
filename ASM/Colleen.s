extern printf

section .data

	; Hello

	string db "extern printf%1$c%1$csection .data%1$c%1$c%4$c; Hello%1$c%1$c%4$cstring db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c%4$cglobal main%1$c%4$cglobal .useless%1$c%1$cmain:%1$c%4$c; World%1$c%4$ccall .useless%1$c%4$clea rdi, [rel string]%1$c%4$cmov rsi, 10%1$c%4$cmov rdx, 34%1$c%4$clea rcx, [rel string]%1$c%4$cmov r8, 9%1$c%4$cxor rax, rax%1$c%4$ccall printf wrt ..plt%1$c%4$cxor rdi, rdi%1$c%4$cret%1$c%1$c.useless:%1$c%4$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
	global main
	global .useless

main:
	; World
	call .useless
	lea rdi, [rel string]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [rel string]
	mov r8, 9
	xor rax, rax
	call printf wrt ..plt
	xor rdi, rdi
	ret

.useless:
	ret

section .note.GNU-stack noalloc noexec nowrite progbits