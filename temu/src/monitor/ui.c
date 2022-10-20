#include "monitor.h"
#include "temu.h"
#include "watchpoint.h"

#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

void cpu_exec(uint32_t);

void display_reg();
uint32_t expr(char *e, bool *success);
/* We use the `readline' library to provide more flexibility to read from stdin. */
char* rl_gets() {
	static char *line_read = NULL;

	if (line_read) {
		free(line_read);
		line_read = NULL;
	}

	line_read = readline("(temu) ");

	if (line_read && *line_read) {
		add_history(line_read);
	}

	return line_read;
}

static int cmd_c(char *args) {
	cpu_exec(-1);
	return 0;
}

static int cmd_q(char *args) {
	return -1;
}
static int cmd_info(char *args){
    if(args[0] == 'r'){
        display_reg();
        return 0;
    }
    if(args[0] == 'w'){
        //display_memory(0,30);
        display_watchpoint();
        return 0;
    }
    return 0;
}
static int cmd_si(char *args) {
    if(args == NULL) {
        cpu_exec(1);
    }else {
        int step;
        sscanf(args, "%d", &step);
        if(step < 1) {
            fprintf(stderr, "执行步数应当大于或等于1.\n");
            return -1;
        }
        cpu_exec(step);
    }
    return 0;
}
static int cmd_w(char *args) {
    if(args == NULL) return 0;
    int id = insertExpr(args);
    if(id == -1) {
        printf("\033[1;31mInvalid expression\n\033[0m");
        return 0;
    }
    printf("Add watchpoint %d\n", id);
    return 0;
}
static int cmd_d(char *args){
    int NO = atoi(args);
    if(removeNode(NO)){
        return 0;
    }else{
        return -1;
    }
}
static int cmd_p(char* args){
    uint32_t num;
    bool success;
    num = expr(args, &success);
    if (success)
    {
        printf("Expression %s:\t0x%x\t%d\n", args, num, num);
    }
//    else assert(0);
    return 0;
}
static int cmd_x(char* args){
    if (args == NULL)
    {
        printf("Need more parameters type 1.\n");
        return 0;
    }

    char *arg = strtok(args, " ");
    if (arg == NULL)
    {
        printf("Need more parameters type 2.\n");
        return 0;
    }

    int n = atoi(arg);
    char *EXPR = strtok(NULL, " ");
    if (EXPR == NULL)
    {
        printf("Need more parameters type 3.\n");
        return 0;
    }

    uint32_t address;
    bool success;
    address = expr(EXPR, &success);
    if (success)
    {
        for (int i=0;i<n;i++){
            uint32_t data= mem_read(address+i*4,4);
            printf("0x%08x: ",address + i*4);
            for(int j=0;j<4;j++){
                printf("0x%02x ",data&0xff);
                data = data >> 8;
            }
            printf("\n");
        }
    }
    else {
        assert(0);
    }
    return 0;
}
static int cmd_help(char *args);

static struct {
	char *name;
	char *description;
	int (*handler) (char *);
} cmd_table [] = {
	{ "help", "Display informations about all supported commands", cmd_help },
	{ "c", "Continue the execution of the program", cmd_c },
    { "si", "Single step", cmd_si },
    { "info", "r for print register state \n w for print watchpoint information", cmd_info},
    {"p","Expression evaluation.",cmd_p},
    {"w", "Add watchpoint", cmd_w},
    {"d", "Delete watchpoint", cmd_d},
    {"x","Scan memory.",cmd_x},
	{ "q", "Exit TEMU", cmd_q }

	/* TODO: Add more commands */

};

#define NR_CMD (sizeof(cmd_table) / sizeof(cmd_table[0]))

static int cmd_help(char *args) {
	/* extract the first argument */
	char *arg = strtok(NULL, " ");
	int i;

	if(arg == NULL) {
		/* no argument given */
		for(i = 0; i < NR_CMD; i ++) {
			printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
		}
	}
	else {
		for(i = 0; i < NR_CMD; i ++) {
			if(strcmp(arg, cmd_table[i].name) == 0) {
				printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
				return 0;
			}
		}
		printf("Unknown command '%s'\n", arg);
	}
	return 0;
}

void ui_mainloop() {
	while(1) {
		char *str = rl_gets();
		char *str_end = str + strlen(str);

		/* extract the first token as the command */
		char *cmd = strtok(str, " ");
		if(cmd == NULL) { continue; }

		/* treat the remaining string as the arguments,
		 * which may need further parsing
		 */
		char *args = cmd + strlen(cmd) + 1;
		if(args >= str_end) {
			args = NULL;
		}

		int i;
		for(i = 0; i < NR_CMD; i ++) {
			if(strcmp(cmd, cmd_table[i].name) == 0) {
				if(cmd_table[i].handler(args) < 0) { return; }
				break;
			}
		}

		if(i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
	}
}
