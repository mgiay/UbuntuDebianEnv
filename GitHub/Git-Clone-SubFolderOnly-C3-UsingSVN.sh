#13:57 2020.12.14
#Git-Clone-SubFolderOnly-C3-UsingSVN.sh
#REF: https://coderwall.com/p/o2fasg/how-to-download-a-project-subdirectory-from-github
sudo apt-get install subversion

#REPO: 
#FULL: 
#https://github.com/mgiay/UbuntuDebianEnv.git
#https://github.com/mgiay/UbuntuDebianEnv/

#SUB : https://github.com/mgiay/UbuntuDebianEnv/tree/main/HaProxy/HaProxy-2.2.6

GITHUB_USERNAME="mgiay"
GITHUB_PROJECT="UbuntuDebianEnv"
GITHUB_SUB_FLD="HaProxy/HaProxy-2.2.6"
DEST_LOCAL="HaProxy-2.2.6"
#LISTING: svn ls https://github.com/$GITHUB_USERNAME/$GITHUB_PROJECT
#DOWNLOADING: 
svn export https://github.com/$GITHUB_USERNAME/$GITHUB_PROJECT/trunk/$GITHUB_SUB_FLD $DEST_LOCAL
#