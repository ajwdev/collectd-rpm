#!/bin/bash

VERSION="5.2.0"
TMPDIR=$(mktemp -d /tmp/collectd-prep.XXXXX)
SRCDIR=$(pwd)

pushd $TMPDIR &>/dev/null
wget "http://collectd.org/files/collectd-$VERSION.tar.gz"
gnutar xvzf collectd-$VERSION.tar.gz

rsync -va --delete $SRCDIR/src/ $TMPDIR/collectd-$VERSION/contrib/redhat/

# Move back and create a tarball
cd $TMPDIR
gnutar cvzf $SRCDIR/collectd-$VERSION.tar.gz collectd-$VERSION 

popd &>/dev/null
echo "Done!"

