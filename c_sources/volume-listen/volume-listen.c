
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>

#define RECEIVE_BUFFER_SIZE 32
#define VOLUME_BUFFER_SIZE 6
#define MUTE_BUFFER_SIZE 10
#define MUTED_OUTPUT_OFFSET 6
#define OUTPUT_SIZE 36


static uint8_t is_running = 1;
static const char LISTEN_COMMAND[] = "pactl subscribe";
static const char QUERY_SINK_COMMAND[] = "pactl get-sink-volume @DEFAULT_SINK@ | awk -F '[//]' '{print $2}'";
static const char QUERY_SINK_MUTE_COMMAND[] = "pactl get-sink-mute @DEFAULT_SINK@";
static const char QUERY_SOURCE_COMMAND[] = "pactl get-source-volume @DEFAULT_SOURCE@ | awk -F '[//]' '{print $2}'";
static const char QUERY_SOURCE_MUTE_COMMAND[] = "pactl get-source-mute @DEFAULT_SOURCE@";
static const char PATTERN_TO_CHECK[] = "Event 'change' on sink";
static const char PATTERN_TO_CHECK_MIC[] = "Event 'change' on source";
static FILE* proc;

void handle_sigint(int signal){
    is_running = 0;
}

void handle_sigkill(int signal){
    is_running = 0;
    pclose(proc);
}

void signal_handlers(){
    signal(SIGINT, handle_sigint);
    signal(SIGKILL, handle_sigkill);
}

uint8_t mic_is_muted(){
    FILE* query_proc = popen(QUERY_SOURCE_MUTE_COMMAND, "r");
    char buffer[MUTE_BUFFER_SIZE] = {0};
    fread(buffer, sizeof(char), MUTE_BUFFER_SIZE-1, query_proc);

    uint8_t is_muted = strcmp(buffer + MUTED_OUTPUT_OFFSET, "yes") == 0;

    pclose(query_proc);
    return is_muted;
}

uint8_t sink_is_muted(){
    FILE* query_proc = popen(QUERY_SINK_MUTE_COMMAND, "r");
    char buffer[MUTE_BUFFER_SIZE] = {0};
    fread(buffer, sizeof(char), MUTE_BUFFER_SIZE-1, query_proc);

    uint8_t is_muted = strcmp(buffer + MUTED_OUTPUT_OFFSET, "yes") == 0;

    pclose(query_proc);
    return is_muted;
}

void generate_mic_output(char* dest){
    FILE* query_proc = popen(QUERY_SOURCE_COMMAND, "r");
    char buffer[VOLUME_BUFFER_SIZE] = {0};
    fread(buffer, sizeof(char), VOLUME_BUFFER_SIZE-1, query_proc);

    char vol_level_buffer[VOLUME_BUFFER_SIZE-1] = {0};
    strncpy(vol_level_buffer, buffer, VOLUME_BUFFER_SIZE-1);
    uint8_t volume_level = atoi(vol_level_buffer);

    uint8_t is_muted = mic_is_muted();

    sprintf(dest, "\"mic\":{\"muted\":%s,\"volume\":%d}", is_muted ? 
            "true" : "false", volume_level);
    pclose(query_proc);
}

void generate_sink_output(char* dest){
    FILE* query_proc = popen(QUERY_SINK_COMMAND, "r");
    char buffer[VOLUME_BUFFER_SIZE] = {0};
    fread(buffer, sizeof(char), VOLUME_BUFFER_SIZE-1, query_proc);

    char vol_level_buffer[VOLUME_BUFFER_SIZE-1] = {0};
    strncpy(vol_level_buffer, buffer, VOLUME_BUFFER_SIZE-1);
    uint8_t volume_level = atoi(vol_level_buffer);

    uint8_t is_muted = sink_is_muted();

    sprintf(dest, "\"sink\":{\"muted\":%s,\"volume\":%d}", is_muted ? 
            "true" : "false", volume_level);
    pclose(query_proc);

}

void event(){
    char mic_buffer[OUTPUT_SIZE] = {0};
    char sink_buffer[OUTPUT_SIZE] = {0};

    generate_mic_output(mic_buffer);
    generate_sink_output(sink_buffer);

    printf("{%s,%s}\n", mic_buffer, sink_buffer);
    fflush(stdout);
}

void listen_process(){
    proc = popen(LISTEN_COMMAND, "r");
    while(is_running){
        char buffer[RECEIVE_BUFFER_SIZE] = {0};
        char* read = fgets(buffer, RECEIVE_BUFFER_SIZE, proc);
        if (strstr(buffer, PATTERN_TO_CHECK) != NULL ||
            strstr(buffer, PATTERN_TO_CHECK_MIC) != NULL)
          event();
    }
    pclose(proc);
}

int main(int argc, char *argv[]) {
    signal_handlers();
    event();
    listen_process();
    return 0;
}
