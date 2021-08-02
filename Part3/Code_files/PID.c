/*
 * PID.c
 *
 * Created: 10.08.1921 12:40:11
 *  Author: Henry Ford
 */ 
// Compiler includes
#include <math.h>
#include <avr/io.h>
// FreeRTOS includes
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
// Modul includes
#include "global.h"
#include "PID.h"
//----------------------------------------------------------
void  vPID ( void * pvParameters)
{
	float x = 0.0, y = 0.0, p = 0.0, i = 0.0, d = 0.0, t = 0.018 ;
	// Place here your local parameters
	//float proportional = 2.8;
	//float integral = 0.01;
	//float derivative = 0.13;
	float previous_error = 0.0, error = 0.0, total_error = 0.0;
	
  // Super loop of task
  for (;;)  
  { // Get position value from sensor queue
    xQueueReceive (QueueSensor, &x, portMAX_DELAY);
		
		
		/*	Compute here your digital PID formula with the 
				help of following global variables:
				reference, proportional, integral, derivative
				and please remember the sampling time
		*/
		
		
		// For example a simple P control startup formula
		error = (reference - x);
		p = proportional * error;
		i = integral * t * (error + total_error);
		d = derivative * (error - previous_error) / t;
			
		total_error = error + total_error;
		previous_error = error;

		y = p + i + d;

		// Write angle value to servo queue
		xQueueSend (QueueServo, &y, portMAX_DELAY);
		
	} // end for loop
} // end of task PID
//---------------------------------------------------------