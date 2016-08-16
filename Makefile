
build :
		docker build -t dgarros/gitlab-getcitoken .

run:
		docker run --rm -t \
		--env GITLAB_URL="http://gitlab/" \
		--env GITLAB_USERNAME="root" \
		--env GITLAB_PASSWORD="admin" \
		--link "gitlab:gitlab" \
		-i dgarros/gitlab-getcitoken
