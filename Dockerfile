# The line below states we will base our new image on the Latest Official Ubuntu
FROM ubuntu:latest

# Identify the maintainer of an image
LABEL name="JBrowse" \
    author="Roberto Villegas-Diaz" \
    maintainer="Roberto.VillegasDiaz@sdstate.edu"

# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential zlib1g-dev -y
RUN apt-get install curl zip libgconf-2-4 git -y
RUN apt-get install libgconf-2-4 -y

# Install NGINX to test.
RUN apt-get install nginx -y

# Expose port 80
EXPOSE 80

# Download latest version from the repository
RUN git clone https://github.com/gmod/jbrowse
RUN cd jbrowse
RUN git checkout $(git describe --tags)
RUN ./setup.sh

RUN mkdir -p /var/www/html/
RUN mkdir -p /usr/share/nginx/html/
RUN ln -sf ../jbrowse /var/www/html/jbrowse
RUN ln -sf ../jbrowse /usr/share/nginx/html/

# Last is the actual command to start up NGINX within our Container
CMD ["nginx", "-g", "daemon off;"]
