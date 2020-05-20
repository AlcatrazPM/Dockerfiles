# syntax=docker/dockerfile:1.0-experimental
FROM debian:stretch-slim AS build-env

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt apt-get update && apt-get install -y curl git wget zip unzip gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter channel master
RUN /usr/local/flutter/bin/flutter upgrade
RUN /usr/local/flutter/bin/flutter config --enable-web

RUN mkdir /usr/src/alcatraz
WORKDIR /usr/src/alcatraz
COPY frontend .
RUN flutter pub get
RUN /usr/local/flutter/bin/flutter pub run build_runner build --delete-conflicting-outputs
RUN /usr/local/flutter/bin/flutter build web
# RUN --mount=type=cache,target=./build/web cp -r ./build/web /tmp/alcatraz_frontend/

FROM nginx
COPY --from=build-env /usr/src/alcatraz/build/web /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/
