# MOSENENE S
# 202000224

.data
	newLine:	.asciiz	"\n"
.text
	main:
	
		jal reversibleprime			#Call the function
		
		li $v0,10				##terminate the function
		syscall
		
	reverse:
		move $t1, $a0		# move $ao from the caller the store is register t1
		li $t0,0		#reverse =0
		li $s0,10		
		
		while:
			beqz $t1, return_reverse	#while num is equal to zero exit
			div $t1, $s0			# number divided by 10
			mfhi $s1			#move remainder high register to s1 register
			mul $t0, $t0, $s0		#reverse = reverse * t0
			add $t0, $t0, $s1		#reverse = reverse + 1
			div $t1, $t1, $s0
			
		j while					# iterates the while loop
		jr $ra					# return to the caller
	
	return_reverse:
		move $v1, $t0				#move result from the function to register v1
		jr $ra
		
	
	exit:
	li $v0, 10
	syscall
		
	prime:	
		add $t2, $a0, $zero
		li $t3, 2
		
		blt  $t2, $t3, terminate	#if $t2 is less than $t3
		
		for1:
			bge $t3, $t2, end
			
			div $t2, $t3		#num = t2
			mfhi $t4		
			beqz $t4, terminate
			addi $t3, $t3,1
			j for1
			jr $ra
			
	terminate:
		li $v1, 0
		jr $ra
			
	end:
		li $v1,1
		jr $ra
		
		
	reversibleprime:
		li $t5, 1
		li $t6,0		#count = 0
	for:
		bge $t6,10,exit		# count < 10
		
		move $a0, $t5
		jal prime
		move $t7, $v1		#move result found in prime function in register $t7
		
		bne $t7, 1, run
		
		mul $t8, $t5, $t5	#t8 = squared
		
		move $a0, $t8
		jal reverse
		move $t9, $v1	#t9 = reversed
		
		beq $t8, $t9, run	
		
		li $t0, 0	#t0= i
		div $t1, $t9, 2		#t1 = reversed/2
	for2:
		bge $t0, $t1,run
		mul $s0, $t0, $t0
		
		bne $s0, $t9,return_to_for2	#if $t9 is nor equivalent to $s0 go to return_to_for function to run loop again
		
		move $a0, $t0
		jal prime
		move $t3, $v1
		
		bne $t3, 1, run
		
		li $v0, 1
		move $a0, $t8
		syscall
		
		li	$v0, 4
		la	$a0, newLine		# print the message 
		syscall
		
		addi $t6, $t6, 1
		addi $t5, $t5, 1
		
		j for
		jr $ra
		
		
	return_to_for2:
		addi $t0, $t0, 1		#$t0 = $t0 + 1
		j for2				#return to for2 and run again
		jr $ra	
		
run:
	addi $t5, $t5, 1
	j for
	jr $ra
