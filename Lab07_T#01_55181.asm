.model small               ; Define small memory model (64 KB code + 64 KB data)
.stack 100h                ; Reserve 256 bytes for the stack
.data                      ; Start of the data segment
    msg db 'Asad Ullah', '$' ; Define a string 'msg' with "Asad Ullah", terminated with '$' (DOS string terminator)
.code                      ; Start of the code segment
main proc                  ; Begin main procedure

    mov ax, @data          ; Set up the data segment by moving the address of the data segment into AX
    mov ds, ax             ; Load the data segment address into DS register for accessing variables

    ; Print the original string
    mov ah, 09h            ; DOS interrupt function 09h to print a string
    lea dx, msg            ; Load the address of 'msg' into DX (for DOS to print)
    int 21h                ; Call DOS interrupt to display the string "Asad Ullah"
    
    ; Print a new line (for visual clarity)
    mov ah, 02h            ; DOS function 02h to display a character
    mov dl, 0Dh            ; Carriage return (ASCII 0Dh, moves cursor to the start of the next line)
    int 21h                ; Call DOS interrupt to print carriage return
    mov dl, 0Ah            ; Line feed (ASCII 0Ah, moves cursor down to the next line)
    int 21h                ; Call DOS interrupt to print line feed

    ; Reverse the string using the stack
    lea si, msg            ; Load the address of 'msg' into the SI register
    mov cx, 10             ; Load the count of characters (10) into CX (to reverse 10 characters in the string)
reverse_loop:              ; Label to mark the beginning of the reverse loop
    mov al, [si]           ; Load the character at the address pointed by SI into AL
    push ax                ; Push the character onto the stack
    inc si                 ; Increment SI to move to the next character in the string
    loop reverse_loop      ; Decrease CX by 1, and repeat the loop until CX reaches 0 (reversing all characters)

    ; Print the reversed string by popping from the stack
print_loop:                ; Label for the print loop
    pop dx                 ; Pop the character from the stack into DX (low byte is used by DOS for printing)
    mov ah, 02h            ; DOS function 02h to print a single character
    int 21h                ; Call DOS interrupt to display the popped character
    cmp sp, 100h           ; Compare the stack pointer to the original value (100h means the stack is empty)
    jne print_loop         ; If the stack is not empty, jump back to print_loop and continue popping characters

    ; Exit the program
    mov ah, 4Ch            ; DOS interrupt function 4Ch to terminate the program
    int 21h                ; Call DOS interrupt to terminate the program
main endp                  ; End of the main procedure
end main                   ; End of the program
