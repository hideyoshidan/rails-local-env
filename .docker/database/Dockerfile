FROM mysql:latest

#日本語サポート用ライブラリ（locales）インストール

# 環境設定
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE rails
ENV MYSQL_USER rails
ENV MYSQL_PASSWORD rails

ENV TZ=Asia/Tokyo
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# MySQL設定ファイル
COPY .docker/database/conf.d/my.cnf /etc/mysql/conf.d/my.cnf