open General


let of_string = function
    | "true" -> Some true
    | "false" -> Some false
    | _ -> None
