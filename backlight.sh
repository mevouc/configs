#!/bin/bash

DIR="/sys/class/backlight/intel_backlight/"

OLDBRTNSS=$(cat $DIR"brightness")

MAXBRTNSS=$(cat $DIR"max_brightness")

OLDPRCT=$(( 100 * $OLDBRTNSS / $MAXBRTNSS ))

NEWPRCT=$(($OLDPRCT $1))

NEWBRTNSS=$(( $MAXBRTNSS * $NEWPRCT / 100 ))

sudo chmod 666 $DIR"brightness"
echo $NEWBRTNSS > $DIR"brightness"

