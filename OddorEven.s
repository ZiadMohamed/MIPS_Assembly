.data
EnterNumber: .asciiz "Enter your number\n"
odd: .asciiz "odd\n"
even: .asciiz "even\n"
.text
.globl main
main:

li $s0, 2

loop:

    li $v0,4
    la $a0, EnterNumber
    syscall

    li $v0,5
    syscall

    beq $v0, $0, exit

    rem $t0, $v0, $s0

    beq $t0, $0,printEven

    li $v0,4
    la $a0, odd
    syscall
    j loop

    printEven:
        li $v0,4
        la $a0, even
        syscall

    j loop




exit:

li $v0, 10
syscall
.end main