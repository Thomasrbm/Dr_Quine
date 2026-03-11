When executed, the program writes in a file named Grace_kid.c
the source code of the file used to compile the program.



 No main declared (no functions declared at all).
◦ Exactly three #define.
◦ One comment.
• The program will run by calling a macro



A program without a declared main must look like:
$> nl macro.c
1 #include
2 #define FT(x)int main(){ /* code */ }
[..]
5 FT(xxxxxxxx)