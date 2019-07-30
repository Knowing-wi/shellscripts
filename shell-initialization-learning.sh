#!/usr/bin/env bash
#
#Author:Knowing-wi
#usage:shell-initialization-learning
#date:2019/07/30


systemctl stop firewalld && systemctl disable firewalld
sed -ri s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
setenfore 0

echo "* * */7 * * bash /tasks/ntpSync.sh" >>/var/spool/cron/$(whoami)
cat <<-EOF >/tasks/ntpSync.ch
#!/usr/bin/env bash
#
#Author:Knowing-wi
#usage:sync system time
#date:2019/07/30


if [ ! -f /usr/bin/ntpdate ];then
    yum -y install ntpdate
    ntpdate -b ntp1.aliyun.com &
else
    ntpdate -b ntp1.aliyun.com &
fi
EOF

echo "export HISTSIZE=10000" >>/etc/profile
echo "pxport HISTTIMEFORMAT=\"%Y-%m-%d-%H-%M-%S - \"" >> /etc/profile
source /etc/profile

chattr +ai /etc/passwd /etc/shadow /etc/group
yum -y install vim bash-completion net-tppls

echo "complete! biubiubiu~"
exit 0
