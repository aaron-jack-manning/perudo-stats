(** Purely functional queue, implemented as a pair of lists. *)
type 'a queue = { front : 'a list; back : 'a list }

(** Result type for error handling. *)
type 'a result =
    | Error of string
    | Success of 'a

(** Purely functional stack. *)
type 'a stack =
    | Empty
    | Stacked of 'a * 'a stack

(**A purely functional tree with arbitrarily many branches at each node. *)
type 'a tree =
    | Leaf
    | Branch of 'a * 'a tree list

(** Identity function. *)
val id : 'a -> 'a

(** Suppresses compiler warnings for unassigned return value from function. *)
val ignore : 'a -> unit

(** Function composition. (f >> g) x represents g (f x). *)
val ( >> ) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

(** Function composition. (f << g) x represents f (g x). *)
val ( << ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

(** Pipeline operator, to reverse function application order. *)
val ( |> ) : 'a -> ('a -> 'b) -> 'b

(** Checks for structural equality. *)
external ( = ) : 'a -> 'a -> bool = "%equal"

(** Checks for structural inequality. *)
external ( <> ) : 'a -> 'a -> bool = "%notequal"

(** Polymorphic less than. *)
external ( < ) : 'a -> 'a -> bool = "%lessthan"

(** Polymorphic greater than. *)
external ( > ) : 'a -> 'a -> bool = "%greaterthan"

(** Polymorphic less than or equal to. *)
external ( <= ) : 'a -> 'a -> bool = "%lessequal"

(** Polymorphic greater than or equal to. *)
external ( >= ) : 'a -> 'a -> bool = "%greaterequal"

(** Logical negation. *)
val not : bool -> bool

(** Logical or (infix). *)
external ( or ) : bool -> bool -> bool = "%sequor"

(** Logical and. *)
external ( & ) : bool -> bool -> bool = "%sequand"

(** Reference cells for mutable variables. *)
type 'a ref = { mutable contents : 'a; }

(** Creates a reference cell. *)
val ref : 'a -> 'a ref

(** Updates a reference cell. *)
val ( := ) : 'a ref -> 'a -> unit

(** Returns the contents of a reference cell. *)
val ( ! ) : 'a ref -> 'a