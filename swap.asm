.data
v: .word 13, 17, 19, 23, 29
newLine: .asciiz "\n"

.text
main:
    la $a0, v
    li $a1, 3

swap:
    sll $t1, $a1, 2
    add $t1, $a0, $t1
    lw $t0, 0($t1)
    lw $t2, 4($t1)
    sw $t2, 0($t1)
    sw $t0, 4($t1)

print:
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall
    li $v0, 1
    move $a0, $a1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall

exit:
    li $v0 10
    syscall