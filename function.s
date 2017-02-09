# This program computes the result of the following expression:
# 2^3 + 5^2

.section .data

.section .text

.globl _start

_start:

  pushl $3          # push params
  pushl $2
  call power
  addl $8, %esp     # remove params
  pushl %eax        # save result

  pushl $2
  pushl $5
  call power
  addl $8, %esp
  popl %ebx         # second argument is in %eax already
                    # so first one shall be placed in %ebx

  addl %eax, %ebx   # result of adding placed in %ebx

  movl $1, %eax     # exit - result is in %ebx
  int $0x80

.type power, @function

power:
  pushl %ebp
  movl %esp, %ebp
  movl $1, %eax
  movl 12(%ebp), %ebx
  movl 8(%ebp), %ecx
  jmp loop

loop:
  cmp $0, %ebx
  je finish
  imull %ecx, %eax
  decl %ebx
  jmp loop

finish:
  movl %ebp, %esp
  popl %ebp
  ret 
