Vagrant.configure('2') do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id,'--memory', '2048']
  end
  config.vm.provision "shell" do |s|
    s.inline = <<-SCRIPT
    set -e

    if [ -e /.installed ]; then
      echo 'Already installed.'

    else
      echo ''
      echo 'Installing basic packages'
      echo '----------'
      # Add Google public key to apt
      wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

      # Add Google to the apt-get source list
      echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

      # Update app-get
      apt-get update

      # Install Java, Chrome, Xvfb, and unzip
      apt-get -y install imagemagick google-chrome-stable xvfb unzip sudo curl git
      apt-get clean
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
      if [ -e /usr/local/rvm/bin/rvm ]; then
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
        \\curl -sSL https://get.rvm.io | bash -s stable
        /usr/local/rvm/bin/rvm install 2.4
        /usr/local/rvm/bin/rvm 2.4 do /usr/local/rvm/bin/rvm gemset create silverspoon
        usermod -a -G rvm vagrant
      fi
      if [ -e /usr/local/bin/chromedriver ]; then
        # Download and copy the ChromeDriver to /usr/local/bin
        cd /tmp

        echo "Download latest chrome driver..."
        CHROMEDRIVER_VERSION=$(curl "http://chromedriver.storage.googleapis.com/LATEST_RELEASE")
        wget "http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
        unzip chromedriver_linux64.zip
        sudo rm chromedriver_linux64.zip
        chown vagrant:vagrant chromedriver
        mv chromedriver /usr/local/bin
      fi
      echo "Done downloading and installing basic packages"

      apt-get update
      apt-get install -y libpq-dev libffi-dev
  
      apt-get install -y postgresql
  
      su postgres -c "psql -c \\"CREATE USER vagrant WITH SUPERUSER\\""
  
      # So that running `vagrant provision` doesn't redownload everything
      touch /.installed
    fi
    SCRIPT
  end
  config.vm.provision "Xvfb", type: "shell", run: 'always' do |s|
    s.inline = <<-SCRIPT
    echo "Starting Xvfb ..."
    nohup Xvfb :10 -screen 0 1366x768x24 -ac &
    export DISPLAY=:10
    export HEADLESS=true
    SCRIPT
  end

  config.vm.synced_folder "./", "/vagrant"
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
end