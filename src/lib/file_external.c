#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>

CAMLprim value write_all_lines(value file_path, value contents)
{
    CAMLparam2(contents, file_path);

    const char *contents_string = String_val(contents);
    const char *file_path_string = String_val(file_path);

    FILE *fp = fopen(file_path_string, "w");

    if (fp == NULL)
    {
        printf("File %s was not opened correctly.\n", file_path_string);
        exit(-1);
    }

    fprintf(fp, "%s", contents_string);
    fclose(fp);

    return Val_unit;
}

long file_length_from_pointer(FILE *fp)
{
    fseek(fp, 0, SEEK_END);
    long size = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    return size;
}

long file_length(value file_path)
{
    CAMLparam1(file_path);
    const char *file_path_string = String_val(file_path);

    FILE *fp = fopen(file_path_string, "r");

    if (fp == NULL)
    {
        printf("File %s was not opened correctly.\n", file_path_string);
        exit(-1);
    }

    long length = file_length_from_pointer(fp);
    fclose(fp);

    return Val_long(length);
}


CAMLprim value read_all_lines(value file_path)
{
    // Copy input from value to c string.
    CAMLparam1(file_path);
    const char *file_path_string = String_val(file_path);

    // Open the file.
    FILE *fp = fopen(file_path_string, "r");

    if (fp == NULL)
    {
        printf("File %s was not opened correctly.\n", file_path_string);
        exit(-1);
    }
    
    // Calculate the file length.
    long length = file_length_from_pointer(fp);
    
    // Allocate the buffer
    char *buffer = malloc(sizeof (char) * length + 1);
    buffer[length] = '\0';

    // Read the file.    
    size_t read_size = fread(buffer, sizeof (char), length, fp);
    fclose(fp);

    // Create the OCaml return value and copy over.
    CAMLlocal1(file_contents);
    file_contents = caml_copy_string(buffer);

    // Free the buffer.
    free(buffer);
    
    return file_contents;
}