#!/bin/bash -e

DAEMON=postgresql
SRCDIR=/var/lib/postgresql
DSTDIR=/disk2/postgresql

rsync -aSH --delete ${SRCDIR}/ ${DSTDIR}/
systemctl stop $DAEMON
mv ${SRCDIR} ${SRCDIR}.old
rsync -aSH --delete ${SRCDIR}.old/ ${DSTDIR}/
ln -s ${DSTDIR} ${SRCDIR}
systemctl start $DAEMON
systemctl status $DAEMON


