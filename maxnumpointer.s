# This program finds max number from the list of numbers.

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255

.section .text

.globl _start

_start:
  pushl data_items          #current value being examined
  call max
  movl %eax, %ebx
  movl $1, %eax
  int $0x80

.type max @function
max:
  pushl %ebp
  movl %esp, %ebp
  movl $0, %edi
  movl %eax, %ebx                           #lowest value
  cmpl $255, %eax
  je end

loop:
  movl 8(%ebp,%edi,4), %eax
  incl %edi
  cmpl $255, %eax
  je end
  cmpl %ebx, %eax
  jg loop
  movl %eax, %ebx
  jmp loop

end:
  movl %ebp, %esp
  popl %ebp
  ret
