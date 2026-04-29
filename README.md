# Termux-login
Termux Login with Verbose boot style, with RNG 20% chance to kernel panic (not real! only force close your termux), and great for rice your Termux!

# installation

copy this to your Termux (not working):

for Zsh :
1. curl -O https://github.com/nully1984/Termux-login/main/booting.sh
2. chmod +x booting.sh
3. echo "source ~/booting.sh" >> ~/.zshrc
4. Find bash ~/.booting.sh, put it on top of ~/.zshrc directory

For normal user:
1. curl -O https://github.com/nully1984/Termux-login/main/booting.sh
2. chmod +x booting.sh
3. echo "source ~/booting.sh" >> ~/.bashrc

# manual installation
1. Copy the booting.sh code
2. make directory by typing "nano ~/boot.sh"
3. paste youre code in there
4. type chmod +x booting.sh

# zsh manual
1. follow the steps like the manual installation
2. open ~/.zshrc directory
3. type source ~/booting.sh in the top of directory

i hope you enjoy! sorry if the explanation is not clear
