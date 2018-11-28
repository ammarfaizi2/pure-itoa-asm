section .data
	a11 db 10

section .bss
	z11 resb 5

section .text
	global _start

_start:
	mov rax,100
	call itoa
	mov rax,60
	xor rdi,rdi
	syscall

itoa:
	mov r14,1
	mov rbx,rax
	mov r15,0
	mov r8,48
	mov [z11],r8
	call rnd
	ret

rnd:
	call pz11
	call pbl

	inc r15

	cmp r15,10
	jge pgg

	cmp r15,10
	jl pll

	ret

pgg:
	mov r8,r15
	mov rax,r8
	mov r9,7
	xor rdx,rdx
	idiv r9
	ret


pll:
	mov r8,r15
	add r8,48
	mov [z11],r8

	cmp r15,rbx
	jne rnd
	ret

pz11:
	mov rax,1
	mov rdi,1
	mov rsi,z11
	mov rdx,r14
	syscall
	ret

pbl:
	mov rax,1
	mov rdi,1
	mov rsi,a11
	mov rdx,1
	syscall
	ret