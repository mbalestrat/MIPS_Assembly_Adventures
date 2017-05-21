# Laboratory Exercise 3 for lab 9 
# Written by Andy russell 20/03/2009 

	.text 
	.globl start 
	
start: 	
		lui $29, 0x8001 	# Load $sp with upper half of stack address 
					# Lower half is filled with zeros 
		ori $29, 0xFFF8		# Now load the lower 16 bits					
		li  $4, 0x0003     	# load argument register $4 with number to be squared					
		jal square      	# call the recursive function to calculate the square
		nop
		
infinite: 
		b infinite 		# wait here when the calculation has finished 
					# $v0 = $2 contains the result
		nop 			# Needed after branch  

#---------------------------------------------------------------
#square - input parameter $a0 contains number to be squared
#         result returned in register $v0
#---------------------------------------------------------------
		
square: 	
		sub $29, $29, 8		# decrement the stack pointer $29
		sw  $31, 0($29)		# push the return address register $ra
		nop		
					
		#sw  $4, 0($29)		# push argument register $a0
		nop		
					
		li  $8, 0x0001		# load $t0 with 1 as part of test for base case
		bne $4, $8, notbase	# branch if not the base case
		nop
		
		li  $2, 0x0001		# return base result in $v0
		add $29, $29, 8		# recover stack space (Note: did not corrupt registers)
		jr  $31			# jump to return address in $ra
		nop
	
#*****************************************
#your code for the non-base case goes here 
#*****************************************

notbase: 
		#li $t0, 1
		#sub $t1, $a0, $t0		#(n-1) 
		#addi $t1, $t1, 1 		# + 1
		#sll $t1, $t1, 1			# Must calculate x2
		
						# add (n - 1)^squared; feed n-1 into square loop
			
			
		jr  $31				# jump to contents of return address register $ra
		nop		
 					# Marks the end of the program 