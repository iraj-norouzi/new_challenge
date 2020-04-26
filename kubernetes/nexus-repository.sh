  992  mkdir /some/dir/nexus-data && chown -R 200 /some/dir/nexus-data
  993  mkdir /home/nexus-data && chown -R 200 /home/nexus-data
  994  docker run -d --restart=always -p 8081:8081 --name nexus -v /home/nexus-data:/nexus-data sonatype/nexus3
  995  docker logs -f nexus
  996  cd /home/nexus-data/

