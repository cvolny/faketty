#!/bin/bash

( [[ -t 1 ]] && echo "terminal" || echo "redirected" ) | cat
