cd /vann/data/
mkdir -p xjtu
cd xjtu
# XJTU-SY_Bearing_Datasets/Data
# wget "https://drive.google.com/file/d/1ATvZuD6j3bPxhyR07Zm-PURmOC4b4uRn/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part01.rar
# wget "https://drive.google.com/file/d/162KvWNIpBGtd7EDWo4yP1j5XsaoNHOYU/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part02.rar
# wget "https://drive.google.com/file/d/1NvzrGW-KOSy48OZmiFxlE3TPV4CKAcw0/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part03.rar
# wget "https://drive.google.com/file/d/1VuQ5-mK11p1S2pTxUZaH_IxOwUlsmN0S/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part04.rar
# wget "https://drive.google.com/file/d/1WH4OU4MLaMGQkbh6DghxPA5Dwvsq8tEf/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part05.rar
# wget "https://drive.google.com/file/d/1wzQzQUx6-J8DuGczT81OkrkTgOUwL-I_/view?usp=sharing" -O XJTU-SY_Bearing_Datasets.part06.rar

which=1
#for f in  '1ATvZuD6j3bPxhyR07Zm-PURmOC4b4uRn' '162KvWNIpBGtd7EDWo4yP1j5XsaoNHOYU' '1NvzrGW-KOSy48OZmiFxlE3TPV4CKAcw0' '1VuQ5-mK11p1S2pTxUZaH_IxOwUlsmN0S' '1WH4OU4MLaMGQkbh6DghxPA5Dwvsq8tEf' '1wzQzQUx6-J8DuGczT81OkrkTgOUwL-I_' 
for f in  '1ATvZuD6j3bPxhyR07Zm-PURmOC4b4uRn'
do
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=${f}' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${f}" -O XJTU-SY_Bearing_Datasets.part0${which}.rar && rm -rf /tmp/cookies.txt
    which=$((which+1))
done
#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt