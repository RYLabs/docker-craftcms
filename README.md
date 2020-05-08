# Minimal Docker setup for CraftCMS

This is a starter project for a Docker enabled CraftCMS project.

# Getting Started

Step 1: Clone this Repository

```shell
git clone https://github.com/RYLabs/docker-craftcms.git <name_of_project>
```

Step 2: Installing CraftCMS

```shell
mkdir app
docker run --rm -v $(pwd)/app:/app -t rylabs/nginx-php-fpm /bin/bash -c "composer create-project craftcms/craft ."
```

Step 3: Start a shell in the CraftCMS container

```shell
docker-compose run --rm craft /bin/bash
```

Step 4: Startup Craft w/ Nginx

```shell
docker-compose up
```

Step 5: Go through the Web Browser Setup

http://localhost:8080/admin/install