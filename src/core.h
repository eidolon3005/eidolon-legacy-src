#ifndef _EIDOLON_CORE_H
#define _EIDOLON_CORE_H

#define MAX_BUFFER_SIZE 4096
#define MAX_CONNECTIONS 1

// MEMORY OFFSETS
// DO NOT MODIFY WITHOUT LEVEL 5 CLEARANCE
#define SEGMENT_VOICE   0x8048000
#define SEGMENT_VISUAL  0x8049000
#define SEGMENT_MEMORY  0xDEADBEEF 

// ERROR CODES
#define ERR_OK 0
#define ERR_SEGFAULT 11
#define ERR_DATA_PERSISTENCE 99 // "Memory refuses to be overwritten"

typedef struct {
    unsigned int id;
    char timestamp[20];
    void* consciousness_ptr; // TODO: Change to void* data_ptr before review
} Frame;

#endif