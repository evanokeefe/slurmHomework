#!/bin/bash

cat out/out*.csv | sort -n | head -1 > out/out
