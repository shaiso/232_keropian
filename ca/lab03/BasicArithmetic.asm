.text
main:
    # Ввод x
    li a7, 5
    ecall
    add t0, a0, zero # t0 = x

    # Ввод y
    li a7, 5
    ecall
    add t1, a0, zero # t1 = y

    # 1. (x + 5) - (y - 7)
    addi t2, t0, 5       # t2 = x + 5
    addi t3, t1, -7      # t3 = y - 7
    sub a0, t2, t3       # a0 = (x + 5) - (y - 7)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 2. 2 * x * x - 3 * y + 4
    mul t2, t0, t0       # t2 = x * x
    slli t2, t2, 1       # t2 = 2 * x * x
    li t4, 3             # Загрузить 3 в t4
    mul t3, t1, t4       # t3 = 3 * y
    sub t2, t2, t3       # t2 = 2 * x * x - 3 * y
    addi a0, t2, 4       # a0 = 2 * x * x - 3 * y + 4
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 3. (x + 5) / y + 10 / (y - 1)
    addi t2, t0, 5       # t2 = x + 5
    div t3, t2, t1       # t3 = (x + 5) / y
    addi t2, t1, -1      # t2 = y - 1
    li t5, 10            # Загрузить 10 в t5
    div t4, t5, t2       # t4 = 10 / (y - 1)
    add a0, t3, t4       # a0 = (x + 5) / y + 10 / (y - 1)
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 4. (x / y) * y + x % y
    div t2, t0, t1       # t2 = x / y
    mul t3, t2, t1       # t3 = (x / y) * y
    rem t4, t0, t1       # t4 = x % y
    add a0, t3, t4       # a0 = (x / y) * y + x % y
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # 5. x > y ? 1 : 0
    slt t2, t1, t0       # t2 = (y < x) ? 1 : 0
    add a0, t2, zero     # a0 = t2
    li a7, 1
    ecall

    li a7, 11
    li a0, '\n'
    ecall

    # Завершение программы
    li a7, 10
