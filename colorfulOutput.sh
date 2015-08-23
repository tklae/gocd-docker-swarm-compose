#!/bin/bash

#Usage:
#echoyellow "yellow submarine"
#echogreen "green grass"
#echored "red alert"
#echoblue "blue stell"
#echomagenta "magenta magice"
#echocyan "cyan cyan"

#Only need a few colors and no special styles/background color
ESCAPE_SEQUENCE="\x1b[" #hexadecimal value insted out \e for Terminal.app support

RESET_ALL="${ESCAPE_SEQUENCE}0m"

TEXTCOLOR_YELLOW="${ESCAPE_SEQUENCE}33m"
TEXTCOLOR_GREEN="${ESCAPE_SEQUENCE}32m"
TEXTCOLOR_RED="${ESCAPE_SEQUENCE}31m"
TEXTCOLOR_BLUE="${ESCAPE_SEQUENCE}34m"
TEXTCOLOR_MAGENTA="${ESCAPE_SEQUENCE}35m"
TEXTCOLOR_CYAN="${ESCAPE_SEQUENCE}36m"

function echoWithColor() {
    echo -e "$1$2$RESET_ALL"
}

function echoyellow() {
    echoWithColor $TEXTCOLOR_YELLOW "$1"
}
function echogreen() {
    echoWithColor $TEXTCOLOR_GREEN "$1"
}
function echored() {
    echoWithColor $TEXTCOLOR_RED "$1"
}
function echoblue() {
    echoWithColor $TEXTCOLOR_BLUE "$1"
}
function echomagenta() {
    echoWithColor $TEXTCOLOR_MAGENTA "$1"
}
function echocyan() {
    echoWithColor $TEXTCOLOR_CYAN "$1"
}

