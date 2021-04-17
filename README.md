xfs_db-textfile-collector
======================

`bash /usr/local/bin/xfs_frag.sh /dev/sda /dev/sdb | sponge /etc/node_exporter/collector/xfs_frag.prom`

```
# HELP xfs_db_frag fragmentation in percent
# TYPE xfs_db_frag fragmentation in percent
xfs_db_frag{device="/dev/sdf"} 13.46
xfs_db_frag{device="/dev/mapper/vg_minio-lv_minio"} 0.32
```
