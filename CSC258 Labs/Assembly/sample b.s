.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int: "
resultOdd: .asciiz "THIS IS ODD"
resultEven: .asciiz "THIS IS EVEN" 
newline: .asciiz "\n"

.globl main
.text

main: 
	li $v0, 4		      
	la $a0, promptA
	syscall    

	li $v0, 5
	syscall 
	move $t0, $v0

	andi $t4, $t0, 1
	bne $t4, 1, EVEN
	j ODD

ODD:	
	li $v0, 4
	la $a0, resultOdd
	syscall
	j END

EVEN: 	li $v0, 4
	la $a0, resultEven
	syscall
	j END

END:
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 10
	syscall
