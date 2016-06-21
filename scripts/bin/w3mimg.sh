#!/bin/sh

wget --output-document=/tmp/img.jpg $1 2>&1 && meh /tmp/img.jpg && rm /tmp/img.jpg

