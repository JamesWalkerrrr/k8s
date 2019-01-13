#!/bin/bash
function startapp () 
{
  systemctl start etcd && systemctl status etcd &>/dev/null;
  case "$?" in
        0)
        echo "etcd.service start success"
        ;;
        *)
        echo "etcd.service start failed"
	;;
  esac
  sleep 3

  systemctl start docker && systemctl status docker &>/dev/null;
  case "$?" in
        0)
        echo "docker.service start success"
        ;;
        *)
        echo "docker.service start failed"
	;;
  esac
  sleep 3

 systemctl start kube-apiserver && systemctl status kube-apiserver &>/dev/null;
  case "$?" in
        0)
        echo "kube-apiserver.service start success"
        ;;
        *)
        echo "kube-apiserver.service start failed"
        ;;
  esac
  sleep 3

  systemctl start kube-controller-manager && systemctl status kube-controller-manager &>/dev/null;
  case "$?" in
        0)
        echo "kube-controller-manager.service start success"
        ;;
        *)
        echo "kube-controller-manager.service start failed"
	;;
  esac
  sleep 3

  systemctl start kube-scheduler && systemctl status kube-scheduler &>/dev/null;
  case "$?" in
        0)
        echo "kube-scheduler.service start success"
        ;;
        *)
        echo "kube-scheduler.service start failed"
	;;
  esac
  sleep 3

  systemctl start kubelet && systemctl status kubelet &>/dev/null;
  case "$?" in
        0)
        echo "kubelet.service start success"
        ;;
        *)
        echo "kubelet.service start failed"
	;;
  esac
  sleep 3

  systemctl start kube-proxy && systemctl status kube-proxy &>/dev/null;
  case "$?" in
        0)
        echo "kube-proxy.service start success"
        ;;
        *)
        echo "kube-proxy.service start failed"
	;;
  esac
  exit 0
}

function stopapp () 
{
  systemctl stop etcd;
  if [ $? -eq 0 ];then 
     echo "etcd.service stop"
  else
     echo "etcd.service stop failed"
  fi

  systemctl stop docker;
  if [ $? -eq 0 ];then
     echo "docker.service stop"
  else
     echo "docker.service stop failed"
  fi

  systemctl stop kube-apiserver;
  if [ $? -eq 0 ];then
     echo "kube-apiserver.service stop"
  else
     echo "kube-apiserver.service stop failed"
  fi

  systemctl stop kube-controller-manager;
  if [ $? -eq 0 ];then
     echo "kube-controller-manager.service stop"
  else
     echo "kube-controller-manager.service stop failed"
  fi

  systemctl stop kube-scheduler;
  if [ $? -eq 0 ];then
     echo "kube-scheduler.service stop"
  else
     echo "kube-scheduler.service stop failed"
  fi

  systemctl stop kubelet;
  if [ $? -eq 0 ];then
     echo "kubelet.service stop"
  else
     echo "kubelet.service stop failed"
  fi

  systemctl stop kube-proxy;
  if [ $? -eq 0 ];then
     echo "kube-proxy.service stop"
  else
     echo "kube-proxy.service stop failed"
  fi
}

case $1 in
        start)
                startapp
        ;;
        stop)
                stopapp
        ;;
        *)
                echo "Usage:./kube.sh start|stop"
        ;;
esac
