open Tee

(* Comparing TeeString *)
let _ = tee (module TeeString) ("", "", "empty strings")
let _ = tee (module TeeString) ("abcdef", "abcdef", "lowercase strings")
let _ = tee (module TeeString) ("XYZ", "XYZ", "uppercase strings")
let _ = tee (module TeeString) ("ABBfeFKowmfnfwWFWnbnfauiowprWrmasfns", "ABBfeFKowmfnfwWFWnbnfauiowprWrmasfns", "mixed strings")
