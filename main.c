#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include <libgen.h>

#include "installer/libinstaller.h"
#include "terraform/libterraform.h"

void WrapperMain(void)
{
	printf("Wrapper...\n");
}

int main(int argc, char **argv)
{
	const char *prog = basename(argv[0]);

	if (strcmp(prog, "openshift-install") == 0)
		InstallerMain();
	else if (strcmp(prog, "terraform") == 0)
		TerraformMain();
	else
		WrapperMain();
		
	return 0;
}
