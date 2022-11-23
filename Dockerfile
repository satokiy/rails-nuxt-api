# ベースイメージの指定
FROM ruby:2.7.2-alpine

# Dockerfile内で使用する変数
ARG WORKDIR

# 環境変数
# Rails ENV["TZ"] => Azia/Tokyo
ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql git" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# ENV test（このRUN命令は確認のためなので無くても良い）
RUN echo ${HOME}

WORKDIR ${HOME}

# ホスト側のファイルをコンテナにコピー
COPY Gemfile* ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . ./

CMD ["rails", "server", "-b", "0.0.0.0"]