.text
main:
    li $a0, 1
    li $a1, 5           #
    addi $a0, $a0, 5    #
    add $a1, $a1, $a0   #
    li $v0, 1
    move $a0, $a1
    syscall             #
    li $v0, 10
    syscall             #