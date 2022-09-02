# README - English

This repository is for managing the FH Latex template for student theses.

The output (generated PDF) is in the out directory.
The authors only need to edit files in the user_data directory and add images, pictures and figures to the gfx directory.

Important files and directories:
- Directory gfx - pictures
- Directory out - directory for building the PDF (also contains the temporary build files)
- Directory static - contains files that don't need to be changed
- Directory user_data - user's content
- Makefile - generates the PDF from the tex files (make and make clean)
- 00_main.tex - main file including all the other files
- user_data/0_0_settings.tex - settings for the configuration of the document

Settings:
- see user_data/0_0_settings.tex

There are currently two methods of generating the PDF file:
- Shellscript: ./make_paper.sh
- Makefile: make


## Makefile usage under Windows
In order to be able to use the Makefile if you are running Windows you need to install two things.

The first is perl which is easily installed with the following link:
- https://learn.perl.org/installing/windows.html

The second step is to get the "make" command for your windows Powershell. This is most easily done through chocolatey.
With the following link you can easy install chocolatey.
- https://chocolatey.org/install

After installing chocolatey simple run the command:
'choco install make'
in your Powershell.

You can now use the command:
'make -f .\Makefile'
in your Powershell.

