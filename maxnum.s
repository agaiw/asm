# This program finds max number from the list of numbers.

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255

.section .text

.globl _start

_start:
  movl $0, %edi                           #current position on the list
  movl data_items(,%edi,4), %eax          #current value being examined
  movl %eax, %ebx                           #lowest value
  cmpl $255, %eax
  je end

loop:
  incl %edi
  movl data_items(,%edi,4), %eax
  cmpl $255, %eax
  je end
  cmpl %ebx, %eax
  jg loop
  movl %eax, %ebx
  jmp loop

end:
  movl $1, %eax
  int $0x80
