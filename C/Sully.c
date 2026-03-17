#include <stdio.h>
#include <stdlib.h>

int main()
{
	int nb = 5;
	char filename[20];
	char cmd[50];
	char exec[20];
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$cint main()%1$c{%1$c%2$cint nb = %3$d;%1$c%2$cchar filename[20];%1$c%2$cchar cmd[50];%1$c%2$cchar exec[20];%1$c%2$cchar *s = %4$c%5$s%4$c;%1$c%2$csprintf(filename, %4$cSully_%%d.c%4$c, nb);%1$c%2$cFILE *test = fopen(filename, %4$cr%4$c);%1$c%2$cif (test == NULL)%1$c%2$c{%1$c%2$c%2$cFILE *f = fopen(filename, %4$cw%4$c);%1$c%2$c%2$cfprintf(f, s, 10, 9, nb, 34, s);%1$c%2$c%2$cfclose(f);%1$c%2$c%2$csprintf(cmd, %4$cgcc -o Sully_%%d Sully_%%d.c%4$c, nb, nb);%1$c%2$c%2$csystem(cmd);%1$c%2$c%2$csprintf(exec, %4$c./Sully_%%d%4$c, nb);%1$c%2$c%2$csystem(exec);%1$c%2$c}%1$c%2$celse%1$c%2$c{%1$c%2$c%2$cfclose(test);%1$c%2$c%2$cif (nb - 1 >= 0)%1$c%2$c%2$c{%1$c%2$c%2$c%2$csprintf(filename, %4$cSully_%%d.c%4$c, nb - 1);%1$c%2$c%2$c%2$cFILE *f = fopen(filename, %4$cw%4$c);%1$c%2$c%2$c%2$cfprintf(f, s, 10, 9, nb - 1, 34, s);%1$c%2$c%2$c%2$cfclose(f);%1$c%2$c%2$c%2$csprintf(cmd, %4$cgcc -o Sully_%%d Sully_%%d.c%4$c, nb - 1, nb - 1);%1$c%2$c%2$c%2$csystem(cmd);%1$c%2$c%2$c%2$csprintf(exec, %4$c./Sully_%%d%4$c, nb - 1);%1$c%2$c%2$c%2$csystem(exec);%1$c%2$c%2$c}%1$c%2$c}%1$c%2$creturn (0);%1$c}";

	sprintf(filename, "Sully_%d.c", nb);
	FILE *test = fopen(filename, "r");
	if (test == NULL)
	{
		FILE *f = fopen(filename, "w");
		fprintf(f, s, 10, 9, nb, 34, s);
		fclose(f);
		sprintf(cmd, "gcc -o Sully_%d Sully_%d.c", nb, nb);
		system(cmd);
		sprintf(exec, "./Sully_%d", nb);
		system(exec);
	}
	else
	{
		fclose(test);
		if (nb - 1 >= 0)
		{
			sprintf(filename, "Sully_%d.c", nb - 1);
			FILE *f = fopen(filename, "w");
			fprintf(f, s, 10, 9, nb - 1, 34, s);
			fclose(f);
			sprintf(cmd, "gcc -o Sully_%d Sully_%d.c", nb - 1, nb - 1);
			system(cmd);
			sprintf(exec, "./Sully_%d", nb - 1);
			system(exec);
		}
	}
	return (0);
}