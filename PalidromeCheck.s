.data

inputMsg: .asciiz "Enter a string:\n"
palMsg: .asciiz "Is Palindrome"
notPalMsg: .asciiz "Is Not Palindrome"

.text

is_palindrome:
    la $t0, ($a0)
    la $t1, ($a0)
    li $t2, '\n'

    li $s0, 0
    li $s1, 0
    reachEnd:
        lb $t3, ($t1)
        beq $t3, $t2, exit
        beqz $t3, exit

        addi $t1, $t1, 1
        addi $s1, $s1, 1
        j reachEnd
    exit:

    addi $t1, $t1, -1
    addi $s1, $s1, -1

    loop:
        bge $s0, $s1, pal

        lb $t3, ($t0)
        lb $t4, ($t1)


        beq $t3, $t4, cont
        j notPal

        cont:
        addi $t0, $t0, 1
        addi $t1, $t1, -1

        addi $s0, $s0, 1
        addi $s1, $s1, -1
        j loop

    pal:
        li $v0, 1
        jr $ra

    notPal:
        li $v0, 0
        jr $ra



.globl main
main:

    li $v0, 4
    la $a0, inputMsg
    syscall

    li $v0, 8
    syscall

    jal is_palindrome

    beq $v0, $0, printNo

    la $a0, palMsg
    j printFinalMsg

    printNo:
        la $a0, notPalMsg


    printFinalMsg:

    li $v0, 4
    syscall

    li $v0, 10
    syscall


.end main