FROM debian:latest

RUN chmod g=u /etc/passwd && apt update && apt upgrade -y && apt install -y transmission-daemon && rm -rf /var/lib/apt /var/cache/apt

COPY entrypoint.sh /
COPY entrypoint.d/ /entrypoint.d

# Some "Random" UID
USER 4242:0

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "transmission-daemon", "--foreground", "--logfile", "/dev/stdout" ]
