[bits 16]
[org 0x100]  

%include 'sprites.inc'

section .data
    ASCII_Maze: 
        db '#_____________________________#', 10
        db '#...#.....................#...#', 10
        db '#o#.#.#___#.#_____#.#___#.#.#o#', 10
        db '#.#............#............#.#', 10
        db '#.#_#.#______#.#.#______#.#_#.#', 10
        db '#..............#..............#', 10
        db '#___#.#_#.#__# # #__#.#_#.#___#', 10
        db '    #.# #.#         #.# #.#    ', 10
        db '____#.#_#.# #_---_# #.#_#.#____', 10
        db '     .   .  #     #  .   .     ', 10
        db '____#.#_#.# #_____# #.#_#.#____', 10
        db '    #.# #.#         #.# #.#    ', 10
        db '#___#.#_#.#__# # #__#.#_#.#___#', 10
        db '#......#.......#.......#......#', 10
        db '#.#__#.#.#___________#.#.#__#.#', 10
        db '#.#o.......................o#.#', 10
        db '#.#.#_#.#____#.#.#____#.#_#.#.#', 10
        db '#..............#..............#', 10
        db '#_____________________________#', 10
MazeWidth db 29 ; The width of the maze in characters

section .bss
    RowCounter resb 1
    ColumnCounter resb 1


section .text
global _start
_start:
    ; Initialize VGA mode (320x200, 256 colors).
    mov ax, 0x0013
    int 0x10

    ; Display the maze.
    call display_maze

    ; Hang the program so it doesn't exit.
hang:
    jmp hang

display_maze:
    xor ax, ax
    mov [RowCounter], al ; Initialize row counter to 0
    lea si, [ASCII_Maze] ; SI points to the start of maze data

    ; Outer loop for each row
row_loop:
    mov [ColumnCounter], al ; Initialize column counter to 0

    ; Inner loop for each character in the row
column_loop:
    lodsb                 ; Load next character from the maze into AL
    cmp al, 10            ; Check for line feed (new line)
    je next_row

    ; Save the current position for the sprite drawing routine
    push ax               ; Save AX (Current character)
    push si               ; Save SI (Next character position)

    ; Calculate the offset based on the row and column
    mov bx, [ColumnCounter]
    mov dx, [RowCounter]
    call calculate_offset

    ; Restore AX and SI
    pop si
    pop ax

    ; Draw the sprite based on the character
    cmp al, '#'
    call draw_wall
    cmp al, '_'
    call draw_floor
    cmp al, '.'
    call draw_dot
    ; Add more comparisons for other characters here

    ; Increment the column counter
    inc byte [ColumnCounter]
    jmp column_loop

next_row:
    inc byte [RowCounter]
    cmp byte [RowCounter], 16 ; Assuming 16 rows in the maze
    jl row_loop

    ; Return to text mode (optional)
    mov ax, 0x0003
    int 0x10
    ret

calculate_offset:
    ; Calculate video memory offset based on bx (column) and dx (row)
    shl dx, 3   ; Multiply row by 8 (sprite height)
    add dx, dx  ; Multiply row by 16
    add dx, dx  ; Multiply row by 32
    add dx, dx  ; Multiply row by 64
    shl bx, 3   ; Multiply column by 8 (sprite width)
    mov ax, dx
    mul MazeWidth ; AX * MazeWidth (row offset)
    add ax, bx  ; Add column offset to row offset
    add ax, 0xA000 ; Add base of VGA memory
    mov di, ax  ; DI = offset for the sprite in video memory
    ret

