Where /opt/dumps/rib is a unpacked dump from http://archive.routeviews.org/

The ASN ENV is for the localAS

it currently always connectes to 172.17.0.1 asn 65000

# Build
```
docker build . -t gobgp
```
 
 # Run
```
docker run -v /opt/dumps/rib:/tmp/routes.dump --name gobgp -e ASN=65500 gobgp:latest
```
