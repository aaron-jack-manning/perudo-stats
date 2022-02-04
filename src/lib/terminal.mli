open General


(** Formatted print to terminal. *)
val printf : ('a, Stdlib.out_channel, unit) Stdlib.format -> 'a

(** Prints the provided string to the terminal. *)
val print : string -> unit

(** Reads an input line from the terminal. *)
val read_line : unit -> string