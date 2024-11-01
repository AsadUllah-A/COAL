.model small               ; Define small memory model (64 KB code + 64 KB data)
.stack 100h                ; Reserve 256 bytes for stack
.data                      ; Start of the data segment
    arr db 1, 2, 3, 2      ; Define an array 'arr' with 4 elements (1, 2, 3, 2)
    sum db 0               ; Variable to store the sum of the array elements
    msg db 'Sum=', 0       ; Message to display before the result

.code                      ; Start of the code segment
main proc                  ; Begin main procedure
    ; Initialize data segment
    mov ax, @data          ; Set up the data segment
    mov ds, ax             ; Load data segment address

    ; Initialize sum and loop
    xor al, al             ; Clear AL to start summing from 0
    mov cx, 4              ; Set CX to the number of elements in 'arr' (4 elements)
    lea si, arr            ; Load the address of 'arr' into SI
    
sum_loop:                  ; Label for the summation loop
    add al, [si]           ; Add the current element of the array to AL (AL = AL + [SI])
    inc si                 ; Move to the next element in the array
    loop sum_loop          ; Decrement CX and repeat until all elements are processed
    
    mov sum, al            ; Store the sum in the 'sum' variable

    ; Display the message "Sum="
    mov dx, offset msg     ; Load the address of the message into DX
    mov ah, 09h            ; DOS interrupt function 09h to display a string
    int 21h                ; Call DOS interrupt to display the message

    ; Convert sum to ASCII and display
    mov al, sum            ; Move the sum into AL
    add al, '0'            ; Convert the sum to ASCII ('0' is 48)
    mov dl, al             ; Move the ASCII sum to DL for display
    mov ah, 02h            ; DOS interrupt function 02h to display a character
    int 21h                ; Call DOS interrupt to display the sum

    ; Exit the program
    mov ah, 4Ch            ; DOS interrupt function 4Ch to terminate the program
    int 21h                ; Call DOS interrupt to terminate

main endp                  ; End of the main procedure
end main                   ; End of the assembly program
