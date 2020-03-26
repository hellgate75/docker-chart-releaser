<p align="center">
<img width="250" height="230" src="https://github.com/hellgate75/docker-chart-releaser/raw/master/images/helm-logo.png"></img>
</p><br/>

# Docker Chart Releaser (v. latest)

Fresh version of the chart-releaser command, easy to plug as command


References:

* [Docker Hub](https://hub.docker.com/repository/docker/hellgate75/docker-chart-releaser)

* [Git Hub](https://github.com/hellgate75/docker-cahrt-releaser)


# Build the docker images

Use script [build-docker-image.sh](/build-docker-image.sh) after you filled your data
into the environment file [docker.env](/docker.env).

Please provide copy of your ssh private and public key in the folder /root/.ssh
if you want to specify ssh access key. 

Anyway it builds, and you just to insert your github information in the environment file.


# Use the docker image

To link the image to runtime there is a multi-platform sample at
[cr.sh](/cr.sh) script file It uses the ready image under the 
[Docker Hub](https://hub.docker.com/repository/docker/hellgate75/docker-chart-releaser).

You can execute the command:

```
docker run --rm -it --name chart-releaser hellgate75/docker-chart-releaser:latest <cr aruments ...> 2> /dev/null
```


# What does it need or share?

No needs not Ports, Volumes ot anything else to share with the host machine.

It's simply the cr command build and ready to use, without any installation.

Enjoy your experience.

# License

The library is licensed with [LGPL v. 3.0](/LICENSE) clauses, with prior authorization of author before any production or commercial use. Use of this library or any extension is prohibited due to high risk of damages due to improper use. No warranty is provided for improper or unauthorized use of this library or any implementation.

Any request can be prompted to the author [Fabrizio Torelli](https://www.linkedin.com/in/fabriziotorelli) at the follwoing email address:

[hellgate75@gmail.com](mailto:hellgate75@gmail.com)




