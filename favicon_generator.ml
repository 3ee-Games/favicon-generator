open Unix

let sizes = [16; 32; 48; 152; 180; 192; 512]

let check_imagemagick () =
  try
    ignore (system "convert -version");
    true
  with _ -> false

let generate_png input output_dir size =
  let output = Filename.concat output_dir (Printf.sprintf "favicon-%dx%d.png" size size) in
  let cmd = Printf.sprintf "convert %s -resize %dx%d %s" (Filename.quote input) size size (Filename.quote output) in
  if system cmd = WEXITED 0 then
    Printf.printf "Generated: %s\n" output
  else
    failwith ("Failed to generate " ^ output)

let generate_ico input output_dir =
  let output = Filename.concat output_dir "favicon.ico" in
  let cmd = Printf.sprintf "convert %s -resize 16x16 -resize 32x32 -resize 48x48 %s" (Filename.quote input) (Filename.quote output) in
  if system cmd = WEXITED 0 then
    Printf.printf "Generated: %s (with sizes 16,32,48)\n" output
  else
    failwith ("Failed to generate " ^ output)

let generate_manifest output_dir =
  let manifest_file = Filename.concat output_dir "manifest.webmanifest" in
  let ch = open_out manifest_file in
  output_string ch {|{
  "icons": [
    { "src": "favicon-192x192.png", "type": "image/png", "sizes": "192x192" },
    { "src": "favicon-512x512.png", "type": "image/png", "sizes": "512x512" },
    { "src": "favicon-512x512.png", "type": "image/png", "sizes": "512x512", "purpose": "maskable" }
  ]
}
|};
  close_out ch;
  Printf.printf "Generated: %s\n" manifest_file

let main () =
  if Array.length Sys.argv <> 3 then (
    Printf.printf "Usage: %s input_image output_dir\n" Sys.argv.(0);
    exit 1
  );
  let input_file = Sys.argv.(1) in
  let output_dir = Sys.argv.(2) in
  (try mkdir output_dir 0o755 with _ -> ());
  
  if not (check_imagemagick ()) then
    failwith "ImageMagick 'convert' not found. Please install ImageMagick.";
  
  List.iter (generate_png input_file output_dir) sizes;
  generate_ico input_file output_dir;
  generate_manifest output_dir

let () = main ()