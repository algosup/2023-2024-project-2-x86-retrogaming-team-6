; Pacman Game in x86 Assembly for DOS
; This code creates a maze for the game using ASCII characters

[bits 16]           ; Use 16-bit code
[org 0x100]         ; Origin point for the program

%include "sprites.inc"  ; Include the sprites definitions

%define SCREEN_WIDTH 320
%define SCREEN_HEIGHT 200

%define SPRITEW 8
%define SPRITEH 8

%define MAZERLIMIT 151
%define MAZEBLIMIT 32

section .data

xPos dw 0
xVelocity dw 1
yPos dw 80

spritew dw 8
spriteh dw 8

old_XPOS dw 0

old_YPOS dw 0

currentSprite dw 0

actualKeystroke dw 0

; ASCII representation of the maze
ASCII_Maze: 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 3, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9  
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 4, 4, 4, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 3, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 3, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9

    Column dw 40
    Row dw 25
    PixelPerTileRow dw 2560

section .bss
keyPressed resb 1

section .text
maze:
    mov ah, 00h
    mov al, 13h
    int 10h
    call clearScreen
    call Maze
    
    gameloop:
    call draw_sprite

    mov cx, 64000
    waitloop:
        loop waitloop
    jmp gameloop
    mov ax, 03h
    int 10h
    mov ax, 4C00h
    int 21h

clearScreen:
    mov bx, 0xA000
    mov es, bx
    mov di, 0
    mov cx, 200*320
    rep stosb
    ret 

draw_sprite:
    mov si, [currentSprite]
    mov ax, [xPos]
    mov [old_XPOS], ax
    mov ax, [yPos]
    mov [old_YPOS], ax
    mov ax, 0A000h
    mov es, ax
    mov ax, [yPos]
    imul ax, 320
    add ax, [xPos] 
    mov di, ax
    mov cx, SPRITEH
.draw_line:
    push cx
    mov cx, SPRITEW
    rep movsb
    pop cx
    add di, 320 - SPRITEW
    loop .draw_line
    ret
    
drawWalls:
        mov dx, 8
        .eachLine:  
            mov cx, 8
            rep movsb
            add di, 320-8
            dec dx
            jnz .eachLine
            call nextColumn
        inc bx
        ret
    nextColumn:
        mov ax, [Column]
        dec ax
        mov [Column], ax
        cmp ax, 0
        je nextRow
        sub di, 2552
        ret
        
    nextRow:
        mov ax, [Row]
        dec ax
        mov [Row], ax
        cmp ax, 0
        je gameloop
        mov ax, 40
        mov [Column], ax
        mov ax, [PixelPerTileRow] 
        mov di, ax
        add ax, 2560
        mov [PixelPerTileRow], ax  
        ret 
    Maze:
        mov di, 0
        mov bx, ASCII_Maze
        wallchoice:
            mov al, [bx]
            cmp al,  0         
            je drawEmpty        
            cmp al, 1
            je drawWall
            cmp al, 2
            je DrawDot
            cmp al, 3
            je DrawPowerPellet
            cmp al, 4
            je DrawGates
        
          ; ===================================
          
          
          drawEmpty:
               mov si, Empty_sprite
               call drawWalls
               jmp wallchoice
          drawWall:
               mov si, Walls
               call drawWalls
               jmp wallchoice   
          DrawDot:
               mov si, Dots
               call drawWalls
               jmp wallchoice
          DrawGates:
             mov si, Gates
             call drawWalls
             jmp wallchoice
          DrawPowerPellet:
                mov si, PowerPellet
                call drawWalls
                jmp wallchoice
            
          