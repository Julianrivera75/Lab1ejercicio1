.data
prompt1: .asciiz "Ingrese  el primer numero a comprar: "
prompt2: .asciiz "Ingrese el segundo numero a comparar: "
prompt3: .asciiz "Ingrese el tercer numero a comparar: "
resultado: .asciiz "El numero mayor es: "

.text
.globl main

main:
    # Mostrar el primer prompt y leer el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0   # Guardar el primer número en $t0
    
    # Mostrar el segundo prompt y leer el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0   # Guardar el segundo número en $t1
    
    # Mostrar el tercer prompt y leer el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0   # Guardar el tercer número en $t2
    
    # Comparar los números para encontrar el menor
    move $t3, $t0   # Suponemos que el primer número es el menor
    blt $t1, $t3, update_min   # Si el segundo número es menor, actualizar el mínimo
    move $t3, $t1
update_min:
    blt $t2, $t3, update_min_final   # Si el tercer número es menor, actualizar el mínimo
    move $t3, $t2
update_min_final:
    # Mostrar el resultado
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Terminar el programa
    li $v0, 10
    syscall
