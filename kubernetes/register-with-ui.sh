docker network create registry-ui-net
docker run -d -p 5000:5000 --net registry-ui-net -v /mnt/registry:/var/lib/registry --name registry-srv registry:2
docker run -d --net registry-ui-net -p 80:80 -e REGISTRY_URL=http://registry-srv:5000 -e DELETE_IMAGES=true -e REGISTRY_TITLE="My registry" joxit/docker-registry-ui:static
