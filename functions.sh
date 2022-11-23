#!/bin/bash

function set-project {
    # $1 project name
    SET_PROJECT=$(gcloud config set project $1)
}

function set-credential {
    # $1 region
    # $2 Cluster name 
    SET_CREDENTIAL=$(gcloud container clusters get-credentials --region $1 $2)
}

function check-cluster-connection {
    # $1 cluster name
    # $2 project name
    GET_NODE=$(timeout 10s kubectl get nodes | grep -w $1)
    if [[ -z "$GET_NODE" ]]; then
        echo "Connection to $2 FAILED!!!!"
        echo "Check your access permissions."
    else
        echo "Connected."
    fi
}

function check-project-connection {
    # $1 project name
    GET_PROJECT=$(timeout 10s gcloud config get-value project | grep -w $1)
    if [[ "$GET_PROJECT" != $1 ]]; then
        echo "Unable to connect to $1."
        echo "Check your access permissions."
    else
        echo "Connected."
    fi
}

function menu-options {
    # $1 project
    # $2 silence
    # $3 Cluster
    # $4 Region
    echo "Connecting $1 Project"
        set-project $1 &> $2
        check-project-connection $1 2> $2
        echo
        echo "Connecting $3 Cluster"
        set-credential $4 $3 &> $2
        check-cluster-connection $3 $1 2>  $2
        sleep 3
}

function exiting {
      echo "exiting..."
      sleep 2
      clear;
      exit;
}
