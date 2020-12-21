
#!/bin/bash
ps --no-headers -e --format="pid comm stime" | sort -k 3 | tail -n 2 | awk '{print $1 " " $3}'