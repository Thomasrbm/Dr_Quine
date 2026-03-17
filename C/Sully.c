#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int nb = 5;
	char buf[50];
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c%1$cint main()%1$c{%1$c%2$cint nb = %3$d;%1$c%2$cchar buf[300];%1$c%2$cchar *s = %4$c%5$s%4$c;%1$c%2$csprintf(buf, %4$cSully_%%d.c%4$c, nb);%1$c%2$cif (fopen(buf, %4$cr%4$c))%1$c%2$c%2$cnb--;%1$c%2$cif (nb < 0)%1$c%2$c%2$creturn (0);%1$c%2$csprintf(buf, %4$cSully_%%d.c%4$c, nb);%1$c%2$cFILE *f = fopen(buf, %4$cw%4$c);%1$c%2$cfprintf(f, s, 10, 9, nb, 34, s);%1$c%2$cfclose(f);%1$c%2$csprintf(buf, %4$cgcc -o Sully_%%1$d Sully_%%1$d.c && ./Sully_%%1$d%4$c, nb);%1$c%2$csystem(buf);%1$c%2$creturn (0);%1$c}";
	sprintf(buf, "Sully_%d.c", nb);
	if (access(buf, F_OK) == 0)
		nb--;
	if (nb < 0)
		return (0);
	sprintf(buf, "Sully_%d.c", nb);
	FILE *f = fopen(buf, "w");
	fprintf(f, s, 10, 9, nb, 34, s);
	fclose(f);
	sprintf(buf, "gcc -o Sully_%1$d Sully_%1$d.c && ./Sully_%1$d", nb);
	system(buf);
	return (0);
}