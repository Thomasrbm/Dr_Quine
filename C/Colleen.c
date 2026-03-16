#include <stdio.h>

/*
    Hello
*/

void useless()
{
}

int main()
{
    /*
        World
    */
    useless();
    char *s = "#include <stdio.h>%1$c%1$c/*%1$c    Hello%1$c*/%1$c%1$cvoid useless()%1$c{%1$c}%1$c%1$cint main()%1$c{%1$c    /*%1$c        World%1$c    */%1$c    useless();%1$c    char *s = %2$c%3$s%2$c;%1$c    printf(s, 10, 34, s);%1$c    return 0;%1$c}";
    printf(s, 10, 34, s);
    return 0;
}