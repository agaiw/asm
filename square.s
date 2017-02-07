.section .data

.section .text


.globl _start

_start:
  pushl $10
  call square
  movl %eax, %ebx
  movl $1, %eax
  int $0x80

.type square @function
square:
  pushl %ebp
  movl %esp, %ebp
  movl 8(%ebp), %eax
  imull %eax, %eax
  movl %ebp, %esp  # line not needed because %esp was not moved
                   # in the meanwhile, but still considered as a good practice
  popl %ebp
  ret
