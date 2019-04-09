type operator = (* à compléter *)

type state = (* à compléter *)

let create () = failwith "Not implemented" (* *)

let add_digit state digit = failwith "Not implemented"  (* *)

let apply_equal state = failwith "Not implemented"  (* *)

let apply_op state operator = failwith "Not implemented"  (* *)

let print_screen state =
  print_float state.x;
  print_newline ();
  flush stdout

let () =
  let s = create () in
  let s = add_digit s 2 in
  print_screen s;
  let s = add_digit s 0 in
  print_screen s;
  let s = apply_op s Plus in
  print_screen s;
  let s = add_digit s 4 in
  print_screen s;
  let s = apply_op s Minus in
  print_screen s;
  let s = add_digit s 3 in
  print_screen s;
  let s = apply_op s Mult in
  print_screen s;
  let s = add_digit s 2 in
  print_screen s;
  let s = apply_equal s in
  print_screen s


