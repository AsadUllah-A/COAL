.model small
.stack 100h
.data
.code
    main proc
        
        mov ax, 0xAF16    ; Load AX with 0xAF16
        mov bx, 0xAF50    ; Load BX with 0xAF50
        
        push ax           ; Push AX to stack
        push bx           ; Push BX to stack
        
        pop ax            ; Pop value into AX
        pop bx            ; Pop value into BX
        
        mov ah, 4Ch       ; Terminate program
        int 21h           ; DOS interrupt to exit
    main endp
end main
