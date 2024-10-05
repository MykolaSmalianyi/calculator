#include <stdio.h>
#include "calculator.h"

int main() {
	int x = 5, y = 10;
	Calculator c;
	printf("Add: %d\n", c.Add(x, y));
	printf("Sub: %d\n", c.Sub(x, y));
	printf("Mul: %d\n", c.Mul(x, y));
	printf("Div: %d\n", c.Div(x, y));

	return 0;
}
