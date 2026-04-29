# Termux-login
Termux Login with Verbose boot style, with RNG 20% chance to kernel panic (not real! only force close your termux), and great for rice your Termux!

# installation

copy this to your Termux:

for Zsh :
1. curl -O https://raw.githubusercontent.com/Nully1984/Termux-login/main/booting.sh
2. chmod +x booting.sh
3. echo "source ~/booting.sh" >> ~/.zshrc
4. Find bash ~/.booting.sh, put it on top of ~/.zshrc directory

For normal user:
1. curl -O https://raw.githubusercontent.com/Nully1984/Termux-login/main/booting.sh
2. chmod +x booting.sh
3. echo "source ~/booting.sh" >> ~/.bashrc
