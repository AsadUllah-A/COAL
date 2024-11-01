; Swapping Two Variables
.model small               ; Define the memory model as 'small' (64 KB code + 64 KB data)
.stack 100h               ; Reserve 256 bytes of stack space
.data                     ; Start of the data segment
    Var1 db 23           ; Define 'Var1' and initialize it to 23
    Var2 db 65           ; Define 'Var2' and initialize it to 65

.code                     ; Start of the code segment
main proc                 ; Begin main procedure
    ; Initialize data segment
    mov ax, @data        ; Load the address of the data segment into AX
    mov ds, ax           ; Move the value in AX to DS to set up the data segment

    ; Load the value of Var1 into AL
    mov al, Var1         ; Move the value of 'Var1' (23) into AL register

    ; Load the value of Var2 into BL
    mov bl, Var2         ; Move the value of 'Var2' (65) into BL register

    ; Swap the values
    mov Var1, bl         ; Store the value of BL (65) into 'Var1', so now Var1 = 65
    mov Var2, al         ; Store the value of AL (23) into 'Var2', so now Var2 = 23

    ; Exit the program
    mov ah, 4Ch          ; Prepare to call DOS function to terminate the program
    int 21h              ; Call DOS interrupt to terminate the program

main endp                 ; End of the main procedure
end main                  ; End of the assembly program
