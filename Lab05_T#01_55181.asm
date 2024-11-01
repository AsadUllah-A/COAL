;Solve '3+5-2-1+3='
.model small
.stack 100h
.data
.code

main proc
    ; Display '3+5-2-1+3='
    mov dl, '3'
    mov ah, 2  ; DOS interrupt for output
    int 21h    ; Call interrupt
    
    mov dl, '+'
    mov ah, 2
    int 21h
    
    mov dl, '5'
    mov ah, 2
    int 21h
    
    mov dl, '+'
    mov ah, 2
    int 21h
    
    mov dl, '2'
    mov ah, 2
    int 21h
    
    mov dl, '-'
    mov ah, 2
    int 21h
    
    mov dl, '1'
    mov ah, 2
    int 21h
    
    mov dl, '+'
    mov ah, 2
    int 21h
    
    mov dl, '3'
    mov ah, 2
    int 21h
    
    mov dl, '='
    mov ah, 2
    int 21h

    ; Perform the arithmetic: 3 + 5 - 2 - 1 + 3
    mov al, 3   ; al = 3
    add al, 5   ; al = al + 5 = 8
    sub al, 2   ; al = al - 2 = 6
    sub al, 1   ; al = al - 1 = 5
    add al, 3   ; al = al + 3 = 8

    ; Convert result to ASCII and display it
    add al, 48  ; Convert to ASCII ('8')
    mov dl, al
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h    ; Terminate program
main endp

end main

