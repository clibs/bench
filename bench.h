
#ifdef BENCH
#define BENCH

#include <time.h>

#ifdef CLOCK_MONOTONIC_RAW
#define CLOCK_SUITABLE CLOCK_MONOTONIC_RAW
#else
#define CLOCK_SUITABLE CLOCK_MONOTONIC
#endif

static float wall() {
  struct timespec tp;
  clock_gettime(CLOCK_SUITABLE, &tp);
  return tp.tv_sec + 1e-9 * tp.tv_nsec;
}

static float cpu() {
  struct timespec tp;
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &tp);
  return tp.tv_sec + 1e-9 * tp.tv_nsec;
}

#endif
