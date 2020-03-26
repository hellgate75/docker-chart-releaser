#!/bin/sh
PREFIX=""
if [ "" != "$(which winpty)" ]; then
	PREFIX="winpty "
fi
${PREFIX}docker run --rm -it --name chart-releaser hellgate75/docker-chart-releaser:latest $@ 2> /dev/null
