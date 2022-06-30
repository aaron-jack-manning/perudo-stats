open General


(** Calculates the length of the provided string. *)
external length : string -> int = "%string_length"

(** Gets the character at the specified index. *)
external get : string -> int -> char = "%string_safe_get"

(** Converts an int to a string. *)
val of_int : int -> string

(** Converts a float to a string. *)
val of_float : float -> string

(** Converts a boolean to a string. *)
val of_bool : bool -> string

(** Concatenates two strings together in the provided order. *)
val ( + ) : string -> string -> string

(** Concatenates a list of strings into a single string in sequence. *)
val concat : string list -> string