open General


(** Removes the top element from the stack, returning a tuple of the new stack, and None if the stack was empty, or Some [x] if [x] was on top of the stack. Popping an empty stack will result in the returned stack also being empty. Runs in O(1). *)
val pop : 'a stack -> 'a option * 'a stack

(** Pushes the specified element to the top of the stack, returning the new stack. Runs in O(1). *)
val push : 'a -> 'a stack -> 'a stack

(** Examines the top element of the stack, returning None for an empty stack, or Some [x] if [x] is the top element of the stack. Runs in O(1). *)
val peek : 'a stack -> 'a option

(** The empty stack. *)
val empty : 'a stack

(** Finds the height of the stack. Runs in O(n). *)
val height : 'a stack -> int

(** Determines if the stack is empty. Runs in O(1). *)
val is_empty : 'a stack -> bool