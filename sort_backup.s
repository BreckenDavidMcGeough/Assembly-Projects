.globl display_array

    #####################
# Do not modify the lines between the # boundaries
    #####################
.data
    example_sorted_arr: .word 10, 20, 30, 50, 60, 70, 80, 90, 95, 99 # Example of a sorted array just for prinitng the final output
    #####################
    input: .space 31 # Allocating space for 10 (base-10) integers including whitespaces
    sorted_array: .word 0:10

    #####################
.text    
main:
    #####################
    li $v0, 8      # Sycall number to read string from user 
    la $a0, input  # Address to store the user input
    la $a1, 31     # max length for user input 
    syscall
    #####################
    # Write your implementation below


    #create int array from input string
    la $t4, sorted_array

    move $t0, $zero
    move $t3, $zero

    Loop0: beq $t0, 30, Exit0

        add $t1, $a0, $t0
        lb $t1, 0($t1)
        addi $t1, $t1, -48

        add $t2, $a0, $t0
        addi $t2, $t2, 1
        lb $t2, 0($t2)
        addi $t2, $t2, -48

        mul $t1, $t1, 10
        add $t1, $t1, $t2


        add $t5, $t4, $t3
        sw $t1, 0($t5)


        addi $t3, $t3, 4
        addi $t0, $t0, 3

        j Loop0
    Exit0:

    addi $t1, $zero, 36


    move $t0, $zero
    move $t1, $zero
    move $t2, $zero
    move $t3, $zero
    move $t5, $zero




    move $t0, $zero 
    Loop: beq $t0, 10, Exit

        move $t1, $zero
        Loop2: beq $t1, 36, Exit2

            add $t2, $t4, $t1
            lw $t2, 0($t2)

            add $t3, $t4, $t1
            addi $t3, $t3, 4
            lw $t3, 0($t3)

            slt $t5, $t3, $t2

            bne $t5, 1, L3
                add $t7, $t4, $t1

                add $t6, $zero, $t2
                sw $t3, 0($t7)
                addi $t7, $t7, 4
                sw $t6, 0($t7)
            L3:




            addi $t1, $t1, 4
            j Loop2
        Exit2:

        addi $t0, $t0, 1
        j Loop
    Exit: 
    










    # Printing final ouput in the correct format (update $a0 with the address of your sorted int array)
    #la $a0, example_sorted_arr # you can use the instruction move if your sorted array is in a different register than $a0
    la $a0, sorted_array
    jal display_array
    #####################
exit:
    addi $v0, $0, 10
    syscall                # Exit
    #####################

display_array:
    move $t0, $a0 # copy the starting address of the sorted sequence
    add $t2, $0, $0 # initialize the counter to 0 
    addi $t3, $0, 9 # number of times the loop will run for a 10-element array
    arr_loop: 
        lw $a0, 0($t0) 
        li $v0, 1         # syscall number for printing integer
        syscall
        addi $t0, $t0, 4  # increment address by 4
        beq $t2, $t3, exit
        li $a0, 32  # print space, 32 is ASCII code for space
        li $v0, 11  # syscall number for printing character
        syscall
        addi $t2,$t2, 1    # increment counter 
        j arr_loop
