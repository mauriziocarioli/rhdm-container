docker rm --force rhdm
docker run --volume /Users/mcarioli/POC/Lendage/pv:/opt/kie/data \
           --publish 8080:8080 \
           --publish 8001:8001 \
           --detach \
           --name rhdm rhdm:1
