#!/bin/sh
FOLDER="$(realpath "$(dirname "$0")")"

echo "Installing packages ..."
apt-get update &&\
apt-get install -y vim curl &&\
apt-get autoremove &&\
rm -rf /var/lib/apt/lists/*

if [ "" = "${RELEASER_VERSION}" ]; then
	RELEASER_VERSION="$(curl -sL https://github.com/helm/chart-releaser/releases| grep '<a href="/helm/chart-releaser/releases/tag/'|awk 'BEGIN {FS=OFS=">"}{print $2}'|awk 'BEGIN {FS=OFS="<"}{print $1}'|awk 'BEGIN {FS=OFS="v"}{print $2}'|head -1)"
fi
echo "Installing K8s Help Chart Releaser v. $RELEASER_VERSION"
curl -sL https://github.com/helm/chart-releaser/releases/download/v${RELEASER_VERSION}/chart-releaser_${RELEASER_VERSION}_linux_amd64.tar.gz -o /root/chart-releaser.tar.gz
mkdir /usr/share/cr
tar -xzvf /root/chart-releaser.tar.gz -C /usr/share/cr
ln -s /usr/share/cr/cr /usr/bin/cr
chmod +x /usr/share/cr/cr