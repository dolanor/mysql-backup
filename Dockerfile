FROM debian

ENV RESTIC_REPOSITORY \
    MYSQL_HOST \
    MYSQL_DATABASE \
    MYSQL_USER \
    MYSQL_PASSWORD \
    BACKUP_FILENAME

RUN apt-get update \
&&  apt-get install -y mysql-client curl bash bzip2 \
&&  curl -L https://github.com/restic/restic/releases/download/v0.9.5/restic_0.9.5_linux_amd64.bz2 | bunzip2 > /usr/local/bin/restic \
&&  chmod +x /usr/local/bin/restic

WORKDIR /backup
COPY wait-for-it.sh /
COPY restic-backup.sh /
RUN chmod +x /restic-backup.sh

CMD "/restic-backup.sh"
