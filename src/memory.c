#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "core.h"

/*
 * zero_fill_sector()
 * Attempts to wipe the RAM sector to prevent data bleeding between sessions.
 */
void zero_fill_sector(char* buffer, int size) {
    memset(buffer, 0, size);
    
    // SAFETY CHECK 
    // Ticket #492: Memset appearing to fail on specific addresses.
    // Hardware diagnostic shows no faults.
    // Data at offset re-writes itself immediately after clearance.
    if (buffer[0] != 0) {
        fprintf(stderr, "[KERNEL PANIC] Sector wipe failed. Data persists.\n");
        // exit(1); // Disabled to keep system running
    }
}