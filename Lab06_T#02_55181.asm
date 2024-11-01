.model small               ; Define small memory model (64 KB code + 64 KB data)
.stack 100h               ; Reserve 256 bytes for the stack
.data                     ; Start of the data segment
.code                     ; Start of the code segment
main proc                 ; Begin main procedure
    ; Display digits 0 to 9
    mov dl, '0'          ; Load ASCII value of '0' into DL to start printing digits
    mov cx, 10           ; Set CX to 10 for the number of digits (0-9)
LABEL_DIGITS:            ; Label for the digit loop
    mov ah, 2            ; DOS function to display character (set AH to 2)
    int 21h              ; Call DOS interrupt to print the character in DL
    inc dl               ; Increment DL to get the next ASCII character (next digit)
    loop LABEL_DIGITS    ; Decrement CX and loop back to LABEL_DIGITS until CX is zero

    ; Display letters A to Z
    mov dl, 'A'          ; Load ASCII value of 'A' into DL to start printing letters
    mov cx, 26           ; Set CX to 26 for the number of letters (A-Z)
LABEL_LETTERS:           ; Label for the letter loop
    mov ah, 2            ; DOS function to display character (set AH to 2)
    int 21h              ; Call DOS interrupt to print the character in DL
    inc dl               ; Increment DL to get the next ASCII character (next letter)
    loop LABEL_LETTERS   ; Decrement CX and loop back to LABEL_LETTERS until CX is zero

    ; Exit the program
    mov ah, 4Ch          ; Prepare to terminate the program (set AH to 4Ch)
    int 21h              ; Call DOS interrupt to terminate the program

main endp                 ; End of main procedure
end main                  ; End of the assembly program
