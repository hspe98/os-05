.section .text
.global factorial
factorial:
    push %ebp
    mov %esp, %ebp
 
    // Den Parameter nach eax laden
    mov 8(%ebp), %eax
 
    // Die Fakultät von 0 ist 1 (Rückgabewert kommt nach eax)
    or %eax, %eax
    jnz recurse
    mov $1, %eax
    jmp out
 
recurse:
    // Ansonsten rekursiv factorial für eax - 1 aufrufen und hinterher
    // mit unserem eax multiplizieren
    dec %eax
    push %eax
    call factorial
    add $4, %esp
 
    // eax enthält jetzt den Rückgabewert, also unseren Parameter nochmal
    // neu von unserem Stack laden
    mov 8(%ebp), %edx
 
    // Multiplizieren und das Ergebnis in eax (als Rückgabewert) speichern
    imul %edx, %eax
 
out:
    mov %ebp, %esp
    pop %ebp
    ret