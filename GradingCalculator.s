.data
EnterNumber: .asciiz "Enter your number\n"
gradeAA: .asciiz "AA\n"
gradeA: .asciiz "A\n"
gradeBB: .asciiz "BB\n"
gradeB: .asciiz "B\n"
gradeCC: .asciiz "CC\n"
gradeC: .asciiz "C\n"
gradeD: .asciiz "D\n"
gradeF: .asciiz "F\n"
.text
.globl main
main:


li $v0,4
la $a0, EnterNumber
syscall

li $v0,5
syscall


li $s0, 50
blt $v0, $s0, printF


li $s0, 70
blt $v0, $s0, printD

li $s0, 75
blt $v0, $s0, printC

li $s0, 80
blt $v0, $s0, printCC

li $s0, 85
blt $v0, $s0, printB

li $s0, 90
blt $v0, $s0, printBB

li $s0, 95
blt $v0, $s0, printA

li $s0, 101
blt $v0, $s0, printAA

printF:
li $v0, 4
la $a0, gradeF
syscall
j Exit

printD:
li $v0, 4
la $a0, gradeD
syscall
j Exit

printC:
li $v0, 4
la $a0, gradeC
syscall
j Exit

printCC:
li $v0, 4
la $a0, gradeCC
syscall
j Exit

printB:
li $v0, 4
la $a0, gradeB
syscall
j Exit

printBB:
li $v0, 4
la $a0, gradeBB
syscall
j Exit

printA:
li $v0, 4
la $a0, gradeA
syscall
j Exit


printAA:
li $v0, 4
la $a0, gradeAA
syscall
j Exit



Exit:
li $v0, 10
syscall
.end main