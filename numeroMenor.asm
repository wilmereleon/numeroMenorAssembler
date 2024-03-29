.data
    mensaje: .asciiz "Ingrese un n�mero: "
    num1: .word 0
    num2: .word 0
    num3: .word 0
    menor: .word 0
    resultado: .asciiz "El n�mero menor es: "

.text
.globl main
main:
    # Se pide al usuario que ingrese el primer n�mero
    li $v0, 4
    la $a0, mensaje
    syscall

    # Se lee el primer n�mero
    li $v0, 5
    syscall
    sw $v0, num1

    # Se pide al usuario que ingrese el segundo n�mero
    li $v0, 4
    la $a0, mensaje
    syscall

    # Se lee el segundo n�mero
    li $v0, 5
    syscall
    sw $v0, num2

    # Se pide al usuario que ingrese el tercer n�mero
    li $v0, 4
    la $a0, mensaje
    syscall

    # Se lee el tercer n�mero
    li $v0, 5
    syscall
    sw $v0, num3

    # Se cargan los tres n�meros a registros
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3

    # Se asume que el primer n�mero es el menor
    move $t3, $t0

    # Se compara con el segundo n�mero
    blt $t1, $t3, update_min1
    bge $t1, $t3, check_third

update_min1:
    move $t3, $t1

check_third:
    # Comparar con el tercer n�mero
    blt $t2, $t3, update_min2
    j print_min

update_min2:
    move $t3, $t2

print_min:
    li $v0, 4
    la $a0, resultado
    syscall
    
    # Imprimir el n�mero menor
    li $v0, 1
    move $a0, $t3
    syscall

    # Salir del programa
    li $v0, 10
    syscall