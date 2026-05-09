$pdf_mode = 1;        # use pdflatex
$out_dir = "build";   # aux files go to build/
$max_repeat = 5;
set_tex_cmds("--synctex=1 %O %S");  # enables click-to-source in VS Code
