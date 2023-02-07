#!/bin/ash
set -eo pipefail

cp -R /mnt/testlink/* /var/testlink/
rm -rf /mnt/testlink
chown -R nobody:nobody /var/testlink/

tail -f /dev/null
