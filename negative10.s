.data

arr: .word -11,-5,2,-9,22,-45,56,100,-101,54

.text


is_negative:


    blt $a2, $0, isNeg
    li $v1, 1
    jr $ra

    isNeg:
    li $v1, 0
    jr $ra


count_negative_array:

    addi $sp, $sp, -4
    sw $ra, ($sp)

    li $s1, 0
    li $s0, 0
    la $t0, ($a0)
    addi $s3, $a1, 0

    loop:
        beq $s0, $s3, exit
        lw $a2, ($t0)
        jal is_negative
        bne $v1, $0, notCnt
        addi $s1, $s1, 1

        notCnt:
        addi $s0, $s0, 1
        addi $t0, $t0, 4
        j loop
    exit:

    addi $v0, $s1, 0

    lw $ra, ($sp)
    addi $sp, $sp, 4
    jr $ra


.globl main
main:

    la $a0, arr

    li $a1, 10

    jal count_negative_array


    li $a0, 0
    addi $a0, $v0, 0

    li $v0, 1
    syscall

    li $v0, 10
    syscall

.end main