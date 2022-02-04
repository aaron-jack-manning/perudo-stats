open General


let combine (tr1 : 'a tree) (tr2 : 'a tree) (topBranch : 'a) : 'a tree =
    Branch (topBranch, tr1 :: tr2 :: [])

let rec map (f : 'a -> 'b) (tr : 'a tree) : 'b tree =
    match tr with
    | Branch (value, branches) -> Branch (f value, branches |> List.map (map f))
    | Leaf -> Leaf