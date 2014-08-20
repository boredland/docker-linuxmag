DATADIR=/tmp/data
mkdir -p "$DATADIR/owncloud/"{config,files}
# Make sure wwwdata inside of the container can write to the volume
chown -R 30:30 "$DATADIR/owncloud/"
#fig up
fig build
