#include <stdio.h>
#include "process.h"

/* ============================================================
 * Student implementation area
 * ============================================================ */
void fcfs_schedule(Process p[], int n)
{
    (void)p;
    (void)n;
    /* TODO: Implement FCFS scheduling algorithm here */
    int time = 0;

    // Ordenar procesos por arrival_timeSS
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (p[i].arrival_time > p[j].arrival_time) {
                Process aux = p[i];
                p[i] = p[j];
                p[j] = aux;
            }
        }
    }

    //  Ejecutar procesos en orden de llegada
    for (int i = 0; i < n; i++) {

        // si el proceso llega despues, el CPU espera
        if (time < p[i].arrival_time) {
            time = p[i].arrival_time;
        }

        // Waiting Time = tiempo actual - arrival time
        p[i].waiting_time = time - p[i].arrival_time;

        // Ejecutar proceso completo
        time += p[i].burst_time;

        // turnaround = tiempo final - arrival time
        p[i].turnaround_time = time - p[i].arrival_time;

        p[i].completed = 1;
    }
}

/* ============================================================
 * DO NOT MODIFY MAIN
 * ============================================================ */
#ifndef UNIT_TEST
int main(void)
{
    int n;
    printf("Número de procesos: ");
    scanf("%d", &n);

    Process p[n];
    read_processes(p, n);
    init_processes(p, n);

    fcfs_schedule(p, n);

    print_results(p, n, "FCFS Scheduling");
    return 0;
}
#endif