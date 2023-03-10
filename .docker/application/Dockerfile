FROM ruby:3.2.1

ENV APP /usr/src/app

RUN mkdir -p $APP

WORKDIR $APP
COPY src .

RUN bundle install
RUN gem update --system 3.4.6

COPY .docker/application/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]