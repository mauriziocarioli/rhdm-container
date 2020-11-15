docker rm --force rhdm-container
docker run --volume /Users/mcarioli/POC/Lendage/pv:/opt/kie/data \
           --publish 8080:8080 \
           --publish 8001:8001 \
           --detach \
           --name rhdm-container rhdm-image:1
