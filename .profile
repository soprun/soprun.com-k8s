alias issh="ssh -t develop@soprun.com"
alias bssh="issh 'sudo su - bitnami'"
# cloud_key="~/SecurityKey/bitnami-google-publication-274603.pem"

function ssh-cloud() {
  ( ssh -t -i ${SSH_KEY_ID} "${ID_USER}@35.198.124.128" "sudo su - bitnami" $* )
}

# ssh -N -L SOURCE-PORT:127.0.0.1:DESTINATION-PORT -i KEYFILE bitnami@34.89.236.1
# ssh -N -L 8888:127.0.0.1:80 -i ${SSH_KEY_ID} develop@34.89.252.154

# ~/SecurityKey/bitnami-google-publication-274603
# ssh -i ~/SecurityKey/bitnami-google-publication-274603.pem bitnami@35.198.124.128
# /SecurityKey/bitnami-google-publication-274603.pem
# spRxvtA7ZXyX

# soprun.com www.soprun.com mail.soprun.com calendar.soprun.com drive.soprun.com

# calendar : ghs.googlehosted.com
# drive : ghs.googlehosted.com
# mail : ghs.googlehosted.com

# from

# gpg-search torbrowser@torproject.org
#function gpg-search() {
#  (gpg --keyserver ${GPG_KEY_SERVER} --search-keys $*)
#}
#
#function gpg-import() {
#  # fingerprint
#  ( curl -sSL $* | gpg --import -)
#}


curl -sIL 'https://soprun.com'