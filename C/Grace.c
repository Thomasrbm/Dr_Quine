#include <stdio.h>
/*
This program will print its own source when run.
*/
#define NL 10
#define FILE_NAME "Grace_kid.c"
#define FT(x) int main(){ \
	char *s = x; \
	FILE *f = fopen(FILE_NAME, "w"); \
	fprintf(f, s, NL, 34, 92, s, 9); \
	fclose(f); \
}
FT("#include <stdio.h>%1$c/*%1$cThis program will print its own source when run.%1$c*/%1$c#define NL 10%1$c#define FILE_NAME %2$cGrace_kid.c%2$c%1$c#define FT(x) int main(){ %3$c%1$c%5$cchar *s = x; %3$c%1$c%5$cFILE *f = fopen(FILE_NAME, %2$cw%2$c); %3$c%1$c%5$cfprintf(f, s, NL, 34, 92, s, 9); %3$c%1$c%5$cfclose(f); %3$c%1$c}%1$cFT(%2$c%4$s%2$c)")