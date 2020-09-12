##########################################
#
# if (a[i] > 10)
#      i = i + 1;
#
##########################################

.data
array:		.word 1, 20, 3, 40, 5, 6, 70, 8, 90, 10
index:		.word 3

.text
	.globl main
main:
	la $s0, array       # load address of array into $s0
	lw $s1, index       # load value stored at index into $s1

	sll $t0, $s1, 2     # $t0 = index * 4
	add $s2, $s0, $t0   # array[index] = array($t0) + $s0
	lw $a0, 0($s2)
	slti $t1, $a0, 10   # if (array[index] < 10) $t1 = 1; else $t1 = 0;
	bne $zero, $t1, EXIT
	addi $s1, $s1, 1    # increment the index
EXIT:
	move $a0, $s1
	li $v0, 1           # syscall number 1 will print int in $a0
	syscall

	li $v0, 10         # Syscall number 10 is to terminate the program
	syscall            # exit now
