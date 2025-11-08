(lang dune 3.20)

(name favicon-generator)

(generate_opam_files true)

(source
 (github 3ee-Games/favicon-generator))

(authors "Ryan Sadwick <rsadwick@gmail.com>")

(maintainers "Ryan Sadwick <rsadwick@gmail.com>")

(license MIT)

(documentation https://github.com/3ee-Games/favicon-generator#readme)

(package
 (name favicon-generator)
 (synopsis "Generate and manage favicons from a single source image")
 (description "generate multi-size favicon sets and manifest metadata for web projects.")
 (depends
  (ocaml (>= 5.1))
  dune
  cmdliner
  unix
  base)
 (tags
  ("favicon" "image" "generator" "web" "cli" "ocaml")))
