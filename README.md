# Netspeak 4 Deployment

This project is a two-in-one.
It can be used to quickly build the Netspeak 4 server from scratch using the Dockerfile and it can be used as the basis your development process.

This project will be helpful to anyone who just wants to get the Netspeak 4 server running as well as to someone who wants to add new features to Netspeak.


## Checkout

There are 2 scripts to checkout all projects for deployment and development.

`checkout-readonly-server.sh` will checkout all projects necessary to build the server.
This will be done via deploy tokens, so you don't need to provide any credentials but you won't be able to push anything.

`checkout-dev.sh` will checkout __all__ Netspeak 4 software projects, not only projects necessary for the server.
This is useful because it will automatically create the correct project structures, so you can start writing code right a way.
You will need Webis credentials for this and you will be able to push your changes.
_Note:_ Repositories will be cloned using HTTPS.


## Build and start the Netspeak 4 server

1.  Checkout all necessary git repositories. See the above section.

1.  The `corpora` folder holds the `.properties` configuration files of all corpora the Netspeak 4 server will load when starting up.

1.  Build the docker image. <br>
    Now that all projects are checked out, you can build an image using the Dockerfile.
    Open a console at the root of this project and run the following command:

    ```bash
    docker build .
    ```

    The first time this runs, it might take a few minutes.

1.  Start a container. <br>
    You can use the `start.sh` to start a new docker container named `netspeak`. Edit the script to adjust the exposed ports and mounted volumes.
    Use the script like this: `bash start.sh <id of the built image>`.

    You can test whether the image works by navigating to [`http://localhost:3000/netspeak4-server/search?query=the+*`](http://localhost:3000/netspeak4-server/search?query=the+*) (you may be using a differnet port). For more details about the currrent Netspeak configuration go to [`http://localhost:3000/netspeak4-server/search?dashboard`](http://localhost:3000/netspeak4-server/search?dashboard).

If you want step 3 and 4 in one, you can run the `build-and-start.sh` script. This script assumes that the container `start.sh` starts is names `netspeak`. <br>
Ports and mounted volumes will be the same as specified in `start.sh`.


## Deployment

Attention: starting the container takes around 1h. So please work with caution (We still have to identify simple solutions for updates without downtime; current you may work with a different namespace and manually adopt the nginx forwarding; in case you really want to delete all running instances, use `kubectl apply --namespace webisservices delete -f netspeak-k8s.yml`). In most cases, (changing replicas, maybe changing the versions) it should be enough to run the following command:

```bash
./k8s-deploy.sh

```

### Test

Within Weimar network.

```bash
curl "http://betaweb021.medien.uni-weimar.de:32400/netspeak4-server/search?query=the+*"
```


## Version history

- 1.0.0 Initial version

We use [semantic versioning](https://semver.org/).


---

## Contributors

Michael Schmidt (2018 - 2020)

Maik Fröbe (2020)

Martin Trenkmann (2008 - 2013)

Martin Potthast (2008 - 2020)

Benno Stein (2008 - 2020)
