open General


let pop (st : 'a stack) : 'a option * 'a stack =
    match st with
    | Empty -> (None, Empty)
    | Stacked (x, xs) -> (Some x, xs)

let push (a : 'a) (st : 'a stack) : 'a stack =
    Stacked (a, st)

let peek (st : 'a stack) : 'a option =
    match st with
    | Empty -> None
    | Stacked (x, xs) -> Some x

let empty : 'a stack = Empty

let rec height_helper (height : int) (st : 'a stack) =
    match st with
    | Empty -> height
    | Stacked (x, xs) -> height_helper (Int.(height + 1)) xs

let height (st : 'a stack) : int =
    height_helper 0 st

let is_empty (st : 'a stack) =
    match st with
    | Empty -> true
    | Stacked _ -> false
