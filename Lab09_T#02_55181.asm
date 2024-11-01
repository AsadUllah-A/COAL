.model small
.stack 100h
.data
msg DB "The sum of three digits is: $"  
newline DB 13, 10, '$'          
result DB ?                     

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg                
    mov ah, 9                  
    int 21h                    

    lea dx, newline            
    mov ah, 9                  
    int 21h                    

    mov al, 3                  
    add al, 3
    add al, 2

    add al, '0'                
    mov dl, al                 
    mov ah, 2                  
    int 21h                    

    mov ah, 4Ch                
    int 21h                    

main endp
end main
