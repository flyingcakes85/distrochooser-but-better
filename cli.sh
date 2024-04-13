#!/bin/bash   
#THIS SCRIPT IS LICENSED UNDER GPLV2.0 BY ÁLVARO CASTILLO <SINCORCHETES <AT> GMAIL <DOT> COM>

echo "Welcome to Distro Chooser, download your custom ISO"

############## ARCHLINUX #######################################################
ARCHLINUX_MIRROR="http://ftp.rediris.es/mirror/archlinux/iso/latest/"
ARCHLINUX_FILES=(
archlinux-2018.09.01-x86_64.iso
)

############## ARCHLINUX EOF ###################################################
############## DEBIAN ##########################################################
DEBIAN_STABLE_MIRROR="https://cdimage.debian.org/debian-cd/current/"
DEBIAN_TESTING_MIRROR="https://cdimage.debian.org/cdimage/weekly-builds/"
DEBIAN_STABLE_FILES=(
debian-9.5.0-i386-netinst.iso
debian-9.5.0-i386-xfce-CD-1.iso
debian-9.5.0-amd64-i386-netinst.iso
debian-9.5.0-amd64-netinst.iso
debian-9.5.0-amd64-xfce-CD-1.iso
)
DEBIAN_TESTING_FILES=(
debian-testing-i386-netinst.iso
debian-testing-i386-xfce-CD-1.iso
debian-testing-amd64-i386-netinst.iso
debian-testing-amd64-netinst.iso
debian-testing-amd64-xfce-CD-1.iso
)

############## DEBIAN EOF ##########################################################
############## CENTOS ### ##########################################################
CENTOS_VERSION=(DVD Everything Minimal LiveGNOME LiveKDE)
CENTOS_MIRROR="http://mirror.tedra.es/CentOS/7/isos/${ARCHi}/"
CENTOS_FILES=(
CentOS-7-x86_64-DVD-1804.iso
CentOS-7-x86_64-Everything-1804.iso
CentOS-7-x86_64-LiveGNOME-1804.iso
CentOS-7-x86_64-LiveKDE-1804.iso
CentOS-7-x86_64-Minimal-1804.iso
)
############## CENTOS EOF ##########################################################
############## FEDORA ##############################################################
FEDORA_VERSION=(Workstation Server)
FEDORA_MIRROR="https://download.fedoraproject.org/pub/fedora/linux/releases/28"
FEDORA_FILES=(
Fedora-Workstation-Live-x86_64-28-1.1.iso
Fedora-Workstation-netinst-x86_64-28-1.1.iso
Fedora-Server-dvd-x86_64-28-1.1.iso
Fedora-Server-netinst-x86_64-28-1.1.iso
)

############## FEDORA EOF ##########################################################
############## OPENSUSE ############################################################
OPENSUSE_MIRRORS=(
"https://download.opensuse.org/tumbleweed/iso/"
"https://download.opensuse.org/distribution/leap/15.0/iso/"
)

OPENSUSE_FILES=(
openSUSE-Tumbleweed-DVD-i586-Current.iso
openSUSE-Tumbleweed-NET-i586-Current.iso
openSUSE-Tumbleweed-DVD-x86_64-Current.iso
openSUSE-Tumbleweed-NET-x86_64-Current.iso
openSUSE-Leap-15.0-DVD-x86_64.iso
openSUSE-Leap-15.0-NET-x86_64.iso
)
############## OPENSUSE EOF #########################################################
############## UBUNTU ###############################################################
UBUNTU_MIRROR="ftp://ftp.rediris.es/sites/releases.ubuntu.com/releases/18.04.1/"
UBUNTU_FILES=(
ubuntu-18.04.1-desktop-amd64.iso
ubuntu-18.04.1-live-server-amd64.iso
)
############## UBUNTU EOF ############################################################

if [ -d "iso" ]; then echo "Created"; else mkdir iso && echo "Created"; fi
ARCHi=(i386 i586 i686 x86 amd64 x86_64 multi-arch)

echo "
1) Archlinux's World
2) CentOS's World
3) Debian's World
4) Fedora's World
5) openSUSE's World
6) Ubuntu's World
"

