#!/bin/sh
rm /data/output.*
log2timeline.py --artifact-filters BrowserHistory,BrowserCache --parser webhist --partitions all --no_vss --workers ${WORKER_NUM:-2} --buffer_size 2048M --profiling_sample_rate 10000 --status_view none /data/output.plaso /data/*flat.vmdk
psort.py -o l2tcsv -w /data/test.csv /data/output.plaso "date > '2020-11-01 00:00:00' AND date < '2020-11-08 00:00:00'"