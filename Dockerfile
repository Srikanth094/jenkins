FROM ubuntu:latest
RUN sudo apt-get update \
    && sudo apt-get install -y apache2

EXPOSE 80

CMD ["apache2ctl", "-D" "FOREGROUND"]
