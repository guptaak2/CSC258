# func1.s
.data
before: .asciiz "Before function\n"
resAdd: .asciiz "A + B is: "
resSub: .asciiz "A - B is: "
newline: .asciiz "\n"

.text
main:
	li $t0, 5	# hard coded value for A
	li $t1, 3	# hard coded value for B

	li $v0, 4 	# system call code for print_string
	la $a0, before 	# address of string to print
	syscall 	# print the string

	li $v0, 4 	# system call code for print_string
	la $a0, resAdd 	# address of string to print
	syscall 	# print the string

	# TODO: setup the arguments for function call doAdd
	add $a0, $zero, $t0
	add $a1, $zero, $t1
	jal doAdd 	# Make a function call to doAdd()
	move $t5, $v0
	li $v0, 1
	add $a0, $t5, $zero
	syscall
	#TODO: what exactly does jal do? Lookup the reference sheet

	# TODO: print the return value of doAdd
	
	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	

	li $v0, 4 	# system call code for print_string
	la $a0, resSub 	# address of string to print
	syscall 	# print the string

	# TODO: setup the arguments for function call doSub
	add $a0, $zero, $t0
	add $a1, $zero, $t1						
	jal doSub 	# Make a function call to doSub()
	move $t4, $v0
	li $v0, 1
	add $a0, $t4, $zero
	syscall
	# TODO: print the return value of doSub

	li $v0, 4 	# system call code for print_string
	la $a0, newline # address of string to print
	syscall 	# print the string	
									
	# End of main, make a syscall to "exit"
	li $v0, 10 	# system call code for exit
	syscall 	# terminate program	
	
# start of function doAdd()
doAdd:
	add $v0, $a0, $a1
	jr $ra
	# TODO: what need to be done here?

# start of function doSub()
doSub:
 	sub $v0, $a0, $a1
	# TODO: what need to be done here?
	jr $ra
 	 
