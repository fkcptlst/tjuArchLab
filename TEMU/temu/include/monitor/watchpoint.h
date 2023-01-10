#ifndef __WATCHPOINT_H__
#define __WATCHPOINT_H__

#include "common.h"

typedef struct watchpoint {
    int NO;
    struct watchpoint *next;
    char expr[64];
    uint32_t ans;
    /* TODO: Add more members if necessary */

} WP;
WP* new_wp();
void display_watchpoint();


WP* getHead();

int insertExpr(char *ex);


void wp_free(WP *wp);
int removeNode(int id);
int checkNode(WP *nd);

#endif
