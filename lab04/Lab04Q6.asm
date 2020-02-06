.data
array: .word 3, 5, 2, 1, 7
units: .asciiz " units.\n"

.text
rick:
    sll $v0, $a0, 0x1
    sub $v0, $v0, $a1
    jr $ra

main:
    addi $a1, $zero, 0x2        # $a1 = b
    addi $s0, $zero, -0x4       # $s0 = i (index) [-4]

    li $v0, 1
    move $a0, $s0
    syscall

#     addi $s1, $zero, 0x14       # $s1 = 20 (const, loop stop condition)
#     la $s2, array               # $s2 = a

# loop:
#     addi $s0, $s0, 0x4
#     beq $s0, $s1, exit
#     add $v0, $zero, $zero       # $v0 = 0

#     add $t0, $s2, $s0           # $t0 = &a[i]
#     lw $a0, 0($t0)              # $a0 = a[i]
#     slt $t1, $a1, $a0           # (b < a[i]) ? 1 : 0
#     beq $t1, $zero, print       # branch when a[i] <= b

#     jal rick

# print:
#     add $a0, $v0, $zero         # print v
#     addi $v0, $zero, 0x1
#     syscall
#     la $a0, units               # print string
#     addi $v0, $zero, 0x4
#     syscall

#     j loop

exit:
    addi $v0, $zero, 0xA         # exit syscall
    syscall