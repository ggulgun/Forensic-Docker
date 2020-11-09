#!/bin/sh
rm /data/output.*

## Collect and parse browser and user artefacts to timeline
log2timeline.py --artifact-filters BrowserHistory,BrowserCache --parser webhist --partitions all --no_vss --workers ${WORKER_NUM:-2} --buffer_size 2048M --profiling_sample_rate 10000 --status_view none /data/test/output-browser.plaso /data/*flat.vmdk &&
psort.py -o json -w /data/test/test-browser.json /data/test/output-browser.plaso "date > '2020-11-01 00:00:00' AND date < '2020-11-08 00:00:00'"

## Collect Windows artefacts first
log2timeline.py --artifact-filters WindowsEventLogs,WindowsXMLEventLogTerminalServices,WindowsFirewallLogFile,WindowsUserJumpLists,WindowsUserRecentFiles,WindowsUserRegistryFiles,WindowsAMCacheHveFile,WindowsAppCompatCache,WindowsPrefetchFiles,WindowsRecycleBin,WindowsScheduledTasks --partitions all --parser win7,winreg,esedb/srum,winjob,prefetch,olecf --no_vss --workers ${WORKER_NUM:-2} --buffer_size 2048M --profiling_sample_rate 10000 --status_view none /data/test/output-win.plaso /data/*flat.vmdk

psort.py -o l2tcsv -w /data/test/test-win.csv /data/test/output-win.plaso "date > '2020-11-01 00:00:00' AND date < '2020-11-08 00:00:00'"

## Collect and parse mft
log2timeline.py --artifact-filters NTFSMFTFiles --parser mft --partitions all --no_vss --workers ${WORKER_NUM:-2} --buffer_size 2048M --profiling_sample_rate 10000 --status_view none /data/test/output-mft.plaso /data/*flat.vmdk &&
psort.py -o l2tcsv -w /data/test/test-mft.csv /data/test/output-mft.plaso "date > '2020-11-01 00:00:00' AND date < '2020-11-08 00:00:00'"



## 