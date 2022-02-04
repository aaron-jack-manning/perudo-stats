open General


let return (x : 'a) : 'a option = Some x

let ( ~= ) = return

let bind (x : 'a option) (f : 'a -> 'b option) : 'b option =
    match x with
    | None -> None
    | Some a -> f a

let ( >>= ) = bind

let binary_operator (x : 'a option) (y : 'b option) (f : 'a -> 'b -> 'c) : 'c option =
    x >>= (fun a -> y >>= (fun b -> ~= (f a b)))

let map (x : 'a option) (f : 'a -> 'b) : 'b option =
    x >>= (fun a -> ~= (f a))

let compose (f : 'a -> 'b option) (g : 'b -> 'c option) : 'a -> 'c option =
    (fun x -> f x >>= g)
    
let ( >=> ) = compose