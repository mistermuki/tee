(lang dune 3.14)

(name tee)

(generate_opam_files true)

(source
 (github mistermuki/tee))

(authors "Muki Kiboigo")

(maintainers "Muki Kiboigo")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name tee)
 (synopsis "Tee is a simple library for testing equality easily!")
 (description "Tee is a simple library for testing equality easily! Operates on various provided types as well as any created types.")
 (depends ocaml dune)
 (tags
  ("testing" "test")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
