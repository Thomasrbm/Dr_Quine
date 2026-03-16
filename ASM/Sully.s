extern fopen
extern fprintf
extern fclose
extern system
extern sprintf

NL    equ 10
QUOTE equ 34
TAB   equ 9

section .data
	mode		db "w", 0
	fname_fmt	db "Sully_%d.s", 0
	cmd_fmt		db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && cc -no-pie Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o", 0
	exec_fmt	db "./Sully_%d", 0
	string		db "extern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$cextern sprintf%1$c%1$cNL    equ 10%1$cQUOTE equ 34%1$cTAB   equ 9%1$c%1$csection .data%1$c%5$cmode%5$c%5$cdb %2$cw%2$c, 0%1$c%5$cfname_fmt%5$cdb %2$cSully_%%d.s%2$c, 0%1$c%5$ccmd_fmt%5$c%5$cdb %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && cc -no-pie Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o%2$c, 0%1$c%5$cexec_fmt%5$cdb %2$c./Sully_%%d%2$c, 0%1$c%5$cstring%5$c%5$cdb %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c%5$cglobal main%1$c%1$cmain:%1$c%5$csub%5$crsp, 200%1$c%5$cmov%5$cr14, %4$d%1$c%1$c%5$ctest%5$cr14, r14%1$c%5$cjs%5$c.end%1$c%1$c%5$clea%5$crdi, [rsp + 8]%1$c%5$clea%5$crsi, [rel fname_fmt]%1$c%5$cmov%5$crdx, r14%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csprintf wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 8]%1$c%5$clea%5$crsi, [rel mode]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfopen wrt ..plt%1$c%5$cmov%5$cr13, rax%1$c%5$ctest%5$cr13, r13%1$c%5$cjz%5$c.end%1$c%1$c%5$cmov%5$crdi, r13%1$c%5$clea%5$crsi, [rel string]%1$c%5$cmov%5$crdx, NL%1$c%5$cmov%5$crcx, QUOTE%1$c%5$clea%5$cr8, [rel string]%1$c%5$cmov%5$cr9, r14%1$c%5$cmov%5$cqword [rsp], TAB%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfprintf wrt ..plt%1$c%1$c%5$cmov%5$crdi, r13%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfclose wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 40]%1$c%5$clea%5$crsi, [rel cmd_fmt]%1$c%5$cmov%5$crdx, r14%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csprintf wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 40]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csystem wrt ..plt%1$c%1$c%5$ctest%5$cr14, r14%1$c%5$cjz%5$c.end%1$c%1$c%5$cmov%5$cr15, r14%1$c%5$cdec%5$cr15%1$c%1$c%5$clea%5$crdi, [rsp + 8]%1$c%5$clea%5$crsi, [rel fname_fmt]%1$c%5$cmov%5$crdx, r15%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csprintf wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 8]%1$c%5$clea%5$crsi, [rel mode]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfopen wrt ..plt%1$c%5$cmov%5$cr13, rax%1$c%5$ctest%5$cr13, r13%1$c%5$cjz%5$c.end%1$c%1$c%5$cmov%5$crdi, r13%1$c%5$clea%5$crsi, [rel string]%1$c%5$cmov%5$crdx, NL%1$c%5$cmov%5$crcx, QUOTE%1$c%5$clea%5$cr8, [rel string]%1$c%5$cmov%5$cr9, r15%1$c%5$cmov%5$cqword [rsp], TAB%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfprintf wrt ..plt%1$c%1$c%5$cmov%5$crdi, r13%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$cfclose wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 40]%1$c%5$clea%5$crsi, [rel cmd_fmt]%1$c%5$cmov%5$crdx, r15%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csprintf wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 40]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csystem wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 168]%1$c%5$clea%5$crsi, [rel exec_fmt]%1$c%5$cmov%5$crdx, r15%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csprintf wrt ..plt%1$c%1$c%5$clea%5$crdi, [rsp + 168]%1$c%5$cxor%5$crax, rax%1$c%5$ccall%5$csystem wrt ..plt%1$c%1$c.end:%1$c%5$cadd%5$crsp, 200%1$c%5$cxor%5$crdi, rdi%1$c%5$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
	global main

main:
	sub	rsp, 200
	mov	r14, 5

	test	r14, r14
	js	.end

	lea	rdi, [rsp + 8]
	lea	rsi, [rel fname_fmt]
	mov	rdx, r14
	xor	rax, rax
	call	sprintf wrt ..plt

	lea	rdi, [rsp + 8]
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
	mov	r9, r14
	mov	qword [rsp], TAB
	xor	rax, rax
	call	fprintf wrt ..plt

	mov	rdi, r13
	xor	rax, rax
	call	fclose wrt ..plt

	lea	rdi, [rsp + 40]
	lea	rsi, [rel cmd_fmt]
	mov	rdx, r14
	xor	rax, rax
	call	sprintf wrt ..plt

	lea	rdi, [rsp + 40]
	xor	rax, rax
	call	system wrt ..plt

	test	r14, r14
	jz	.end

	mov	r15, r14
	dec	r15

	lea	rdi, [rsp + 8]
	lea	rsi, [rel fname_fmt]
	mov	rdx, r15
	xor	rax, rax
	call	sprintf wrt ..plt

	lea	rdi, [rsp + 8]
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
	mov	r9, r15
	mov	qword [rsp], TAB
	xor	rax, rax
	call	fprintf wrt ..plt

	mov	rdi, r13
	xor	rax, rax
	call	fclose wrt ..plt

	lea	rdi, [rsp + 40]
	lea	rsi, [rel cmd_fmt]
	mov	rdx, r15
	xor	rax, rax
	call	sprintf wrt ..plt

	lea	rdi, [rsp + 40]
	xor	rax, rax
	call	system wrt ..plt

	lea	rdi, [rsp + 168]
	lea	rsi, [rel exec_fmt]
	mov	rdx, r15
	xor	rax, rax
	call	sprintf wrt ..plt

	lea	rdi, [rsp + 168]
	xor	rax, rax
	call	system wrt ..plt

.end:
	add	rsp, 200
	xor	rdi, rdi
	ret

section .note.GNU-stack noalloc noexec nowrite progbits