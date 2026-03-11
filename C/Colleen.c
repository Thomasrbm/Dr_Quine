#include <stdio.h>

/*
    Yo, Colleen program printing itself right here, by throbert
*/

void useless()
{
}

int main()
{
    /*
        Another one, by throbert (watermark)
    */
    useless();
    char *s = "#include <stdio.h>%1$c%1$c/*%1$c    Yo, Colleen program printing itself right here, by throbert%1$c*/%1$c%1$cvoid useless()%1$c{%1$c}%1$c%1$cint main()%1$c{%1$c    /*%1$c        Another one, by throbert (watermark)%1$c    */%1$c    useless();%1$c    char *s = %2$c%3$s%2$c;%1$c    printf(s, 10, 34, s);%1$c    return 0;%1$c}%1$c";
    printf(s, 10, 34, s);
    return 0;
}