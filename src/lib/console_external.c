#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>

CAMLprim value print(value data)
{
    CAMLparam1(data);
    const char *data_string = String_val(data);

    printf("%s", data_string);

    return Val_unit;
}

CAMLprim value read_line(value input_length)
{
    CAMLparam1(input_length);
    const int input_length_int = Int_val(input_length);

    char *input_line = malloc(sizeof (char) * input_length_int + 1);
    char *result = fgets(input_line, input_length_int + 1, stdin);

    if (result == NULL)
    {
        printf("Failed to read input line from stdin.\n");
        exit(-1);
    }
    
    CAMLlocal1(return_string);

    return_string = caml_copy_string(input_line);

    free(input_line);
    CAMLreturn(return_string);
}