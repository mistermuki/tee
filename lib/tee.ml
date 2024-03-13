(* Tee: Test Equality Easily *)
include Teetypes

let tee_test_base((expected: 'a), (testing: 'a), (test_str: string), (to_string: 'a -> string)): unit =
    if expected = testing 
    then print_string("passed: " ^ test_str ^ "\n")
    else failwith(test_str ^ " -> expected: " ^ to_string(expected) ^ " but got: " ^ to_string(testing))

(* Allows for easy testing with predefined functions and models *)
let tee (type a) (module TeeAbstractType : TeeType with type t = a) ((expected: a), (testing: a), (test_str: string)) = 
    tee_test_base(expected, testing, test_str, TeeAbstractType.to_string)
