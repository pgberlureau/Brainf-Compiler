open Preprocessing
open Format
open Lexing
open Code_prod
open Pp

let usage = "usage: bf.exe [options] file.bf"

let parse_only = ref false
let type_only = ref false

let set_file f s = f := s
let ofile = ref "" (* output file name *)

let spec =
	[
		"--parse-only", Arg.Set parse_only, "  stop after parsing";
		"--type-only", Arg.Set type_only, "  stop after typing";
    "-o", Arg.String (set_file ofile), "  set output file name";
	]

let file =
	let file = ref None in
	let set_file s =
		if not (Filename.check_suffix s ".bf") then
			raise (Arg.Bad "no .bf extension");
		file := Some s
	in
	Arg.parse spec set_file usage;
	match !file with Some f -> f | None -> Arg.usage spec usage; exit 1

let report (b,e) =
	let l = b.pos_lnum in
	let fc = b.pos_cnum - b.pos_bol + 1 in
	let lc = e.pos_cnum - b.pos_bol + 1 in
	eprintf "File \"%s\", line %d, characters %d-%d:\n" file l fc lc


let () =
        let c = open_in file in
        let lb = Lexing.from_channel c in
        try
                let p = Parser.expression Lexer.token lb in
                close_in c;
                if !parse_only then exit 0
                else
                let name = Filename.chop_suffix file ".bf" ^ ".s" in
                Code_prod.Compile_program.compile_program p name
        with 
        | Parser.Error ->
			report (lexeme_start_p lb, lexeme_end_p lb);
			eprintf "syntax error@.";
			exit 1
        | _ -> exit 1
