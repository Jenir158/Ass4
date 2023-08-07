.syntax unified
.equ GRADE_A_THRESHOLD, 90
.equ GRADE_B_THRESHOLD, 75
.equ GRADE_C_THRESHOLD, 50

message_a: .asciz "Congratulations! You got an A."
message_b: .asciz "Good job! You got a B."
message_c: .asciz "Not bad, you got a C."
message_f: .asciz "Sorry, you got an F."

.text

ldr R5, =75

cmp R5, #GRADE_A_THRESHOLD
bge A_GRADE_CHECK

cmp R5, #GRADE_B_THRESHOLD
bge B_GRADE_CHECK
b NOT_A_OR_B_GRADE

A_GRADE_CHECK:
ldr R0, =message_a
b PRINT_MESSAGE

B_GRADE_CHECK:
ldr R0, =message_b
b PRINT_MESSAGE

NOT_A_OR_B_GRADE:
cmp R5, #GRADE_C_THRESHOLD
bge C_GRADE_CHECK
b NOT_C_GRADE

C_GRADE_CHECK:
ldr R0, =message_c
b PRINT_MESSAGE

NOT_C_GRADE:
ldr R0, =message_f
b PRINT_MESSAGE

PRINT_MESSAGE:
mov R1, #4      @ R1 = 4 for message length
mov R2, R0      @ R2 = address of the message
mov R7, #4      @ SWI number for "write" operation
swi 0           @ Execute software interrupt
b DONE

DONE:
