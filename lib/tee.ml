(* Tee: Test Equality Easily *)
include Teetypes

(** Module for testing if two arbitrary types are equal to one another. 
    @param expected     Expected value in our test. This is the value we expect. 
    @param testing      Testing value in our test. This is the value we are testing.
    @param test_str     String describing what we are testing.
 *)
let tee (type a) (module TeeAbstractType : TeeType with type t = a) ((expected: a), (testing: a), (test_str: string)) = 
    if expected = testing 
    then print_string("passed: " ^ test_str ^ "\n")
    else failwith(test_str ^ " -> expected: " ^ TeeAbstractType.to_string(expected) ^ " but got: " ^ TeeAbstractType.to_string(testing))
