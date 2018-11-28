section .data
	a11 db 32
section .bss
	z11 resb 3
section .text
	global _start

_start:
	mov rax,200
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
	cmp r15,100
	jge pgg2
	cmp r15,10
	jge pgg
	cmp r15,10
	jl pll
	ret

pgg:
	mov r8,r15
	mov rax,r8
	mov r9,10
	xor rdx,rdx
	idiv r9
	add rax,48
	add rdx,48
	mov [z11],rax
	mov [z11+1],rdx
	mov r14,2
	cmp r15,rbx
	jne rnd
	ret

pgg2:
	mov r8,r15
	mov rax,r8
	mov r9,100
	xor rdx,rdx
	idiv r9
	add rax,48
	mov [z11],rax
	cmp rdx,10
	jl pgg21
	cmp rdx,10
	jge pgg22
	ret
pgg21:
	mov r8,48
	mov [z11+1],r8
	mov r8,rdx
	add r8,48
	mov [z11+2],r8
	mov r14,3
	jmp epgg
	ret
pgg22:
	mov rax,rdx
	xor rdx,rdx
	mov r8,10
	idiv r8
	add rax,48
	mov [z11+1],rax
	mov r8,rdx
	add r8,48
	mov [z11+2],r8
	mov r14,3
	jmp epgg
	ret
epgg:
	cmp r15,rbx
	jng rnd
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
