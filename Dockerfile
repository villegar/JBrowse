# The line below states we will base our new image on the Latest Official Ubuntu
FROM ubuntu:latest

# Identify the maintainer of an image
LABEL name="JBrowse" \
    author="Roberto Villegas-Diaz" \
    maintainer="Roberto.VillegasDiaz@sdstate.edu"

# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential zlib1g-dev libgd-dev libpng-dev -y
RUN apt-get install libgconf-2-4 git -y
RUN apt-get install node.js npm -y

# Install NGINX to test.
RUN apt-get install nginx -y

# Expose port 8082
EXPOSE 8082

# Download latest version from the repository
RUN git clone https://github.com/gmod/jbrowse
WORKDIR jbrowse
RUN git checkout $(git describe --tags)
RUN ./setup.sh

# Last is the actual command to start up NGINX within our Container
#CMD ["nginx", "-g", "daemon off;"]
CMD npm run start
