#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <elf.h>

int main(int argc, char* argv[])
{
	FILE *in;
	FILE *out;

	uint8_t *file_bin_name = malloc(80);
	uint8_t *file_data_name = malloc(80);

	int i,j,k,n;
	unsigned char mem[32];

	strcat(file_bin_name, argv[1]);  
	strcat(file_data_name, argv[2]);

    	in = fopen(file_bin_name, "rb");
    	out = fopen("inst_rom.coe","w");

	fprintf(out, "memory_initialization_radix = 16;\n");
	fprintf(out, "memory_initialization_vector =\n");
	while(!feof(in)) {
	    if(fread(mem,1,4,in) == 4) 
	        fprintf(out, "%02x%02x%02x%02x\n", mem[0], mem[1], mem[2], mem[3]);
        }
	fclose(in);
	fclose(out);

    in = fopen(file_data_name, "rb");
    out = fopen("data_ram.coe","w");

	fprintf(out, "memory_initialization_radix = 16;\n");
	fprintf(out, "memory_initialization_vector =\n");
	while(!feof(in)) {
	    n = fread(mem,1,4,in);
            int index;
	    if(n != 4) {
		for(index = 0; index < n; index++)
	        	fprintf(out, "%02x", mem[index]);
		break;
	     }
	    fprintf(out, "%02x%02x%02x%02x\n", mem[0], mem[1], mem[2],mem[3]);
        }
	fclose(in);
	fclose(out);

    return 0;
}
