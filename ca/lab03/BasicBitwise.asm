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

    # 1. (x >> 2) + ((y - 1) << 3)
    srli t2, t0, 2       # t2 = x >> 2
    addi t3, t1, -1      # t3 = y - 1
    slli t3, t3, 3       # t3 = (y - 1) << 3
    add a0, t2, t3       # a0 = (x >> 2) + ((y - 1) << 3)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 2. (x << y) - 10
    sll t2, t0, t1       # t2 = x << y
    addi a0, t2, -10     # a0 = (x << y) - 10
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 3. (x >> y) + 10
    sra t2, t0, t1       # t2 = x >> y
    addi a0, t2, 10      # a0 = (x >> y) + 10
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 4. ((x << 2) - y + 5) >> 1
    slli t2, t0, 2       # t2 = x << 2
    sub t2, t2, t1       # t2 = (x << 2) - y
    addi t2, t2, 5       # t2 = (x << 2) - y + 5
    srai a0, t2, 1       # a0 = ((x << 2) - y + 5) >> 1
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 5. x * 6 - y * 3 
    slli t2, t0, 2       # t2 = x * 4 (x << 2)
    slli t3, t0, 1       # t3 = x * 2 (x << 1)
    add t2, t2, t3       # t2 = x * 6 (x * 4 + x * 2)

    slli t3, t1, 1       # t3 = y * 2 (y << 1)
    add t3, t3, t1       # t3 = y * 3 (y * 2 + y)

    sub a0, t2, t3       # a0 = x * 6 - y * 3
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    li a7, 10
    ecall
