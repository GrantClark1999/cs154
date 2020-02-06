.data
array: .word 9, 1, 11, 5, 6, 14, 0, 3, 15, 13, 4, 12, 8, 2, 7, 10
size: .word 16

.text
swap:
    sll $t1, $a1, 2
    add $t1, $a0, $t1
    lw $t0, 0($t1)
    lw $t2, 4($t1)
    sw $t2, 0($t1)
    sw $t0, 4($t1)

    jr $ra


sort:
    addi $sp, $sp, -8           # Preserving arguments
    sw $a0, 0($sp)
    sw $a1, 4($sp)

    move $t0, $a0               # $t0 = v[]
    move $t1, $a1               # $t1 = n (array size)
    li $t2, -1                  # $t2 = i

outerLoop:
    move $t3, $t2               # $t3 = j = i-1 (i gets incremented below)
    addi $t2, $t2, 1            # i++
    blt $t2, $t1, innerLoop     # if(i < n) -> innerLoop

    lw $a0, 0($sp)
    lw $a1, 4($sp)
    addi $sp, $sp, 8            # Restoring arguments
    jr $ra

innerLoop:
    blt $t3, $zero, outerLoop   # if(j < 0) -> outerLoop

    sll $t4, $t3, 2             # $t4 = i * 4
    addi $t5, $t4, 4            # $t5 = (i+1) * 4
    add $t4, $t0, $t4           # $t4 = &v[i]
    add $t5, $t0, $t5           # $t5 = &v[i+1]
    lw $t4, 0($t4)              # $t4 = v[i]
    lw $t5, 0($t5)              # $t5 = v[i+1]

    bge $t5, $t4, outerLoop     # if(v[i+1] >= v[i]) -> outerLoop
    move $a1, $t3               # $a1 = j

    addi $sp, $sp, -4           # Preserve $ra
    sw $ra, 0($sp)
    jal swap                    # Function call to swap
    lw $ra, 0($sp)
    addi, $sp, $sp, 4           # Restore $ra

    addi $t3, $t3, -1           # j--
    j innerLoop



main:
    la $a0, array
    la $a1, size

    lw $a1, 0($a1)
    jal sort

exit:
    li $v0, 10
    syscall