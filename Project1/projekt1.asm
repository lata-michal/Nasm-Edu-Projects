section .text

org 100h

main_loop:

call print_prompt1

call is_space
je termination

call print_newline

xor ax, ax
mov ah, 0Ah
mov dx, input
int 21h

mov cl, [input + 1]
cmp cl, 0
je main_loop 

lea si, [input + 2]
mov cl, [input + 1]
add si, cx
mov byte[si], '$'

call print_newline
call print_prompt2
call print_newline

lea si, [input + 2]
mov cl, [input + 1]
add si, cx 
dec si 

push si
push cx

call process_string 

mov sp, ax 
pop cx 

printing_procedure:

cmp cx, 0
je end_of_printing_procedure
pop si k
mov dl, byte[si]
mov ah, 02h
int 21h
dec cx
jmp printing_procedure

end_of_printing_procedure:

call print_newline
jmp main_loop

termination:
mov ah, 4Ch
int 21h

process_string:

push bp 
mov bp, sp 

mov si, [bp + 6] 
mov cx, [bp + 4] 

mov di, bp 
add di, 2 
pop bp 

mov ax, 0 

string_cleaner_loop:

cmp cx, 0 
je end_of_process_string

cmp byte[si], 'Z'
ja char_pushed 
cmp byte[si], 'A'
jb char_pushed 

jmp char_skipped 

char_pushed:

push si 
inc ax 

char_skipped: 

dec si 
dec cx 
jmp string_cleaner_loop

end_of_process_string:

push ax 
mov ax, sp 
mov sp, di 
ret

is_space:
mov ah, 01h
int 21h
cmp al, 20h 
ret

print_newline:
mov ah, 02h
mov dl, 0Dh 
int 21h 
mov dl, 0Ah 
int 21h
ret

print_prompt1:
mov ah, 09h
mov dx, prompt1
int 21h
ret

print_prompt2:
mov ah, 09h
mov dx, prompt2
int 21h
ret

section .data

input db 255, 0, 256 dup(0)

prompt1 db 'W celu zakonczenia programu, kliknij SPACJE teraz. Jesli chcesz KONTYNUOWAC wcisnij dowolny klawisz, a nastepnie w widocznej NOWEJ LINII podaj tekst do oczyszczenia z wielkich liter. $'

prompt2 db 'Oczyszczony tekst ponizej:$'
