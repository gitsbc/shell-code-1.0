#!/bin/bash
#cpu负载15分钟情况,小于0.5颜色显示为红色报警,命令uptime
ut=`uptime | awk '{if($NF<0.5){print  "CPU:\033[32m"$NF"\033[0m" }else{print  "CPU:\033[31m"$NF"\033[0m"}}'`
#网卡入站流量,命令ifconfig eth0
ife=`ifconfig eth0 | sed -n '/RX p/p' | awk '{if($5>0){print "网卡流量:\033[32m"$5"\033[0m"}else{print "网卡流量:\033[31m"$5"\033[0m"}}'`
#内存剩余量,命令free
fr=`free | awk 'NR==2{if($4>102400){print "内存剩余量:\033[32m"$4"\033[0m"}else{print "内存剩余量:\033[31m"$4"\033[0m"}}'`
#磁盘剩余量,命令df -h
df=`df | awk 'NR==2{if($4>2048000){print "磁盘剩余量:\033[32m"$4"\033[0m" }else{print "磁盘剩余量:\033[31m"$4"\033[0m"}}'`
#总账户数量
ep=`cat /etc/passwd | awk 'END{if(NR<100){print "计算机账户数量:\033[32m"NR"\033[0m"}else{print "计算机账户数量:\033[31m"NR"\033[0m"}}'`
#当前开启进程数ps -aux
pa=`ps -aux | awk 'END{if(NR<100){print "开启进程数:\033[32m"NR"\033[0m"}else{print "开启进程数:\033[31m"NR"\033[0m"}}'`
#本机已安装软件包数量
rqw=`rpm -qa | awk 'END{if(NR<1000){print "本机已安装软件包数量:\033[32m"NR"\033[0m"}else{print "本机已安装软件包数量:\033[31m"NR"\033[0m"}}'`
echo $ut
echo $ife
echo $fr
echo $df
echo $ep
echo $pa
echo $rqw
