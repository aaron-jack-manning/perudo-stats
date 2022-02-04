open General


(** Opens and returns an output channel at the specified path. *)
val open_out : string -> Stdlib.out_channel

(** Closes the provided output channel. *)
val close_out : Stdlib.out_channel -> unit

(** Formatted printing to a provided output channel. *)
val printf : Stdlib.out_channel -> ('a, Stdlib.out_channel, unit) Stdlib.format -> 'a

(** Writes the given string to a file at the specified filepath. *)
val write_all_text : string -> string -> unit

(** Opens and returns an input channel at the specified path. *)
val open_in : string -> Stdlib.in_channel

(** Closes the provided input channel. *)
val close_in : Stdlib.in_channel -> unit

(** Reads the specified number of characters from the provided input channel as a string. *)
val read_n_chars : Stdlib.in_channel -> int -> string

(** Reads from the specified file as a string. *)
val read_all_text : string -> string