open General

open List


let enqueue (a : 'a) (qu : 'a queue) : 'a queue =
    { qu with front = a :: qu.back }

let dequeue (qu : 'a queue) : ('a option * 'a queue) =
    match qu.front with
    | [a] -> (Some a, { front = List.reverse qu.back; back = [] })
    | h :: t -> (Some h, { qu with front = t })
    | [] -> (None, qu)

let empty = { front = []; back = [] }
