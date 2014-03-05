FROM thomaswelton.com:5000/ubuntu

MAINTAINER thomaswelton

# Install apache
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2

# Enable apache module actions and rewrite, fastcgi and alias are enabled on install
RUN ln -f -s /etc/apache2/mods-available/actions.load /etc/apache2/mods-enabled/actions.load
RUN ln -f -s /etc/apache2/mods-available/autoindex.load /etc/apache2/mods-enabled/autoindex.load
RUN ln -f -s /etc/apache2/mods-available/deflate.load /etc/apache2/mods-enabled/deflate.load
RUN ln -f -s /etc/apache2/mods-available/expires.load /etc/apache2/mods-enabled/expires.load
RUN ln -f -s /etc/apache2/mods-available/filter.load /etc/apache2/mods-enabled/filter.load
RUN ln -f -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load
RUN ln -f -s /etc/apache2/mods-available/include.load /etc/apache2/mods-enabled/include.load
RUN ln -f -s /etc/apache2/mods-available/mime.load /etc/apache2/mods-enabled/mime.load
RUN ln -f -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

ADD http.conf /etc/apache2/http.conf

# Expose ports
EXPOSE 80
