#include <stdio.h>
#include "c_predict_api.h"

int main() {
    const char * json_str = "{}";
    const char * err = MXGetLastError();
    int pred = MXPredCreate(json_str, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
    printf("[TEST] Construct pseudo model: %d\n", pred);
    printf("[TEST] Get last error: %s\n", err);
    return 0;
}
