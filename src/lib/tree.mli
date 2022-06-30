open General


(* Combines two trees of the same type, with the specified value at the new top node. Runs in O(1). *)
val combine : 'a tree -> 'a tree -> 'a -> 'a tree

(** Applies the provided function to each element of the tree. Does not use constant stack space. Runs in O(n). *)
val map : ('a -> 'b) -> 'a tree -> 'b tree