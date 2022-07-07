#!/bin/bash
function f_tools_ram {
    echo "
    ----------------------------------------------
    Mémoire avant :
    " && free -h && sudo sysctl vm.drop_caches=3 && echo "
    ----------------------------------------------
    Mémoire après :
    " && free -h && echo "
    ----------------------------------------------
    "
    }
f_tools_ram