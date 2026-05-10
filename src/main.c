#include <dirent.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#define ERROR 1
#define FOUND 0
#define NOT_FOUND 1

int main() {
    /* int main(int argc, char **argv) { */
    // 引数の数などのエラーハンドリング
    // pathの構築 opendirでdir領域へのポインタを取得して、raeddirで読み込む
    DIR *dirp;
    // Sample code which searches a directory for entry ``name'' is:

    dirp = opendir(".");
    if (dirp == NULL) {
        return (ERROR);
    }

    struct dirent *dp;
    while ((dp = readdir(dirp)) != NULL) {
        // .fileを表示しない方がいいかも
        printf("%s\n", &dp->d_name);
        /* write(1, dp->d_name, 255); */
    }
    (void)closedir(dirp);
    return (FOUND);

    // 存在確認
    // gobbleなどの連結リストに一旦まとめる
    // オプションによるソートなどを行う
    //
}
