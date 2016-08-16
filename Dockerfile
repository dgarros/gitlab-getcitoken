FROM ruby:2.3-alpine

RUN apk --no-cache --update add \
                            build-base \
                            ruby-dev && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    gem install --no-ri --no-rdoc \
              mechanize && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY getcitoken.rb /getcitoken.rb

ENV GITLAB_URL=http://gitlab \
    GITLAB_USERNAME=root \
    GITLAB_PASSWORD=admin

CMD ruby /getcitoken.rb
