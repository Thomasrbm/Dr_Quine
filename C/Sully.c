#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    int nb = 5;
    if (nb >= 0)
    {
        FILE *f = fopen("Sully_5", "w");
        char *s = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c%1$cint main()%1$c{%1$c%2$cint nb = %3$c;%1$c%2$cif (nb >= 0)%1$c%2$c{%1$c%2$c    FILE *f = fopen(%4$cSully_%3$c%4$c, %4$cw%4$c);%2$c%2$c%1$c%2$c%2$cchar *s = %4$c%5$c%4$c;%1$c%2$c%2$cfprintf(f, s, 10, 9, (nb - 1), 34, s);%1$c%2$c%2$cfclose(f);%1$c%2$c%2$cchar *cmd = %4$cgcc Sully_%3$c%4$c;%1$c%2$c%2$csystem(cmd)%1$c%2$c%2$cchar *exec = %4$c./Sully_%3$c%4$c;%1$c%2$c%2$csystem(exec)%1$c%2$c}%1$c%2$creturn (0);%1$c}";
        fprintf(f, s, 10, 9, (nb - 1), 34, s);
        fclose(f);
        char *cmd = "gcc Sully_5";
        system(cmd);
        char *exec = "./Sully_5";
        system(exec);
    }
    return (0);
}