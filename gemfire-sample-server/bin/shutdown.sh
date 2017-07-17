#!/usr/bin/env bash

gfsh -e "connect" \
-e "shutdown --include-locators=true"

echo "shutdown command issued"


