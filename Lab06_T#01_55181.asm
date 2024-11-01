.model small               ; Define small memory model (64 KB code + 64 KB data)
.stack 100h               ; Reserve 256 bytes for stack
.data                     ; Start of the data segment
    arr db 4, 1, 3, 5, 6, 7  ; Define an array 'arr' with 6 elements

.code                     ; Start of the code segment
main proc                 ; Begin main procedure
    mov ax, @data        ; Set up data segment
    mov ds, ax           ; Load data segment address

    lea si, arr          ; Load address of 'arr' into SI
    mov cx, 6            ; Set CX to the number of elements in 'arr'
    
display_loop:            ; Label for the loop
    mov dl, [si]         ; Load current array element into DL
    add dl, '0'          ; Convert number to ASCII ('0' is 48)
    mov ah, 2            ; Prepare to display character
    int 21h              ; Call DOS interrupt to display the character
    
    inc si               ; Move to next element
    loop display_loop     ; Repeat until all elements are displayed

    ; Exit the program
    mov ah, 4Ch          ; Prepare to terminate the program
    int 21h              ; Call DOS interrupt to terminate

main endp                 ; End of main procedure
end main                  ; End of the assembly program
