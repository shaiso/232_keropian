.text
main:
    # Ввод x
    li a7, 5
    ecall
    add t0, a0, zero  # t0 = x

    # Ввод y
    li a7, 5
    ecall
    add t1, a0, zero  # t1 = y

    # 1. x & (-1 << 2)
    li t2, -1         # t2 = -1 (все биты 1)
    slli t2, t2, 2    # t2 = -1 << 2 
    and a0, t0, t2    # a0 = x & (-1 << 2)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 2. x | (-1 >> 30)
    li t2, -1         # t2 = -1
    srli t2, t2, 30   # t2 = -1 >> 30
    or a0, t0, t2     # a0 = x | (-1 >> 30)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 3. Установить y-й бит x в 1 (x | (1 << y))
    li t2, 1          # t2 = 1
    sll t2, t2, t1    # t2 = 1 << y
    or a0, t0, t2     # a0 = x | (1 << y)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 4. Сбросить y-й бит x в 0 (x & ~(1 << y))
    li t2, 1          # t2 = 1
    sll t2, t2, t1    # t2 = 1 << y
    not t2, t2        # t2 = ~(1 << y)
    and a0, t0, t2    # a0 = x & ~(1 << y)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 5. (x == (y + 3)) ? 0 : 1  → реализовано как (x < (y+3) | (y+3) < x)
    addi t2, t1, 3    # t2 = y + 3
    slt t3, t0, t2    # t3 = (x < (y + 3))
    slt t4, t2, t0    # t4 = ((y + 3) < x)
    or a0, t3, t4     # a0 = (x < (y + 3)) | ((y + 3) < x)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 6. x > -5 & y < 5
    li t2, -5         # t2 = -5
    slt t3, t2, t0    # t3 = (x > -5)
    li t2, 5          # t2 = 5
    slt t4, t1, t2    # t4 = (y < 5)
    and a0, t3, t4    # a0 = (x > -5) & (y < 5)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    li a7, 10
    ecall
