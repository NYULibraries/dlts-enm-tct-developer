
echo "export PYTHONPATH=/vagrant" >> ~/.profile
echo "export DJANGO_SETTINGS_MODULE=nyu.vagrant_settings" >> ~/.profile
source ~/.profile

touch ~/.bash_aliases
echo "alias runs='django-admin runserver_plus [::]:8001'" >> ~/.bash_aliases && source ~/.bash_aliases
echo "alias shell='django-admin shell_plus'" >> ~/.bash_aliases && source ~/.bash_aliases
echo "alias mm='django-admin makemigrations'" >> ~/.bash_aliases && source ~/.bash_aliases
echo "alias migrate='django-admin migrate'" >> ~/.bash_aliases && source ~/.bash_aliases
echo "alias rs='django-admin runscript'" >> ~/.bash_aliases && source ~/.bash_aliases
echo "alias da='django-admin'" >> ~/.bash_aliases && source ~/.bash_aliases


sudo apt-get update

sudo locale-gen --purge en_US.UTF-8
sudo localectl set-locale LANG=en_US.UTF-8
echo "America/New_York" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

# Install PostgreSQl and setup database
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'password:'"
sudo -u postgres createdb otlnyu_db
sudo -u postgres psql -c "CREATE EXTENSION adminpack;"

# Install necessary libraries
sudo apt-get install -y python3-dev
sudo apt-get install -y libpq-dev
sudo apt-get install -y python3-pip
sudo pip3 install --upgrade pip

# vim settings
sudo apt-get install -y git
git clone https://github.com/MattBroach/.vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -E -s -c "source ~/.vimrc" -c PluginInstall -c qa
