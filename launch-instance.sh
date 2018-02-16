echo "Hello, Dave!"
# jq help: https://gist.github.com/rhelmer/a49cc673ad20a1e7fb56, https://jqplay.org/
# Get instance IP address or hostname and set it to variable
pemfile=~/security/aws-ssh-key.pem
user=ec2-user
myip=$(curl -s ipinfo.io/ip)
# TODO: Start Instance
# Get Public IP of instance
host=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=test-linux" | \
jq --raw-output '.Reservations[0].Instances[0].PublicIpAddress')
# Get allowed inbound IP address source for SG
sgip=$(aws ec2 describe-security-groups --filters "Name=tag:Name,Values=home-pc" | \
jq --raw-output '.SecurityGroups[0].IpPermissions[0].IpRanges[0].CidrIp')
echo "Connecting to "$host" from "$myip
echo "Checking security group"
# Check to make sure my IP address is already configured in the security group
if [ $myip/32 == $sgip ]
then
 echo "You may enter!"
else
 echo "Denied!"
 # TODO: Update SG
fi
# Connect to instance via SSH
# ${variblename} means that only what's in curly braces gets replaced
ssh -i $pemfile ${user}@$host
# TODO: Stop Instance
echo "Goodbye!"