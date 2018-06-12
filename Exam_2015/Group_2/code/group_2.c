#include <stdio.h>
#include <stdlib.h>

char* generate_str_c(char *s, int c, int n, int inc) {
    if(inc == 0) {
        for(int i = 0; i < n; i++) {
            s[i] = c;
        }
    } else {
        for(int i = 0; i < n; i++) {
            s[i] = c+i;
        }
    }
    return s;
}

char* generate_str(char *s, int c, int n, int inc);

int main(int argc, char *argv[]){
    int string_size = 10;
    char *s_c;
    char *s;
    s_c = malloc(sizeof(char) * string_size);
    s = malloc(sizeof(char) * string_size);
    printf("%s\n", generate_str_c(s_c, 'a', string_size, 1));
    printf("%s\n", generate_str(s, 'a', string_size, 1));
    return 0;
}