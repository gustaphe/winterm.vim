#include "stdio.h"

__declspec(dllexport) char* setCursorType(int type)
{
	printf("[%d q", type);
	return NULL;
}
