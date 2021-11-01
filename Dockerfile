FROM ruby:2.6


# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get -qq update && apt-get install -y wget ca-certificates host emacs-nox less


RUN apt-get update && apt-get install -y apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# some of ruby's build scripts are written in ruby
#   we purge system ruby later to make sure our final image uses what we just built
RUN set -ex \
	\
	&& buildDeps=' \
		bison \
		dpkg-dev \
		libgdbm-dev \
		apt-utils \
		libfontconfig1 \
		libxext6 \
		libxrender1 \
		libmagickwand-dev \
		libqt5webkit5-dev \
		qt5-qmake \
		libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
    postgresql-client \
		cmake \
		yarn \
		nodejs \
	' \
	&& apt-get -qq update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& rm -rf /var/lib/apt/lists/*

RUN gem install bundler

RUN gem install rails

WORKDIR /rails_project

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
