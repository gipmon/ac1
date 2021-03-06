	# Rafael Ferreira https://github.com/gipmon/ac1

	.include "macros.s"
	.include "routines.s"
	.data
	.align 3
arr:	.space 88
nr:	.asciiz "Numero: "
media:	.asciiz "Media: "
max_str:.asciiz "\nMax: "
mediana:.asciiz "\nMediana: "
	.text
	.globl main
main:
	add $sp, $sp, -4
	sw $ra, 0($sp)
	#
	li $t0, 0  # i = 0
	li $t1, 11 # unsigned int n
	la $t2, arr # array
#-----------------------------------
for:
	bge $t0, $t1, endfor
	la $a0, nr
	print_str
	#
	read_double
	mov.d $f4, $f0
	s.d $f4, 0($t2)
	#
	addiu $t0, $t0, 1
	addiu $t2, $t2, 8 # 8 bytes
	b for
endfor:
#-----------------------------------
	la $a0, arr
	li $a1, 11
	jal avarege
	#
	la $a0, media
	print_str
	#
	mov.d $f12, $f0
	print_double
#-----------------------------------
	la $a0, arr
	li $a1, 11
	jal max
	#
	la $a0, max_str
	print_str
	#
	mov.d $f12, $f0
	print_double
#-----------------------------------
	la $a0, arr
	li $a1, 11
	jal sort
	#-------
	la $a0, mediana
	print_str
	#
	mov.d $f12, $f0
	print_double
	print_enter
	print_enter
	#------- PRINT ARRAY
	la $t0, arr
	addiu $t1, $t0, 88
print_for:
	bge $t0, $t1, print_endfor
	#
	l.d $f12, 0($t0)
	print_double
	print_virgula
	addiu $t0, $t0, 8 # ponteiro
	b print_for
print_endfor:
#-----------------------------------
	lw $ra, 0($sp)
	addiu $ra, $ra, 4
#-----------------------------------
