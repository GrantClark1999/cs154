.text
jerry:
    addi $t0, $a0, 0x2
    addi $t1, $zero, 0x3
    mult $t0, $t1
    mflo $v0
    jr $ra

morty:
    addi $sp, $sp, -0x8
    sw $a0, 4($sp)
    sw $ra, 0($sp)

    addi $s0, $zero, $a0
    sll $a0, $a0, 0x1
    addi $a0, $a0, -0x6

    jal jerry
    add $s1, $zero, $v0
    add $a0, $zero, $v0
    jal jerry

    add $v0, $v0, $s1

    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 0x8

    jr $ra

main:
    addi $a0, $zero, -0x5
    jal morty
    sll $v0, $v0, 0x2

print:
    add $a0, $zero, $v0
    addi $v0, $zero, 0x1
    syscall

exit:
    addi $v0, $zero, 0xA
    syscall