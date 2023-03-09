FROM ruby:3.2.1

ENV APP /usr/src/app

RUN mkdir -p $APP

WORKDIR $APP
RUN ls -al
COPY src .
RUN ls -al

RUN bundle install
RUN gem update --system 3.4.6

COPY .docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]