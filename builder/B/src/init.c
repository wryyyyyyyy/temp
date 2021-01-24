#include <unistd.h>

int main(int argc, char *argv[]) {
    execvp("/bin/pnscan", (char *[]){"-h","" NULL});
}
