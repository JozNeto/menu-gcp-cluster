#!/bin/bash

. ./functions.sh
. ./variables.sh




x="menu"
menu ()
{
while true $x != "menu"
do
clear
echo "================================================"
echo "Connect to GKE Cluster"
echo
echo "Development:"
echo "1) $C1" 
echo "2) $C2"
echo "3) $C3"
echo
echo "Production:"
echo "4) $C4"
echo "5) $C5"
echo
echo "Staging:"
echo "6) $C6"
echo "7) $C7"
echo
echo "8) Exit"
echo
echo "================================================"

echo "Enter option:"
read x
echo "================================================"

case "$x" in


    1)
      echo "Connecting $PROJECT_DEV Project"
      set-project $PROJECT_DEV &> $SILENCE
      check-project-connection $PROJECT_DEV 2> $SILENCE
      echo
      echo "Connecting $C1 Cluster"
      set-credential $R1 $C1 &> $SILENCE
      check-cluster-connection $C1 $PROJECT_DEV 2> $SILENCE
      sleep 3

echo "================================================"
;;
    2)
      echo "Connecting $PROJECT_DEV"
      set-project $PROJECT_DEV &> $SILENCE
      check-project-connection $PROJECT_DEV 2> $SILENCE
      echo
      echo "Connecting $C2 Cluster"
      set-credential $R2 $C2 &> $SILENCE
      check-connection $C2 $PROJECT_DEV 2> $SILENCE
      sleep 3

echo "================================================"
;;
   3)
      echo "Connecting $PROJECT_DEV"
      set-project $PROJECT_DEV &> $SILENCE
      check-project-connection $PROJECT_DEV 2> $SILENCE
      echo
      echo "Connecting $C3 Cluster"
      set-credential $R3 $C3 &> $SILENCE
      check-connection $C3 $PROJECT_DEV 2> $SILENCE
      sleep 3

echo "================================================"
;;
    4)
       echo "Connecting $PROJECT_PROD "
       set-project $PROJECT_PROD &> $SILENCE
       check-project-connection $PROJECT_PROD 2> $SILENCE
       echo
       echo "Connecting $C4 Cluster"
       set-credential $R3 $C4 &> $SILENCE
       check-connection $C4 $PROJECT_PROD 2> $SILENCE
       sleep 3
echo "================================================"
;;
     5)
       echo "Connecting $PROJECT_PROD"
       set-project $PROJECT_PROD &> $SILENCE
       check-project-connection $PROJECT_PROD 2> $SILENCE
       echo
       echo "Connecting $C5 Cluster"
       set-credential $R1 $C5 &> $SILENCE
       check-connection $C5 $PROJECT_PROD 2> $SILENCE
       sleep 3
echo "================================================"
;;
    6)
      echo "Connecting $PROJECT_STG"
      set-project $PROJECT_STG &> $SILENCE
      check-project-connection $PROJECT_STG 2> $SILENCE
      echo
      echo "Connecting $C6 Cluster"
      set-credential $R3 $C6 &> $SILENCE
      check-connection $C6 $PROJECT_STG 2> $SILENCE
      sleep 3

echo "================================================"
 ;;
    7)
      echo "Connecting $PROJECT_STG"
      set-project $PROJECT_STG &> $SILENCE
      check-project-connection $PROJECT_STG 2> $SILENCE
      echo
      echo "Connecting $C7 Cluster"
      set-credential $R1 $C7 &> $SILENCE
      check-connection $C7 $PROJECT_STG 2> $SILENCE
      sleep 3

echo "================================================"
;;
    8)
      echo "exiting..."
      sleep 3
      clear;
      exit;

echo "================================================"
;;

*)
        echo "Invalid Option!"
esac
done

}
menu