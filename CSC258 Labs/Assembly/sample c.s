.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int: "
result: .asciiz "TOO MANY TIMES"
newline: .asciiz "\n"
number: .word 5

.globl main
.text

main: 	
	add $t6, $zero, $zero
	lw $t4, number
	li $t5, 5
	sw $t5, number
	
WHILE: 
	li $v0, 4		      
	la $a0, promptA
	syscall    

	li $v0, 5
	syscall 
	move $t0, $v0
	
	andi $t4 $t0, 1
	bne $t4, 1, END
	addi $t6, $t6, 1
	bne $t6, 5, WHILE 
	j PRINT
	
END:
	li $v0, 10
	syscall

PRINT: 	
	li $v0, 4
	la $a0, newline
	syscall 
		
	li $v0, 4
	la $a0, result
	syscall
	
	j END
