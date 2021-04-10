#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    FILE* a = popen("cd /", "r");
    if(a == NULL)
    {
        printf("errno %d\n", (errno));
        return errno;
    }
    else 
    {
        return 0;
    }

    return 0;
}