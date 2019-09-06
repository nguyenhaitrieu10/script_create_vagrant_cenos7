# cd ~
# sudo yum install -y vim


# script.sh
# -----------------
sudo yum install -y wget
sudo yum install -y unzip
wget https://github.com/nguyenhaitrieu10/entry_seagroup/archive/master.zip
unzip master.zip
rm master.zip
mv entry_seagroup-master source
cd source
sudo yum install -y python

curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py --user

sudo yum groupinstall "Development Tools" -y
sudo yum install python-pip python-devel nginx gcc -y
pip install -r requirements.txt --user

sudo yum install epel-release -y
sudo yum install nginx -y
sudo cp mysite_nginx.conf /etc/nginx/conf.d/
sudo setsebool -P httpd_can_network_connect 1
sudo setenforce Permissive
sudo cp -a static/. /etc/nginx/static
# --------------------

# sudo service nginx start

#(must be at ~/source folder)
# uwsgi --socket :8001 --module mysite.wsgi  

