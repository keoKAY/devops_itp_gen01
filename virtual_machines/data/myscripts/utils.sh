#!/bin/bash

function greeting(){
    local username="$1"
    echo "Welcome to function in shellscript 👍"
    echo "System Username: ${username^^}"
    echo "Thank you " 
}
check_service(){
    local service_name="$1"
    if systemctl is-active --quiet "$service_name" ; then 
        echo "Service: ${service_name} runing ✅" 
    else
        echo "Service: ${service_name} is not running ❌"
    fi 
}

