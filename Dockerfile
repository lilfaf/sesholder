FROM phusion/passenger-ruby22:0.9.15
MAINTAINER Seshook "admin@seshook.com"

ENV HOME /root
CMD ["/sbin/my_init"]

FROM phusion/passenger-ruby22:0.9.15
MAINTAINER Seshook "admin@seshook.com"

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install bundle of gems
RUN mkdir /home/app/webapp
COPY Gemfile* /home/app/webapp/
WORKDIR /home/app/webapp/
RUN bundle install --without test development

# Add application to image
ADD . /home/app/webapp/
# Precompile assets
RUN bundle exec rake assets:precompile assets:clean
RUN chown -R app:app /home/app/webapp

# Start nginx
EXPOSE 80
RUN rm -f /etc/service/nginx/down
RUN rm -f /etc/nginx/sites-enabled/default

COPY config/deploy/htpasswd /etc/nginx/htpasswd
COPY config/deploy/webapp.conf /etc/nginx/sites-enabled/webapp.conf
COPY config/deploy/rails-env.conf /etc/nginx/main.d/rails-env.conf

# Setup and run sidekiq
RUN useradd sidekiq
RUN chown sidekiq log/sidekiq.log
RUN mkdir /etc/service/sidekiq
COPY bin/sidekiq.sh /etc/service/sidekiq/run

# Clean up APT and bundler when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
