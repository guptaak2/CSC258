# func2.s
.data
prompt: .asciiz "Enter a number: "
result: .asciiz "result is: "
newline: .asciiz "\n"

.text
main:
	# print newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# print prompt message
	li $v0, 4                 
	la $a0, prompt
	syscall    

	# get an integer input from user
	li $v0, 5
	syscall 
	
	# make room on the stack
	move $a0, $v0 #set a0 = v0
	addi $sp, $sp, -4
	sw $a0, 0($sp) #store a0 on the stack

    # print "result: "
	li $v0, 4 	# system call code for print_string
	la $a0, result 	# address of string to print
	syscall 	# print the string

	# TODO: prepare arguements before calling double()
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	add $a0, $a0, $zero
	jal double 	# Make a function call to double()

	# TODO: print the result value of double()
	li $v0, 1
	syscall
	# TODO: exit the program
	li $v0, 10
	syscall
	
# start of function double()
double:
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	#TODO: what need to pushed to the stack?
	
	jal square # call square()
	lw $ra, 4($sp)
	move $a0, $a0
	add $a0, $a0, $a0
	addi $sp, $sp, 4
	jr $ra
	#TODO: what need to be popped from the stack?

# start of function square()
square:
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	#TODO: what need to pushed to the stack?
	
 	jal plusOne # call plusOne
 	lw $ra, 4($sp)
 	move $a0, $v0
 	mul $a0, $a0, $a0
 	mflo $a0
 	addi $sp, $sp, 8
 	jr $ra
	#TODO: what need to be popped from the stack?
 	
# start of function plusOne()
plusOne:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	#TODO: what need to pushed to the stack?
	lw $a0, 0($sp)
	addi $v0, $a0, 1
	addi $sp, $sp, 4
	jr $ra
	#TODO: what need to be popped from the stack?
 	
