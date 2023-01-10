#include <stdio.h>

#define LED_ADDR                0xbfaff000
#define NUM_ADDR                0xbfaff200
#define TIMER                   0xbfafe000

#define SOC_LED            (* (volatile unsigned *)  LED_ADDR      )
#define SOC_NUM            (* (volatile unsigned *)  NUM_ADDR      )
#define SOC_TIMER          (* (volatile unsigned *)  TIMER         )

#define GREEN                   0x000f    // test pass
#define RED                     0x00f0    // test fail
#define DELAY_COUNT 5000000

void delay() {
	printf("--delay()--begin\n");
	printf("\tEnter Delay()\n");
	printf("--delay()--end\n");
}

void init() {
	printf("--init()--begin\n");
	printf("\tSOC_LED=RED\n");
	printf("\tCALL delay()\n");
	delay();
	printf("--init()--end\n");
}

void print_result(int flag) {
	printf("--print_result()--begin\n");
	if(flag == 1){
		printf("\tFlag = 1 -> bool true -> SOC_LED = GREEN\n");
	}else{
		printf("\tFLAG = 0 -> bool false -> SOC_LED = RED\n");
	}
	printf("--print_result()--begin\n");
}

