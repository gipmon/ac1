	.include "rotines.s"
	.include "macros.s"
	.data
x:	.double 3.7
	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	#----------------
	l.d $f12, x
	li $a0, -2 # Y (int)
	jal xtoy
	mov.d $f12, $f0
	print_double
	#----------------
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
