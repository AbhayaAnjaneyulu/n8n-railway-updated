FROM alpine:3.20 AS gosu-src
RUN apk add --no-cache gosu

FROM n8nio/n8n:2.28.6

USER root

COPY --from=gosu-src /usr/bin/gosu /usr/local/bin/gosu

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]
