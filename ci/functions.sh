# shellcheck shell=bash

################################################################################
# This collection of helper functions is sourced by the ci scripts.
################################################################################

run() {
  echo "[RUN] $*" >&2
  "$@"
}

err() {
  echo "[ERROR] $*" >&2
}

info() {
  echo "[INFO] $*" >&2
}

pass() {
  echo "[PASS] $*" >&2
}

warn() {
  echo "[WARN] $*" >&2
}

debug() {
  echo "[DEBUG] $*" >&2
}

finish() {
  declare -ri RC=$?

  if [ ${RC} -eq 0 ]; then
    pass "$0 OK"
  else
    err "$0" failed with exit code ${RC}
  fi
}

# Traps.
# NOTE: In POSIX, beside signals, only EXIT is valid as an event.
#       You must use bash to use ERR.
trap finish EXIT
