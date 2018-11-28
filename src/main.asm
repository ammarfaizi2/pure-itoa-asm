%include "src/itoa.s"

section .text
	global _start

_start:
	mov rax,10
	call itoa

	mov rax,60
	xor rdi,rdi
	syscall
