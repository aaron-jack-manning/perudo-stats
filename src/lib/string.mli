open General


(** Calculates the length of the provided string. *)
external length : string -> int = "%string_length"

(** Converts an int to a string. *)
val of_int : int -> string

(** Converts a float to a string. *)
val of_float : float -> string

(** Converts a boolean to a string. *)
val of_bool : bool -> string

(** Concatenates two strings together in the provided order. *)
val ( + ) : string -> string -> string