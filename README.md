gitlab-getcitoken
==========

Retrieves Gitlab-CI Token for Automated Runner Authentication

> This project is an adaptation of https://github.com/sammcj/getcitoken
> Script is bundled in docker and has been updated to work with version 8.10.5 of Gitlab

```
docker run --rm -t \
  --env GITLAB_URL="http://gitlab/" \
  --env GITLAB_USERNAME="root" \
  --env GITLAB_PASSWORD="admin" \
  --link "gitlab:gitlab" \
  -i dgarros/gitlab-getcitoken
```

Output is logged to getcitoken.log inside the container (TODO update readme to explain how to retrieve)

## Requirements
- docker

## Usage

1) update Makefile with your Environment variables
2) Run ```make run```
3) Receive token and be forever happy!
