open General


let open_out = Stdlib.open_out

let close_out = Stdlib.close_out

let printf = Stdlib.Printf.fprintf

let write_all_text filepath text =
    let channel = open_out filepath in
    let _ = printf channel "%s" text in
    let _ = close_out channel in
    ()


let open_in = Stdlib.open_in

let close_in = Stdlib.close_in

let read_n_chars = Stdlib.really_input_string

let in_channel_length = Stdlib.in_channel_length

let read_all_text filepath =
    let channel = open_in filepath in
    let contents = read_n_chars channel (in_channel_length channel) in
    let _ = close_in channel in
    contents