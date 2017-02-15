FROM mhart/alpine-node:4.7.3

EXPOSE 80

VOLUME ["/data"]

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN mkdir /home/pi && \
	cd /home/pi && \
	mkdir pimatic-app && \
	npm install pimatic --prefix pimatic-app --production
	
ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
