# This program finds max number from the list of numbers.

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255

.section .text

.globl _start

_start:
  pushl $data_items          #current value being examined
  call max
  addl $4, %esp
  movl %eax, %ebx
  movl $1, %eax
  int $0x80

.type max @function
max:
  pushl %ebp
  movl %esp, %ebp
  movl $0, %eax
  movl $0, %edi
  movl 8(%ebp), %edx

loop:
  movl 0(%edx,%edi,4), %ebx
  incl %edi
  cmpl $255, %ebx
  je end
  cmpl %eax, %ebx
  jl loop
  movl %ebx, %eax
  jmp loop

end:
  movl %ebp, %esp
  popl %ebp
  ret
