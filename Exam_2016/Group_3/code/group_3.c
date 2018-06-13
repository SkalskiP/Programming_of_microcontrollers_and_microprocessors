#include <stdio.h>
#include <stdlib.h>

char * fun_c(char * buff, char * a, char * b) {
    int new = 0;
    int old = 0;
    int can_use_a = 1;
    int can_use_b = 1;

    while(can_use_a || can_use_b) {
        if(can_use_a) {
            if(a[old] != 0) {
                buff[new] = a[old];
                new++;
            } else {
                can_use_a = 0;
            }
        }
        if(can_use_b) {
            if(b[old] != 0) {
                buff[new] = b[old];
                new++;
            } else {
                can_use_b = 0;
            }
        }
        old++;
    }
    return buff;
}

char * fun(char * buff, char * a, char * b);

int main(int argc, char *argv[]){
    int string_size = 50;
    char *s_c;
    char *s;
    char *a = "aaaaaa";
    char *b = "bb";
    s_c = malloc(sizeof(char) * string_size);
    s = malloc(sizeof(char) * string_size);

    printf("%s\n", fun_c(s_c, a, b));
    printf("%s\n", fun(s, a, b));

    free(s_c);
    free(s);
    return 0;
}