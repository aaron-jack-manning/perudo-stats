open General

(** Prints the provided string to the console. *)
external print : string -> unit = "print"

(** Reads a line from the console until a new line or EOF, using the specified buffer size. *)
external read_line : int -> string = "read_line"

(** Displays all provided strings to the console in order. *)
val print_all : string list -> unit