# This function cannot successfully return a value for ints greater than 5
# because status code returned to the operating system from a program
# cannot exceed 255

.section .data

.section .text

.globl _start

_start:
  pushl $4
  call factorial
  addl $4, %esp
  movl %eax, %ebx
  movl $1, %eax
  int $0x80

.type factorial @function

factorial:
  pushl %ebp
  movl %esp, %ebp
  movl 8(%ebp), %ebx
  cmp $1, %ebx
  je last
  decl %ebx
  push %ebx
  call factorial
  imull 8(%ebp), %eax    
  movl %ebp, %esp
  popl %ebp
  ret

last:
  movl $1, %eax
  movl %ebp, %esp
  popl %ebp
  ret
