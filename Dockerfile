FROM alpine:latest

LABEL maintainer="LJason <ljason@ljason77.com>"

ENV TZ=Asia/Shanghai

RUN apk add -qq --no-cache --no-progress --force-refresh aria2 darkhttpd s6 tzdata --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community && \
	rm -rf /var/cache/apk/*

COPY files .

ADD https://github.com/ziahamza/webui-aria2.git /webui-aria2-master

VOLUME ["/data"]

EXPOSE 81 6800 4

CMD ["/start.sh"]
