docker build -t docker-file-log-driver .
ID=$(docker create docker-file-log-driver true)
mkdir rootfs
docker export $ID | tar -x -C rootfs/
docker plugin create file-log-driver .
docker plugin enable file-log-driver