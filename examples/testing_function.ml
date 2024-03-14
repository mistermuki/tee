open Tee

let only_lowercase =
    List.filter (fun x -> String.get x 0 = Char.lowercase_ascii(String.get x 0))

let _ = tee (module TeeList(TeeString)) (["abc"; "def"],  only_lowercase(["abc"; "def"; "DEF"]), "only_lowercase with 4 elements") 
let _ = tee (module TeeList(TeeString)) ([],  only_lowercase(["Dbc"; "AEef"; "DEF"; "Dbbbb";]), "only_lowercase with all capital")
let _ = tee (module TeeList(TeeString)) (["abc"; "def"; "ghi"; "jkl"],  only_lowercase(["abc"; "def"; "ghi"; "jkl"]), "only_lowercase with all lowercase") 
