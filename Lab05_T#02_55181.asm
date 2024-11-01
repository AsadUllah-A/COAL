; Adding Numbers Through Variables 

.model small               ; Define the memory model as 'small' (64 KB code + 64 KB data)
.stack 100h               ; Reserve 256 bytes of stack space
.data                     ; Start of the data segment
   variable1 DB 1        ; Define 'variable1' and initialize it to 1 (DB: Define Byte)
   variable2 DB 2        ; Define 'variable2' and initialize it to 2
   variable3 DB 3        ; Define 'variable3' and initialize it to 3
   result    DB 0        ; Define 'result' to store the sum (initialized to 0)
   char      DB ?        ; Define 'char' to hold the ASCII character of the result

.code                     ; Start of the code segment
main proc                 ; Begin main procedure
    mov ax, @data        ; Load the address of the data segment into AX
    mov ds, ax           ; Move the value in AX to DS to set up the data segment

    ; Load the first number into AL
    mov al, variable1    ; Move the value of 'variable1' (1) into AL register

    ; Add the second number to AL
    add al, variable2    ; Add the value of 'variable2' (2) to AL (AL = AL + variable2)

    ; Add the third number to AL
    add al, variable3    ; Add the value of 'variable3' (3) to AL (AL = AL + variable3)

    ; Store the result in the 'result' variable   
    mov result, al       ; Move the sum (in AL) into the 'result' variable

    add al, '0'          ; Convert the numerical result to its ASCII equivalent by adding '0' (48 in decimal)
    mov char, al         ; Move the ASCII character into 'char' for displaying

    mov ah, 02h          ; Prepare to call DOS function to display a character
    mov dl, char         ; Move the character to DL register (to be displayed)
    int 21h              ; Call DOS interrupt to display the character in DL

    ; Program termination
    mov ah, 4Ch          ; Prepare to terminate the program (function 4Ch)
    int 21h              ; Call DOS interrupt to terminate the program

main endp                 ; End of the main procedure
end main                  ; End of the assembly program
