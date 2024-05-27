# ansible 
test -z $(which ansible-playbook) && sudo apt install -y ansible

# カーネルがアップグレードされた時の警告画面を表示しないようにする
ansible-playbook 00-needrestart.yml --connection=local

# update
sudo apt -y update
sudo apt -y upgrade

# 日本語化
sudo locale-gen ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:
sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:

# タイムゾーンの変更
sudo timedatectl set-timezone Asia/Tokyo

# man ページの日本語化
sudo apt install -y manpages-ja manpages-ja-dev

# apt での表示の日本語化
sudo LANG=ja_JP.UTF-8 apt update

# Docker
sudo mkdir -p /etc/apt/keyrings/
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# プロンプトを短く
sed -i s/\\\\u@\\\\h\\\\\\[\\\\033\\[00m\\\\\\]:\\\\\\[\\\\033\\[01\;34m\\\\\\]\\\\w/\\\\u@\\\\h\ \\\\[\\\\033[01\;34m\\\\]\\\\W\ / ~/.bashrc
sed -i s/\\\\u@\\\\h:\\\\w\\\\/\\\\u@\\\\h\ \\\\W\\\\\ / ~/.bashrc
