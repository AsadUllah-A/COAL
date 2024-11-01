; Macro to display a string
display macro var
    lea dx, var      ; Load the address of the variable into DX
    mov ah, 9        ; DOS interrupt service for displaying a string
    int 21h          ; Call interrupt 21h to print the string
endm

.model small
.stack 100h
.data
    var db "Please select the proper number from the following (1-4)$"
    var1 db "1. Addition$"
    var2 db "2. Subtraction$"
    var3 db "3. Division$" 
    var6 db "4. Exit$"
    var4 db "Enter number 1: $"
    var5 db "Enter number 2: $"
    resultLabel db "Result: $"
    num1 db 0
    num2 db 0
    result db 0
.code
main proc
    mov ax, @data
    mov ds, ax

main_loop:
    ; Display menu
    display var
    call new_line
    display var1
    call new_line
    display var2
    call new_line
    display var3
    call new_line
    display var6
    call new_line

    ; Select operation
    mov ah, 1        ; Input for which option add, sub, div, or exit
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    cmp al, 1
    je addition
    cmp al, 2
    je subtraction
    cmp al, 3
    je division
    cmp al, 4
    je exit_program

    ; If an invalid option is selected, repeat
    jmp main_loop

exit_program:
    mov ah, 4Ch      ; DOS terminate program interrupt
    int 21h

main endp

addition proc
    ; Input number 1
    call new_line
    display var4
    call get_number
    mov num1, al

    ; Input number 2
    call new_line
    display var5
    call get_number
    mov num2, al

    ; Perform addition
    call new_line
    mov al, num1
    add al, num2
    mov result, al

    ; Display result
    call new_line
    display resultLabel
    call display_result
    jmp main_loop
addition endp    

subtraction proc
    ; Input number 1
    call new_line
    display var4
    call get_number
    mov num1, al

    ; Input number 2
    call new_line
    display var5
    call get_number
    mov num2, al

    ; Perform subtraction
    mov al, num1
    sub al, num2
    mov result, al

    ; Display result
    call new_line
    display resultLabel
    call display_result
    jmp main_loop
subtraction endp

division proc
    ; Input number 1
    call new_line
    display var4
    call get_number
    mov num1, al

    ; Input number 2
    call new_line
    display var5
    call get_number
    mov num2, al

    ; Perform division if num2 is not zero
    mov al, num1
    mov ah, 0
    div num2
    mov result, al

    ; Display result
    call new_line
    display resultLabel
    call display_result
    jmp main_loop
division endp

get_number proc
    ; Read a single digit (0-9)
    mov ah, 1
    int 21h
    sub al, '0'    ; Convert ASCII to integer
    ret
get_number endp

display_result proc
    ; Display the result as an ASCII character
    
    add result, '0'   ; Convert to ASCII  
    mov dl, result
    mov ah, 2         ; Display the character in DL
    int 21h   
    call new_line
    ret
display_result endp

new_line proc
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h 
    ret
new_line endp

end main
