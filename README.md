<p align="right">
    <img src="assets/Blue Whale Studio Cartoon Logo.png" height=400 width=400>
</p>

# Build Image from Dockerfile

code based on Fireship "Learn Docker in 7 Easy Steps - Full Beginner's Tutorial" video

Set username on dockerhub. Then use the username followed by '/' and name of image then ':' followed by version number followed by space and current working directory

```
docker build -t cmcolclough/demoapp:1.0 .
```

Then use docker push to your favorite cloud provider. Currently for me it's Google Cloud + Firebase.

# Run Locally
Add -p flag for port forwarding along with image name to run locally
Got to "http://localhost:5000/" in your browser to check.

```
docker run -p 5000:8080 docker.io/cmcolclough/demoapp:1.0
```

# Volume
To share info between containers create a volume.

## Example

Set up volume
```
docker volume create shared-stuff
```
Run containers in volume
```
docker run -d \
--mount source=shared-stuff, target=/stuff
```
^ doesn't work

# Debug
use Docker Desktop or docker exec command to go into container

# 1 Process per container

Use docker compose to run multiple containers and volume to keep their memory shared.

Make a 'docker-compose.yml' file in the root of our project.
'services:' tag will have each service type like web and database, with build, port values, volume storage location, etc

Then to run
```
docker-compose up 
```