read -p "Choose your option: " OP1

case $OP1 in
############################################# FIRST CASE ############################
	1)
		wget -c $ARCHLINUX_MIRROR/${ARCHLINUX_FILES[0]} -P iso	
	;;

	2)
		echo ""
		echo "Choose CentOS Version"
		echo "1) Minimal"
		echo "2) DVD"
		echo "3) Everything"
		echo "4) LiveGNOME"
		echo "5) LiveKDE"

		read -p "Version: " OP2
############################################# SECOND CASE #########################
		case $OP2 in
			1)
				wget -c $CENTOS_MIRROR/${ARCHi[5]}/${CENTOS_FILES[4]} -P iso
				;;
			2)
				wget -c $CENTOS_MIRROR/${ARCHi[5]}/${CENTOS_FILES[0]} -P iso
				        ;;
			3)
				wget -c	$CENTOS_MIRROR/${ARCHi[5]}/${CENTOS_FILES[1]} -P iso
				        ;;
			4)
				wget -c	$CENTOS_MIRROR/${ARCHi[5]}/${CENTOS_FILES[2]} -P iso
				        ;;
			5)
				wget -c	$CENTOS_MIRROR/${ARCHi[5]}/${CENTOS_FILES[3]} -P iso
				        ;;
		esac
############################################# END SECOND CASE ######################
	;;

	3)
		echo ""
	  	echo "Choose Debian Version"
		echo "1) Stable (Recommended for Servers)"
		echo "2) Testing (Recommended for Desktop Users)"
		echo ""
		read -p "Version: " OP2
############################################# SECOND CASE #########################
		    case $OP2 in
				1)
					echo ""
					echo "1) Network Installer i386 (32 bits)"
					echo "2) XFCE i386 (32 bits)"
					echo "3) Network Installer Multi-Arch (64bits)"
					echo "4) Network Installer AMD64T (64 bits)"
					echo "5) XFCE AMD64T (64 bits)"
					echo ""
					read -p "Edition: " OP3
############################################### THIRD CASE #########################
					case $OP3 in
						1)
						  		wget -c $DEBIAN_STABLE_MIRROR/${ARCHi[0]}/iso-cd/${DEBIAN_STABLE_FILES[0]} -P iso
									;;
						2)
								wget -c $DEBIAN_STABLE_MIRROR/${ARCHi[0]}/iso-cd/${DEBIAN_STABLE_FILES[1]} -P iso
								    ;;
						3)
								wget -c $DEBIAN_STABLE_MIRROR/${ARCHi[6]}/iso-cd/${DEBIAN_STABLE_FILES[2]} -P iso
								    ;;
						4)
						  		wget -c $DEBIAN_STABLE_MIRROR/${ARCHi[4]}/iso-cd/${DEBIAN_STABLE_FILES[3]} -P iso
								    ;;
						5)
								wget -c $DEBIAN_STABLE_MIRROR/${ARCHi[4]}/iso-cd/${DEBIAN_STABLE_FILES[4]} -P iso
								    ;;
					esac
				;;
############################################# END THIRD CASE ######################

		 		2)
					echo "1) Network Installer i386 (32 bits)"
					echo "2) XFCE i386 (32 bits)"
					echo "3) Network Installer AMD64T (64 bits)"
					echo "4) XFCE AMD64T (64 bits)"
					echo ""
					read -p "Edition: " OP3
############################################# THIRD CASE #########################
				    case $OP3 in
				        1)
				          	wget -c $DEBIAN_TESTING_MIRROR/${ARCHi[0]}/iso-cd/${DEBIAN_TESTING_FILES[0]} -P iso
				                ;;
				        2)
				          	wget -c $DEBIAN_TESTING_MIRROR/${ARCHi[0]}/iso-cd/${DEBIAN_TESTING_FILES[1]} -P iso
				                ;;
						3)
								wget -c $DEBIAN_TESTING_MIRROR/${ARCHi[6]}/iso-cd/${DEBIAN_TESTING_FILES[2]} -P iso
								    ;;
				        4)
				          	wget -c $DEBIAN_TESTING_MIRROR/${ARCHi[4]}/iso-cd/${DEBIAN_TESTING_FILES[3]} -P iso
				                ;;
				        5)
				               	wget -c $DEBIAN_TESTING_MIRROR/${ARCHi[4]}/iso-cd/${DEBIAN_TESTING_FILES[4]} -P iso
			   	                ;;
