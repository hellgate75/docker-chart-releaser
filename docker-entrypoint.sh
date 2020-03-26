#!/bin/sh
FOLDER="$(realpath "$(dirname "$0")")"
echo "Executing K8s Help Chart Releaser with arguments: $@"
cr $@
