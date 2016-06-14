.data

inputMsg: .asciiz "Enter an integer number:\n"
outputMsg1: .asciiz "The factorial of "
outputMsg2: .asciiz " is:\n"

.text

readInt:
    li $v0, 4
    la $a0, inputMsg
    syscall

    li $v0, 5
    syscall
    jr $ra

calculateFactorial:

    addi $t0, $a0, 0


    beq $t0, $0, specialCase

    addi $t1, $t0, -1

    loop:
        beq $t1, $0, exit
        mul $t0, $t0, $t1
        addi $t1, $t1, -1
        j loop
    exit:

    addi $v0, $t0, 0
    jr $ra

    specialCase:
        li $v0, 1
        jr $ra

.globl main
main:

    jal readInt

    addi $t0, $v0, 0


    li $v0, 4
    la $a0, outputMsg1
    syscall

    li $v0, 1
    addi $a0, $t0, 0
    syscall

    li $v0, 4
    la $a0, outputMsg2
    syscall


    addi $a0, $t0, 0
    jal calculateFactorial

    addi $a0, $v0, 0
    li $v0, 1
    syscall



    li $v0, 10
    syscall


.end main