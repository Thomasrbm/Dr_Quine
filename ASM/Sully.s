extern fopen
extern fprintf
extern fclose
extern system

NL    equ 10
QUOTE equ 34
TAB   equ 9

section .data
	mode	db "w", 0
	fname	db "Sully_4.s", 0
	cmd	db "nasm -f elf64 Sully_4.s -o Sully_4.o && cc -no-pie Sully_4.o -o Sully_4", 0
	exec	db "./Sully_4", 0
	string	db "extern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$c%1$cNL    equ 10%1$cQUOTE equ 34%1$cTAB   equ 9%1$c%1$csection .data%1$c%5$cmode%5$cdb %2$cw%2$c, 0%1$c%5$cfname%5$cdb %2$cSully_%4$d.s%2$c, 0%1$c%5$ccmd%5$cdb %2$cnasm -f elf64 Sully_%4$d.s -o Sully_%4$d.o && cc -no-pie Sully_%4$d.o -o Sully_%4$d%2$c, 0%1$c%5$cexec%5$cdb %2$c./Sully_%4$d%2$c, 0%1$c%5$cstring%5$cdb %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c%5$cglobal main%1$c%1$cmain:%1$c%5$csub%5$crsp, 24%1$c%5$cmov%5$cr12, %4$d%1$c%5$cinc%5$cr12%1$c%5$ctest%5$cr12, r12%1$c%5$cjz%5$c.end%1$c%5$clea%5$crdi, [rel fname]%1$c%5$clea%5$crsi, [rel mode]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfopen wrt ..plt%1$c%5$cmov%5$cr13, rax%1$c%5$ctest%5$cr13, r13%1$c%5$cjz%5$c.end%1$c%5$cmov%5$crdi, r13%1$c%5$clea%5$crsi, [rel string]%1$c%5$cmov%5$crdx, NL%1$c%5$cmov%5$crcx, QUOTE%1$c%5$clea%5$cr8, [rel string]%1$c%5$cmov%5$cr9, %4$d%1$c%5$cdec%5$cr9%1$c%5$cmov%5$cqword [rsp], TAB%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfprintf wrt ..plt%1$c%5$cmov%5$crdi, r13%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfclose wrt ..plt%1$c%5$clea%5$crdi, [rel cmd]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csystem wrt ..plt%1$c%5$clea%5$crdi, [rel exec]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csystem wrt ..plt%1$c1$c.end:%1$c%5$cadd%5$crsp, 24%1$c%5$cxor%5$crdi, rdi%1$c%5$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits", 0

section .text
	global main

main:
	sub	rsp, 24
	mov	r12, 5
	inc	r12
	test	r12, r12
	jz	.end
	lea	rdi, [rel fname]
	lea	rsi, [rel mode]
	xor	rax, rax
	call	fopen wrt ..plt
	mov	r13, rax
	test	r13, r13
	jz	.end
	mov	rdi, r13
	lea	rsi, [rel string]
	mov	rdx, NL
	mov	rcx, QUOTE
	lea	r8, [rel string]
	mov	r9, 5
	dec	r9
	mov	qword [rsp], TAB
	xor	rax, rax
	call	fprintf wrt ..plt
	mov	rdi, r13
	xor	rax, rax
	call	fclose wrt ..plt
	lea	rdi, [rel cmd]
	xor	rax, rax
	call	system wrt ..plt
	lea	rdi, [rel exec]
	xor	rax, rax
	call	system wrt ..plt

.end:
	add	rsp, 24
	xor	rdi, rdi
	ret

section .note.GNU-stack noalloc noexec nowrite progbits