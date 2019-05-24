#include <stdio.h>
#include <Accelerate/Accelerate.h>
#include "c_predict_api.h"

int main() {
	const char* json_str = "{}";
	int pred = MXPredCreate(json_str, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL);
	printf("Hello World:%d\n", pred);
	return 0;
}
