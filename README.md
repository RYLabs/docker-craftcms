# Minimal Docker setup for CraftCMS

This is a starter project for a Docker enabled CraftCMS project.

# Getting Started

Step 1: Clone this Repository

Step 2: Installing CraftCMS

```shell
mkdir app
docker run --rm -v $(pwd)/app:/app -t rylabs/nginx-php-fpm /bin/bash -c "composer create-project craftcms/craft ."
```

Step 3: Start a shell in the CraftCMS container

```shell
docker-compose run --rm craft /bin/bash
```

Step 4: In the container shell, Continue with setting up Craft

```shell
# you should only need to setup the security key, everything else
# should be done for you.
craft setup/security-key

# exit the container shell
exit
```

Step 5: Startup Craft w/ Nginx

```shell
docker-compose up
```
