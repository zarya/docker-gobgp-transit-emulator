#exec /root/gobgp/gobgpd -f /root/gobgp/gobgpd.conf &
#exec sed -e 's/ASN/'"$ASN"'/g' /root/gobgp/gobgpd.conf
exec /root/gobgp/setup.sh &
exec /root/gobgp/startup.sh 
