.data
	input: .ascii "11 22 33 44 55 65 74 83 93 18\n"
.text
main:
	jal minmax

	jr $ra
minmax:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)

	#li $v0, 4
	la $a0, input 
	#syscall

	addi $t5, $t5, -1
	addi $t6, $t6, -1

	move $t0, $zero #t0 is i 
	Loop: beq $t0, 27, Exit

		#sll $t2, $t0, 1
		add $t2, $a0, $t0 #t2 is &input[i]
		lb $t2, 0($t2) #t2 is input[i] 
		#addi $t2, $t2, -48
		move $t5, $t2

		#sll $t3, $t0, 1
		add $t3, $a0, $t0
		addi $t3, $t3, 1 
		lb $t3, 0($t3) #t3 is input[i+1]
		#addi $t3, $t3, -48
		move $t6, $t3


		#mul $t5, $t5, 10
		#add $t5, $t5, $t6





		addi $t0, $t0, 3

		j Loop
	Exit:

	move $t7, $zero
	add $t7, $a0, $t7
	lb $t7, 0($t7)
	#addi $t7, $t7, -48


	li $v0, 1
	move $a0, $t7
	syscall




	addi $sp, $sp, 4
	lw $s0, 0($sp)
	lw $s1, 4($sp)

	jr $ra