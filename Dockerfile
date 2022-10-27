FROM ruby:3.0.2

ARG WORKDIR

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn default-mysql-client

WORKDIR ${HOME}

COPY Gemfile* ./
RUN bundle install
COPY . ./

CMD ["rails", "server", "-b", "0.0.0.0"]
