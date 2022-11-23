#!/bin/bash

. ./functions.sh
. ./variables.sh

# Main menu
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
      menu-options $PROJECT_DEV $SILENCE $C1 $R1
echo "================================================"
;;
    2)
      menu-options $PROJECT_DEV $SILENCE $C2 $R2
echo "================================================"
;;
   3)
      menu-options $PROJECT_DEV $SILENCE $C3 $R3
echo "================================================"
;;
    4)
       menu-options $PROJECT_PROD $SILENCE $C4 $R3
echo "================================================"
;;
     5)
       menu-options $PROJECT_PROD $SILENCE $C5 $R1
echo "================================================"
;;
    6)
      menu-options $PROJECT_STG $SILENCE $C6 $R3
echo "================================================"
 ;;
    7)
      menu-options $PROJECT_STG $SILENCE $C7 $R1
echo "================================================"
;;
    8)
      exiting
echo "================================================"
;;

*)
        echo "Invalid Option!"
esac
done

}
menu