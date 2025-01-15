section .text
global _logarithm2

_logarithm2:
    push ebp
    mov ebp, esp

    finit 
    fld1                   
    fld dword [ebp+8]      
    fyl2x                  

    mov esp, ebp
    pop ebp

    ret
