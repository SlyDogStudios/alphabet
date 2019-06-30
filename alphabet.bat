ca65 alphabet.asm
ld65 -C alphabet.cfg alphabet.o -o ""
copy /b alphabet.hdr+_prg\bank00.prg+_prg\bank01.prg+_prg\bank02.prg+_prg\bank03.prg "The Alphabet.nes"
pause
