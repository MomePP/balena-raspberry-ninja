#!/bin/sh

udevadm control --reload

rpicam-hello --list-cameras -n -v

sleep infinity
