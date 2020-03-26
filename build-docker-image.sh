#!/bin/sh
FOLDER="$(realpath "$(dirname "$0")")"
VARRGS=""
ENV_FILE="$FOLDER/docker.env"
if [ "" != "${DEFAULT_ENV_FILE}" ]; then
        ENV_FILE="${DEFAULT_ENV_FILE}"
fi
echo "USing environment file: $ENV_FILE"
if [ "" != "$(which dos2unix)" ]; then
	dos2unix $ENV_FILE
	dos2unix install-app.sh
	dos2unix docker-entrypoint.sh
fi
TAG="latest"
if [ -e ${ENV_FILE} ]; then
	cat ${ENV_FILE}
	if [ "" !=  "$GO_RELEASER_VERSION" ]; then
		TAG="$GO_RELEASER_VERSION"
	fi
	for argument in $(cat "${ENV_FILE}"); do
		if [ "" != "$(echo $argument|awk 'BEGIN {FS=OFS="="}{print $2}')" ]; then
			VARRGS="$VARRGS --build-arg $argument"
		fi
	done
fi
echo "Using arguments: <$VARRGS>"
if [ "" != "$(docker image ls|awk 'BEGIN {FS=OFS=" "}{print $1":"$2}'| grep 'hellgate75'| grep "docker-chart-releaser:${TAG}")" ]; then
	echo "Removing existing docker image -> ${TAG} ..."
	docker rmi -f hellgate75/docker-chart-releaser:${TAG}
fi
echo "Building docker-chart-releaser v. ${TAG}"
docker build --rm --force-rm --no-cache $VARRGS -t hellgate75/docker-chart-releaser:${TAG} .
