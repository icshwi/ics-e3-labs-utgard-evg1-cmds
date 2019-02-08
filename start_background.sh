#!/bin/bash
export IOC_EXEC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
export VAR_DIR="/epics/iocs/var"
export E3_BIN_DIR="/epics/base-7.0.1.1/require/3.0.4/bin"
export PROCSERV="/bin/procServ"
export PROCSERV_PORT=2000
export PROCSERV_IOC_DIR=labs-utgard-evg1
mkdir -p $VAR_DIR/run/procServ/$PROCSERV_IOC_DIR
export IOC_ST_CMD=st.labs-utgard-evg1.cmd
source "$E3_BIN_DIR/setE3Env.bash"
$PROCSERV -f -L $VAR_DIR/log/procServ/$PROCSERV_IOC_DIR -i ^C^D -c $VAR_DIR/run/procServ/$PROCSERV_IOC_DIR $PROCSERV_PORT $E3_BIN_DIR/iocsh.bash $IOC_EXEC_DIR/$IOC_ST_CMD &