############################################# END THIRD CASE #########################
		        	esac
				;;
			esac
############################################# END SECOND CASE ######################
	;;
	
	4)
		echo ""
		echo "Choose Fedora Version"
		echo "1) Workstation Network Installer (WNI)"
		echo "2) Workstation Live Edition (WLE)"
		echo "3) Server Live Edition (SLE)"
		echo "4) Server Live Edition (SLE)"
		echo ""
			
		read -p "Version: " OP2
############################################# SECOND CASE #########################
		case $OP2 in
			1)
				wget -c $FEDORA_MIRROR/${FEDORA_VERSION[0]}/${ARCHi[5]}/iso/${FEDORA_FILES[1]} -P iso
				;;
			2)
				wget -c $FEDORA_MIRROR/${FEDORA_VERSION[0]}/${ARCHi[5]}/iso/${FEDORA_FILES[0]} -P iso
				;;
			3)
				wget -c $FEDORA_MIRROR/${FEDORA_VERSION[1]}/${ARCHi[5]}/iso/${FEDORA_FILES[2]} -P iso
				;;
			4)
				wget -c $FEDORA_MIRROR/${FEDORA_VERSION[1]}/${ARCHi[5]}/iso/${FEDORA_FILES[3]} -P iso
				;;
		esac
############################################# END SECOND CASE ######################
	;;

	5)
		echo ""
	  	echo "Choose openSUSE Version"
		echo "1) Tumbleweed (Recommended for Desktop Users)"
		echo "2) Leap (Recommended for Server & Trust Desktop Users)"
		echo ""
		read -p "Version: " OP2
############################################# SECOND CASE #########################
		    case $OP2 in
				1)
					echo "1) Network Installer i586 (32 bits)"
					echo "2) DVD i586 (32 bits)"
					echo "3) Network Installer x86_64 (64 bits)"
					echo "4) DVD x86_64 (64 bits)"
					echo ""
					read -p "Edition: " OP3
############################################### THIRD CASE #########################
					case $OP3 in
						1)
						  		wget -c ${OPENSUSE_MIRRORS[0]}/${OPENSUSE_FILES[1]} -P iso
									;;
						2)
								wget -c ${OPENSUSE_MIRRORS[0]}/${OPENSUSE_FILES[0]} -P iso
								    ;;
						3)
								wget -c ${OPENSUSE_MIRRORS[0]}/${OPENSUSE_FILES[3]} -P iso
								    ;;
						4)
						  		wget -c ${OPENSUSE_MIRRORS[0]}/${OPENSUSE_FILES[2]} -P iso
								    ;;
		
					esac
				;;
############################################# END THIRD CASE ######################

		 		2)
					echo ""
					echo "1) Network Installer x86_64 (64 bits)"
					echo "2) DVD x86_64 (64 bits)"
					read -p "Edition: " OP3
############################################# THIRD CASE #########################
				    case $OP3 in
				        1)
						  		wget -c ${OPENSUSE_MIRRORS[1]}/${OPENSUSE_FILES[5]} -P iso
									;;
						2)
								wget -c ${OPENSUSE_MIRRORS[1]}/${OPENSUSE_FILES[4]} -P iso
								    ;;
############################################# END THIRD CASE #########################
		        	esac
				;;
			esac
############################################# END SECOND CASE ######################
	;;

	6)
		echo ""
		echo "Choose Ubuntu Version"
		echo "1) Desktop AMD64T (64 bits)"
		echo "2) Live Server AMD64T (64 bits)"

		read -p "Version: " OP2
############################################# SECOND CASE #########################
		case $OP2 in
			1)
				wget -c $UBUNTU_MIRROR/${UBUNTU_FILES[0]} -P iso
				;;
			2)
				wget -c $UBUNTU_MIRROR/${UBUNTU_FILES[1]} -P iso
				        ;;
		esac
############################################# END SECOND CASE ######################
	;;


esac
