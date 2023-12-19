section .data 
org 100h 


xletterIpos db 15
xletterBpos db 0


section .text 
mov ah, 00h
mov al, 13h
int 10h

gameloop:
; display the letter B 
call print_score

jmp gameloop


print_score: 
    call print_stringS
    call print_stringC
    call print_stringO
    call print_stringR
    call print_stringE
    call print_colon

print_stringS: 
    mov si, letterS
    mov ax, 0a000h          ; memory location of the video mode
    mov es, ax
    mov di, 8               ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop


print_stringC:
    mov si, letterC
    mov ax, 0a000h              ; memory location of the video mode
    mov es, ax
    mov di, 18               ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop


print_stringO:
    mov si, letterO
    mov ax, 0a000h              ; memory location of the video mode
    mov es, ax
    mov di, 28               ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop

print_stringR:
    mov si, letterR
    mov ax, 0a000h              ; memory location of the video mode
    mov es, ax
    mov di, 38              ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop


print_stringE:
    mov si, letterE
    mov ax, 0a000h              ; memory location of the video mode
    mov es, ax
    mov di, 48             ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop

print_colon:
    mov si, colon
    mov ax, 0a000h              ; memory location of the video mode
    mov es, ax
    mov di, 58             ; set the destination index to 8 (starting position in video memory)
    mov dx, 8               ; set the loop counter to 8 (number of lines to print)
.eachLine:                  ; loop till each line of the sprite is printed
    mov cx, 8               ; set the count register to 8 (number of pixel to copy per line)
    rep movsb               ; repeat the move byte action (copying pixel)
    add di, 320-8           ; move the destination index to the next line (320 pixel per line)
    dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
    jnz .eachLine
ret                     ; return to the main loop   




%include "letters.asm"
%include "numbers.asm"

