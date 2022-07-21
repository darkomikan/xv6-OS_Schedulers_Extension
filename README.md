# xv6-OS_Schedulers_Extension
Schedulers extension for the xv6 operating system

# Schedulers implemented
- Shortest Job First (SJF) Non-Preemptive
- Shortest Job First (SJF) Preemptive
- Completely Fair Scheduler (CFS)

# Tests (average results in ticks, less->better)
Number of CPUs: 1
- DEFAULT_SCHEDULER = 1987 ticks, starvation-huge
- SJF_NONPREEMPTIVE = 1462 ticks, starvation-variable
- SJF_PREEMPTIVE    = 1435 ticks, starvation-variable
- CFS               = 2139 ticks, starvation-low

Number of CPUs: 2
- DEFAULT_SCHEDULER = 1776 ticks
- SJF_NONPREEMPTIVE = 1341 ticks
- SJF_PREEMPTIVE    = 1339 ticks
- CFS               = 1522 ticks

Number of CPUs: 4
- DEFAULT_SCHEDULER = 1266 ticks
- SJF_NONPREEMPTIVE = 1306 ticks
- SJF_PREEMPTIVE    = 1244 ticks
- CFS               = 1339 ticks
