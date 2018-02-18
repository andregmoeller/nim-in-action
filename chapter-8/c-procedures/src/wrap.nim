proc printf(format: cstring): cint {.importc, varargs, header: "stdio.h".}
discard printf("My name is %s and I am %d years old!\n", "Ben", 30)

proc displayFormatted(format: cstring): cint {.importc: "printf", varargs, 
    header: "stdio.h", discardable.}
displayFormatted("My name is %s and I am %d years old!\n", "Ben", 30)
