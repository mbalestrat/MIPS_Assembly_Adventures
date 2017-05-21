# Laboratory Exercise 2, of Lab 8 
# Written by Jan Eric Larsson, 27 October 1998

	.set noreorder 
	.text 
	.globl start 
	.ent start 
	
start: 	lui $9, 0xFFFF 		# Load upper half of port address 
				# Lower half is filled with zeros 
repeat: lbu $8, 0x0($9)		# Read from the input port 
	nop			# Needed after load
	sb  $8, 0x0($9) 	# Write to the output port 
	nop			# Another nop for the sb
	b repeat 		# Repeat the read and write cycle 
	nop 			# Needed after branch  
.end start 			# Marks the end of the program 