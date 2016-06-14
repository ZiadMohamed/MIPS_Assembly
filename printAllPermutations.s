.data
msg: .asciiz "Enter your string:\n"
newLine: .asciiz "\n"
.text


perm:
    addi $sp, $sp, -12
    sw $ra, 8($sp)

    beq $a2, $a1, printString

    li $s0, 0
    add $s0, $s0, $a2

    la $a0, ($t5)
    la $t0, ($a0)

    add $a0, $a0, $a2
    add $t0, $t0, $a2

    loop:
        beq $s0, $a1, perm_return
        lb $t1, ($t0)
        lb $t2, ($a0)
        sb $t1, ($a0)
        sb $t2, ($t0)

        sw $a2, 4($sp)
        sw $s0, 0($sp)

        addi $a2, $a2, 1
        jal perm

        lw $s0, 0($sp)
        lw $a2, 4($sp)

        la $a0, ($t5)
        la $t0, ($t5)
        add $a0, $a0, $s0
        add $t0, $t0, $a2


        lb $t1, ($t0)
        lb $t2, ($a0)
        sb $t1, ($a0)
        sb $t2, ($t0)

        addi $a0, $a0, 1
        addi $s0, $s0, 1
        j loop


printString:
    li $v0, 4
    la $a0, ($t5)
    syscall

    la $a0, newLine
    syscall
    
    la $a0, ($t5)


perm_return:
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra


.globl main
main:

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 8
    syscall

    la $t5, ($a0)

    li $a1, 0

    getSz:
        lb $t0, ($a0)
        beq $t0, '\n', exitGetSz
        addi $a0, $a0, 1
        addi $a1, $a1, 1
        j getSz
    exitGetSz:

    li $a2, 0

    jal perm

    li $v0, 10
    syscall

.end main