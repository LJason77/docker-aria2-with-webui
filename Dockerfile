FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

ENV TZ=Asia/Shanghai

ADD https://github.com/ziahamza/webui-aria2/archive/master.zip .

RUN apk add -qq --no-cache --no-progress --force-refresh aria2 darkhttpd s6 tzdata && \
	unzip -qq master.zip && \
	rm -rf /var/cache/apk/* master.zip

COPY files .

VOLUME ["/data"]

EXPOSE 81 6800 4

CMD ["/start.sh"]
