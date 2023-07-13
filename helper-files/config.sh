#!/bin/bash
sudo echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAvDddkD9XXfcY+znJwSuLyYY2Yc3Zo9xaR4K3XtetsjrZLdnU
r4FFeOIM8EPvajPa/RhBNWoCAf0IukmcRhgbYsveC2JfkE5/jWo3G+KFLlkZlsMU
mhkYJ6P8nRgLyPM/r40awXL4fjZV9iFxk/xscBKwFirc4pOd/Vx5dDGZLXoZL7o+
inEHXVB9rUPcTbrvGKvhtNWGQR7pM0k/BxTeTPIqrj429DPC/Stmy57uA/s7uYuG
ias43/cBseXJgERTr2X8AJA7XhnFAMUAXIecIkY3u75zX/MjmzHLEA0zOoP0q18e
ENJtm/sWwYx8CNh/m+8Kw/xpneX1WCMz8MKrGQIDAQABAoIBAQC1qlrMl9akA5RB
KA3sPTO3V6u1yxJ+bnlU/H4xNMuac+KbttzqaUO84bLLVUcIovSDxZ1rCN7XPHvo
EpSbszj7qvqu0kya5KmIvTRj3cfebHGeary/3+jImieBGWyGkQKvVuq0PVxLtfZS
kwUlaUbhBaigPM7mgsTDfzZbSGQo1z+3dwvZl7Rlak0i/YzsJkULCNfqZ8rngYbw
Sk9q/Pi2rbAzk2cSsdLWa9EliRLfYUpv8alvD4SLdOBt5r4OEa01dCqs8vHzH8Df
gG5KsaH498vYPVCUiopOBsnS7SFypbD9BIMFoB9V7uKxtxuA0SzZE1K0dQKC+cUD
7/NL/GOBAoGBAO5ttomDajTag01cCdhg6lEkGuyucAnRYbgXUNKSs0qMRHBxdPXR
rqxENoxX3r0dKTXf12nrb/taqgP7+KyU/Zq86+pjJzOLaHQu6NFaVoBVsDnkQjut
YTVWYe8IY+nvLKo1RoUHCQj86vrRTz5OW2xEYZ+9CLVdX8jXKWSIN10dAoGBAMoW
U9uNgPRCP5Br3IuK9ejmwAU7fq+PxhG6rKG5hPMWGA5YnYDTrgXBmzy9yVoVIlde
fq9o3wzY03d/1CKALSHAxgX0cpYHIq581Z7CWI53PBAaFCgVqVfxZ+6THE1HCdT0
3BYRMCr/z4xQfKU0I9sQEI85jrGpeJNnvAoGq/EtAoGAWsyRXWEcizBEHKvWW/7c
fTYgws3TgQmqCy9l6itP+C3eymuKvSqzOItpspysCJ0YWpn6MS4mITTv1kCY/TBo
PAuCVGqaPTjz+Hr80u1yT8FSMVnKF2v5vxQ8i4lIc4hQHCnZx0Ncn32iBw66/OFe
U6be/rRAosECfzvhWZW+b8kCgYEAsWpotJfGXqrKo0AOn3Of8Jike/N/hSH0Ahyg
8lqtHbyH4hBqNm+gl+0hHHKCE1P6kjmjftvS9rRk8sSGuMNO3BMhxpiVAKHDEO0H
nhmBJZIIaRp8F7Tstwh49jqw3ic/unY9wiHU5+sti0IeK+tajzfLUfJ2FAN0l/S6
YRL6YQECgYEA6LSnIvOgLGTpHE2V3XAU1GADN1mJTGDYHZXjnB9Rvm+MLN6mYiU/
u4JGDBywQ42o9hjBegedh0FNajborZYTV66U2buVjywWEfT1SEN34wrWG5prz1CF
OjR9l3uS6r4NeEId4+RQ3U63eLam6rlVvvXKUbf9RIbZ72GCh8V8JCE=
-----END RSA PRIVATE KEY-----" > /home/ubuntu/ec2.pem
sudo chmod 400 /home/ubuntu/ec2.pem


curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl.sha256

sha256sum -c kubectl.sha256

openssl sha1 -sha256 kubectl

chmod +x ./kubectl

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

kubectl version --short --client

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install

