open General


(** Adds an element to the back of the queue, returning the new queue. Runs in O(1). *)
val enqueue : 'a -> 'a queue -> 'a queue

(** Removes an element from the front of the queue, returning a tuple of the new queue and an option which is None if the queue is empty, or Some [x] where [x] wa the element on the front of the queue. Runs in best case O(1), worse case O(n) and amortized O(1). *)
val dequeue : 'a queue -> 'a option * 'a queue

(** The empty queue. *)
val empty : 'a queue