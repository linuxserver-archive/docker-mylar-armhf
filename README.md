[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# lsioarmhf/mylar
[![](https://images.microbadger.com/badges/image/lsioarmhf/mylar.svg)](https://microbadger.com/images/lsioarmhf/mylar "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/lsioarmhf/mylar.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/lsioarmhf/mylar.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io-armhf/lsioarmhf-mylar)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io-armhf/job/lsioarmhf-mylar/)
[hub]: https://hub.docker.com/r/lsioarmhf/mylar/


An automated Comic Book downloader (cbr/cbz) for use with SABnzbd, NZBGet and torrents. [mylar](https://github.com/evilhero/mylar)

[![mylar](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/mylar-icon.png)][mylarurl]
[mylarurl]: https://github.com/evilhero/mylar

## Usage

```
docker create \
    --name=mylar \
    -v <path to data>:/config \
    -v <downloads-folder>:/downloads \
    -v <comics-folder>:/comics \
    -e PGID=<gid> -e PUID=<uid> \
    -e TZ=<timezone> \
    -p 8090:8090 \
    lsioarmhf/mylar
```

**Parameters**

* `-p 8090` - the port(s)
* `-v /config` - where mylar should store config files
* `-v /downloads` - map to your downloads folder
* `-v /comics` - map to your comics folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for setting timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it mylar /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application
`IMPORTANT... THIS IS THE ARMHF VERSION`

The web ui for settings etc, is on `<your-ip>:8090`
For more detailed setup refer [mylar](https://github.com/evilhero/mylar).

## Info

* To monitor the logs of the container in realtime `docker logs -f mylar`.

## Versions

+ **23.09.16:** Initial Release.
