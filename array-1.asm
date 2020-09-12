##########################################
#
# Print an array of integers
#
##########################################

.data
array:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
SPACE:		.asciiz " "

.text
	.globl main
main:
	#-----------------------------------------------------------------
	la $s0, array         # load address of array into $s0
	#-----------------------------------------------------------------

	#
	# print the array
	#
	addi $t1, $t1, 10     # $t1 = size of the array, loop counter
	add $t0, $t0, $zero   # $t0 = i = 0, the loop index
LOOP:
	sll $t2, $t0, 2       # $t2 = i * 4
	add $s1, $s0, $t2     # array[i] = $s0 + $t2
	lw $a0, 0($s1)        # $a0 = array[i]
	addi $t0, $t0, 1      # i = i + 1
	#-----------------------------------------------------------------
	li $v0, 1             # syscall number 1 will print int in $a0
	syscall
	li $v0, 4             # syscall number 4 will print string in $a0
	la $a0, SPACE
	syscall
	#-----------------------------------------------------------------
	addi $t1, $t1, -1     # decrement the loop counter
	bne $zero, $t1, LOOP  # loop till end of the array

	#
	# exit
	#
	li $v0, 10            # Syscall number 10 is to terminate the program
	syscall               # exit now
