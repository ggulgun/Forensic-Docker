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

