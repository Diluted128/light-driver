/*************************************************************************
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
* All rights reserved. All use of this software and documentation is     *
* subject to the License Agreement located at the end of this file below.*
**************************************************************************
* Description:                                                           *
* The following is a simple hello world program running MicroC/OS-II.The * 
* purpose of the design is to be a very simple application that just     *
* demonstrates MicroC/OS-II running on NIOS II.The design doesn't account*
* for issues such as checking system call return codes. etc.             *
*                                                                        *
* Requirements:                                                          *
*   -Supported Example Hardware Platforms                                *
*     Standard                                                           *
*     Full Featured                                                      *
*     Low Cost                                                           *
*   -Supported Development Boards                                        *
*     Nios II Development Board, Stratix II Edition                      *
*     Nios Development Board, Stratix Professional Edition               *
*     Nios Development Board, Stratix Edition                            *
*     Nios Development Board, Cyclone Edition                            *
*   -System Library Settings                                             *
*     RTOS Type - MicroC/OS-II                                           *
*     Periodic System Timer                                              *
*   -Know Issues                                                         *
*     If this design is run on the ISS, terminal output will take several*
*     minutes per iteration.                                             *
**************************************************************************/


#include <stdio.h>
#include "includes.h"
#include <system.h>
#include <io.h>

#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    task2_stk[TASK_STACKSIZE];

OS_EVENT *SWBox1;


#define TASK1_PRIORITY      1
#define TASK2_PRIORITY      2


void task1(void* pdata)
{
  int sw_state_flag = 0;
  INT8U err;

  while (1)
  { 
    sw = IORD(SW_SLIDERS, 0);

    if(sw_state_flag != sw){
    	err = OSMboxPostOpt(SWBox1, &sw, OS_POST_OPT_BROADCAST);
    	if(err == NULL)
    		printf("task1: Wys³ano wiadomosc");
    	else
    		printf("task1: W OSMBox znajduj¹ siê nieodebrane dane");
    	sw_state_flag = sw;
    }

    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}

void task2(void* pdata)
{
  while (1)
  { 
    INT8U err;
    int *num;

//    returns null if err was set to OS_TIMEOUT
    num = OSMboxPend(SWBox1, 10, &err);

    if(err != NULL){
       printf("task2: Wys³ano dane do modu³u");
       IOWR(ROOMS_MANAGER_0, 0, *num);
    }
    else
    	printf("task2: TIMEOUT");

    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}

int main(void)
{
  
  OSTaskCreateExt(task1,
                  NULL,
                  (void *)&task1_stk[TASK_STACKSIZE-1],
                  TASK1_PRIORITY,
                  TASK1_PRIORITY,
                  task1_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
              
               
  OSTaskCreateExt(task2,
                  NULL,
                  (void *)&task2_stk[TASK_STACKSIZE-1],
                  TASK2_PRIORITY,
                  TASK2_PRIORITY,
                  task2_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
  OSStart();
  return 0;
}
