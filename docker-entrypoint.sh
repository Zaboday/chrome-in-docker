#!/usr/bin/env bash

export DISPLAY_NUM="${DISPLAY_NUM:-15}";
export SCREEN_NUM="${SCREEN_NUM:-0}";
export SCREEN_WIDTH="${SCREEN_WIDTH:-1440}";
export SCREEN_HEIGHT="${SCREEN_HEIGHT:-900}";
export CHROMEDRIVER_PORT="${CHROMEDRIVER_PORT:-9515}";
export START_TIMEOUT="${START_TIMEOUT:-15}";

# Initialize screen resolution ENV value (it will be read by supervisord and xvfb.init scripts)
export SCREEN_RESOLUTION="${SCREEN_WIDTH}x${SCREEN_HEIGHT}x24+32";

function control_c() {
  killall supervisord || true;
  exit;
}

trap control_c SIGINT SIGTERM SIGHUP

# Launch supervisor
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf &

sleep 1;

# Make sure - supervisord started
ps aux | grep supervisord | grep -q -v grep;
status=$?
if [ $status -ne 0 ]; then
  echo '[ERROR] Supervisor process does not started.';
  exit 1;
fi;

sleep 2;

# Wait for Xvfb starts
loopCount=0;
until xdpyinfo -display :$DISPLAY_NUM >/dev/null 2>&1; do
  echo '[log] Wait for Xvfb starts..';
  loopCount=$((loopCount+1));
  sleep 1;
  if [ ${loopCount} -gt ${START_TIMEOUT} ]; then
    echo "[ERROR] xvfb failed to start."
    exit 1;
  fi;
done;

sleep 1;

# Make check - any command passed?
if [ $# -eq 0 ]; then
  # Start infinite loop
  while :; do
    sleep 1;
  done;
else
  # Or exec passed shit
  exec "$@"
fi;
