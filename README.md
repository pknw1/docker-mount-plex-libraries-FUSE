Mounts all plex servers you have access to as local filesystems so that you can download/copy files.

See `config.example.json` for configuration options. Each of these options can either be set in `config.json` or passed as long parameters through stdin, e.g. `--mountPath /some/path`. If no plex token is set one will be retrieved on next run.


from https://github.com/drkno/pfs

** DRAFT **
* Dockerfile 
* Dependencies
* Runtime issues resolved
* docker-compose 

*TODO

* non root mount
* unmount on down
* tidy up
* versions update

```
docker@:~/dev/pfs$ docker-compose up -d
Creating plex-mount ... done
Attaching to plex-mount

docker@:~/dev/pfs$ sudo ls mount/
plex

docker@:~/dev/pfs$ sudo ls -la mount/plex/
total 0
dr--r--r-- 1 docker docker 4096 Aug 14 19:23  Movies
dr--r--r-- 1 docker docker 4096 Aug 19 12:20  Music
dr--r--r-- 1 docker docker 4096 Aug 27 01:53 'TV shows'

```