draw_wall:
    ; Set up video segment for drawing.
    mov ax, 0xA000
    mov es, ax
    ; Calculate the memory offset based on the current row and column.
    mov ax, [RowCounter]
    shl ax, 3             ; Each row is 8 pixels high.
    mov di, ax
    mov ax, 320           ; VGA screen width.
    mul di                ; DI = AX * DI (row offset).
    mov di, ax            ; Move row offset to DI.
    mov ax, [ColumnCounter]
    shl ax, 3             ; Each column is 8 pixels wide.
    add di, ax            ; Add column offset to row offset.
    ; DI now contains the correct offset for the sprite.
    lea si, [WallVertical_Sprite] ; Assume Wall_Sprite is defined in 'sprites.inc'
    mov cx, 8             ; Loop counter for 8 rows of the sprite.
draw_wall_line:
    push cx               ; Save CX
    mov cx, 8             ; Set CX for 8 pixels (1 row of the sprite).
    rep movsb             ; Draw one row of the sprite.
    pop cx                ; Restore CX
    add di, 320-8         ; Move to the next line on the screen.
    loop draw_wall_line   ; Loop back until all lines are drawn.
    ret                   ; Return to the calling procedure.

draw_floor:
    ; Set up video segment for drawing.
    mov ax, 0xA000
    mov es, ax
    ; Calculate the memory offset based on the current row and column.
    mov ax, [RowCounter]
    shl ax, 3             ; Each row is 8 pixels high.
    mov di, ax
    mov ax, 320           ; VGA screen width.
    mul di                ; DI = AX * DI (row offset).
    mov di, ax            ; Move row offset to DI.
    mov ax, [ColumnCounter]
    shl ax, 3             ; Each column is 8 pixels wide.
    add di, ax            ; Add column offset to row offset.
    ; DI now contains the correct offset for the sprite.
    lea si, [WallHorizontal_Sprite] ; Assume Wall_Sprite is defined in 'sprites.inc'
    mov cx, 8             ; Loop counter for 8 rows of the sprite.
draw_floor_line:
    push cx               ; Save CX
    mov cx, 8             ; Set CX for 8 pixels (1 row of the sprite).
    rep movsb             ; Draw one row of the sprite.
    pop cx                ; Restore CX
    add di, 320-8         ; Move to the next line on the screen.
    loop draw_wall_line   ; Loop back until all lines are drawn.
    ret                   ; Return to the calling procedure.

draw_dot:
    ; Set up video segment for drawing.
    mov ax, 0xA000
    mov es, ax
    ; Calculate the memory offset based on the current row and column.
    mov ax, [RowCounter]
    shl ax, 3             ; Each row is 8 pixels high.
    mov di, ax
    mov ax, 320           ; VGA screen width.
    mul di                ; DI = AX * DI (row offset).
    mov di, ax            ; Move row offset to DI.
    mov ax, [ColumnCounter]
    shl ax, 3             ; Each column is 8 pixels wide.
    add di, ax            ; Add column offset to row offset.
    ; DI now contains the correct offset for the sprite.
    lea si, [Dot_sprite] ; Assume Wall_Sprite is defined in 'sprites.inc'
    mov cx, 8             ; Loop counter for 8 rows of the sprite.

draw_dot_line:
    push cx               ; Save CX
    mov cx, 8             ; Set CX for 8 pixels (1 row of the sprite).
    rep movsb             ; Draw one row of the sprite.
    pop cx                ; Restore CX
    add di, 320-8         ; Move to the next line on the screen.
    loop draw_wall_line   ; Loop back until all lines are drawn.
    ret                   ; Return to the calling procedure.

; Sprite drawing routine assumes an 8x8 sprite.
draw_sprite:
    pusha                 ; Save all registers
    mov cx, 8             ; We will draw 8 lines
draw_line:
    push cx               ; Save the line counter
    mov cx, 8             ; Set up the pixel counter for the line
    rep movsb             ; Copy sprite line to video memory
    pop cx                ; Restore the line counter
    add di, 320 - 8       ; Move the DI to the start of the next line on the screen
    loop draw_line        ; Loop back to draw the next line
    popa                  ; Restore all registers
    ret                   ; Return to the calling procedure


end_display:
    ; Switch back to text mode.
    mov ax, 0x0003
    int 0x10
    ret