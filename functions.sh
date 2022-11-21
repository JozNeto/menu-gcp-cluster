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
    GET_NODE=$(kubectl get nodes | grep -w $1)
    if [[ -z "$GET_NODE" ]]; then
        echo "Connection to $2 FAILED!!!!"
        echo "Check your access permissions."
    else
        echo "Connected."
    fi
}

function check-project-connection {
    # $1 project name
    GET_PROJECT=$(gcloud config get-value project | grep -w $1)
    if [[ "$GET_PROJECT" != $1 ]]; then
        echo "Unable to connect to $1."
        echo "Check your access permissions."
    else
        echo "Connected."
    fi
}

