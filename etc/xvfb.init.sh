#!/usr/bin/env bash

### BEGIN INIT INFO
# Provides:          Xvfb
# Required-Start:
# Required-Stop:
# Default-Start:
# Default-Stop:
# Short-Description: Stop/start Xvfb
### END INIT INFO

DISPLAY_NUM="${DISPLAY_NUM:-15}";
SCREEN_NUM="${SCREEN_NUM:-0}";
SCREEN_WIDTH="${SCREEN_WIDTH:-1440}";
SCREEN_HEIGHT="${SCREEN_HEIGHT:-900}";
SCREEN_RESOLUTION="${SCREEN_RESOLUTION:-${SCREEN_WIDTH}x${SCREEN_HEIGHT}x16+32}";

XVFB=/usr/bin/Xvfb
XVFBARGS=":$DISPLAY_NUM -screen $SCREEN_NUM $SCREEN_RESOLUTION -ac +extension GLX +render -noreset";
PIDFILE='/var/run/xvfb.pid';

case "$1" in
  start)
    echo -n "Starting virtual X frame buffer: Xvfb"
    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer: Xvfb"
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
    exit 1
esac

exit 0
