open General


(** Throws an exception with a message. *)
val failwith : string -> 'a

(** Throws an exception if the provided bool is not true. *)
val guarantee : bool -> unit

(** Throws an exception if the provided arguments are not equal. *)
val guarantee_equal : 'a -> 'a -> unit