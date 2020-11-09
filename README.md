# Docker Forensic

## Sample Run

Enter tool directory

```
cd bulkextractor
```

Build Docker Image

```
docker build -t bulkextractor .
```

Run Docker Image

```
docker run --name bulkextractor -d -v "Shared Directory":/out bulkextractor
```

## To run plaso
```
cd plaso
docker build -t plaso2la
docker run -ti -v <image file location>/:/data/ plaso2la
```
NOTE:
1. entrypoint.sh is looking for vmdk files at the moment
2. The psort timeframe needs to be adjusted in entrypoint.sh before running