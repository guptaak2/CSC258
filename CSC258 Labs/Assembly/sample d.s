.data 
newline: .asciiz "\n"
array1: .word 5, 8, 3, 4, 7, 2

.globl main
.text

main: 	
	add $t2, $zero, 1  #intializs mult to 0
	addi $t3, $zero, 6 #load 6 into t3
	add $t6, $zero, $zero #counter (i=0)
	la $s6, array1 #store address of array1
	
	
loop: 
	lw $s5, ($s6) #s5 = array1[i]
	mul $t2, $t2, $s5
	addi $s6, $s6, 4
	addi $t6, $t6, 1 #i++
	bne $t6, $t3, loop 
	j PRINT
	
END:
	li $v0, 10
	syscall

PRINT: 	

	li $v0, 4
	la $a0, newline
	syscall 
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	j END
	
