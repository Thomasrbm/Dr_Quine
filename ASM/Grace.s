extern fopen
extern fprintf
extern fclose

%define NL        10
%define FILE_NAME "Grace_kid.s"
%define QUOTE     34

section .data
	mode	db "w", 0
	fname	db FILE_NAME, 0
	string	db "extern fopen%1$cextern fprintf%1$cextern fclose%1$c%1$c%5$cdefine NL 10%1$c%5$cdefine FILE_NAME %2$cGrace_kid.s%2$c%1$c%5$cdefine QUOTE 34%1$c%1$csection .data%1$c%4$cmode%4$cdb %2$cw%2$c, 0%1$c%4$cfname%4$cdb FILE_NAME, 0%1$c%4$cstring%4$cdb %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c%4$cglobal main%1$c%1$cmain:%1$c%4$csub%4$crsp, 16%1$c%4$clea%4$crdi, [rel fname]%1$c%4$clea%4$crsi, [rel mode]%1$c%4$cxor%4$crax, rax%1$c%4$ccall%4$cfopen wrt ..plt%1$c%4$cmov%4$cr12, rax%1$c%4$cmov%4$crdi, r12%1$c%4$clea%4$crsi, [rel string]%1$c%4$cmov%4$crdx, NL%1$c%4$cmov%4$crcx, QUOTE%1$c%4$clea%4$cr8, [rel string]%1$c%4$cmov%4$cr9, 9%1$c%4$cmov%4$cqword [rsp], 37%1$c%4$cxor%4$crax, rax%1$c%4$ccall%4$cfprintf wrt ..plt%1$c%4$cmov%4$crdi, r12%1$c%4$cxor%4$crax, rax%1$c%4$ccall%4$cfclose wrt ..plt%1$c%4$cadd%4$crsp, 16%1$c%4$cxor%4$crdi, rdi%1$c%4$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits", 0

section .text
	global main

main:
	sub	rsp, 16
	lea	rdi, [rel fname]
	lea	rsi, [rel mode]
	xor	rax, rax
	call	fopen wrt ..plt
	mov	r12, rax
	mov	rdi, r12
	lea	rsi, [rel string]
	mov	rdx, NL
	mov	rcx, QUOTE
	lea	r8, [rel string]
	mov	r9, 9
	mov	qword [rsp], 37
	xor	rax, rax
	call	fprintf wrt ..plt
	mov	rdi, r12
	xor	rax, rax
	call	fclose wrt ..plt
	add	rsp, 16
	xor	rdi, rdi
	ret

section .note.GNU-stack noalloc noexec nowrite progbits