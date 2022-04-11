hs.execute('ssh-add $HOME/.ssh/id_rsa')
hs.execute('nohup find ~ -name ".DS_Store" -delete >/dev/null 2>&1 &')

