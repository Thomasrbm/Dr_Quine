#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
	int nb = 5;
	if (nb > 0)
	{
		char filename[20];
		sprintf(filename, "Sully_%d.c", nb - 1);
		FILE *f = fopen(filename, "w");
		char *s = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c%1$cint main()%1$c{%1$c%2$cint nb = %4$d;%1$c%2$cif (nb > 0)%1$c%2$c{%1$c%2$c%2$cchar filename[20];%1$c%2$c%2$csprintf(filename, %5$cSully_%%d.c%5$c, nb - 1);%1$c%2$c%2$cFILE *f = fopen(filename, %5$cw%5$c);%1$c%2$c%2$cchar *s = %5$c%6$s%5$c;%1$c%2$c%2$cfprintf(f, s, 10, 9, nb, (nb - 1), 34, s);%1$c%2$c%2$cfclose(f);%1$c%2$c%2$cchar cmd[50];%1$c%2$c%2$csprintf(cmd, %5$cgcc -o Sully_%%d Sully_%%d.c%5$c, nb - 1, nb - 1);%1$c%2$c%2$csystem(cmd);%1$c%2$c%2$cchar exec[20];%1$c%2$c%2$csprintf(exec, %5$c./Sully_%%d%5$c, nb - 1);%1$c%2$c%2$csystem(exec);%1$c%2$c}%1$c%2$creturn (0);%1$c}%1$c";
		fprintf(f, s, 10, 9, nb, (nb - 1), 34, s);
		fclose(f);
		char cmd[50];
		sprintf(cmd, "gcc -o Sully_%d Sully_%d.c", nb - 1, nb - 1);
		system(cmd);
		char exec[20];
		sprintf(exec, "./Sully_%d", nb - 1);
		system(exec);
	}
	return (0);
}