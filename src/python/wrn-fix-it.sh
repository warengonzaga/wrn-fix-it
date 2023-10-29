#!/bin/bash

# Colors
RED='\033[0;31m' # Red
GREEN='\033[0;32m' # Green
CYAN='\033[0;36m' # Cyan

# Variables
appname="# WRN Fix IT"
appvers="1.0.0-rc.2"
appstat="Release Candidate"
dev="# Waren Gonzaga"
divider="# ====================================="

header="${divider}\n${appname} ${appvers} ${appstat}\n${dev}\n${divider}"

if [ "$EUID" -ne 0 ];then
    printf "${RED}
${header}
#
# ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
#
# Current user permissions to execute this .bat file are inadequate.
# This .bat file must be run with administrative privileges.
# Close this program and run it as administrator.
# Contact the developer to assist you...
#
# ERROR * ERROR * ERROR * ERROR * ERROR * ERROR
#
Press any key to continue . . .
    "
    read -p ""
    exit
fi

set_default_config() {
    # Set default config
    rm /etc/resolv.conf
    if [ -f /etc/resolv.conf.bak ]; then
        mv /etc/resolv.conf.bak /etc/resolv.conf
    else
        printf "${RED}[!]${CYAN} resolv.conf not found"
    fi
}
set_google() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 8.8.8.8" > /etc/resolv.conf
    echo "nameserver 8.8.4.4" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Google DNS
${divider}
"
cat /etc/resolv.conf
}

set_cloudflare() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 1.1.1.1" > /etc/resolv.conf
    echo "nameserver 1.0.0.1" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Cloudflare DNS
${divider}
"
cat /etc/resolv.conf
}

set_freenom() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 80.80.80.80" > /etc/resolv.conf
    echo "nameserver 80.80.80.81" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Freenom DNS
${divider}
"
cat /etc/resolv.conf
}

set_comodo() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 8.26.56.26" > /etc/resolv.conf
    echo "nameserver 8.20.247.20" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Comodo Secure DNS
${divider}
"
cat /etc/resolv.conf
}

set_quad9() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 9.9.9.9" > /etc/resolv.conf
    echo "nameserver 149.112.112.112" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Quad9 DNS
${divider}
"
cat /etc/resolv.conf
}

set_verisign() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 64.6.64.6" > /etc/resolv.conf
    echo "nameserver 64.6.65.7" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to Verisign DNS
${divider}
"
cat /etc/resolv.conf
}

set_opendns() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 208.67.222.222" > /etc/resolv.conf
    echo "nameserver 208.67.220.220" >> /etc/resolv.conf
    clear
    printf "${GREEN}
    ${header}
DNS Name Servers set to Open DNS
${divider}
"
cat /etc/resolv.conf
}

set_adguard() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 94.140.14.14" > /etc/resolv.conf
    echo "nameserver 94.140.15.15" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to AdGuard DNS
${divider}
"
cat /etc/resolv.conf
}

set_adguard_family() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 94.140.14.15" > /etc/resolv.conf
    echo "nameserver 94.140.15.16" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to AdGuard Family Protection DNS
${divider}
"
cat /etc/resolv.conf
}

set_adguard_non_filter() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver 94.140.14.140" > /etc/resolv.conf
    echo "nameserver 94.140.14.141" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to AdGuard Non-Filtering DNS
${divider}
"
cat /etc/resolv.conf
}

set_custom_dns() {
    if [ -f /etc/resolv.conf ]; then
        mv /etc/resolv.conf /etc/resolv.conf.bak
    fi
    echo "nameserver $custom_dns1" > /etc/resolv.conf
    echo "nameserver $custom_dns2" >> /etc/resolv.conf
    clear
    printf "${GREEN}
${header}
DNS Name Servers set to your custom DNS
${divider}
"
cat /etc/resolv.conf
}

# $option 1
dns_settings() {
    clear
    printf "
${header}
#
# DNS Server Changer ......... [1]
# Back to Main Menu .......... [2] (enter)
#
"
    read -p "# $ WRN Fix IT> " dns_choice
    if [ $dns_choice == "1" ]; then
        dns_changer
    elif [ $dns_choice == "2" ]; then
        menu
    else
        menu
    fi
}

adguard_choice() {
    printf "
${header}
#
# Default .................... [0]
# Family Protection .......... [1]
# Non-Filtering .............. [2]
# Back to DNS Server Changer . [3] (enter)
#
"
    read -p "# $ WRN Fix IT> " adguard_choice
    if [[ $adguard_choice == "0" ]]; then
        set_adguard
    elif [[ $adguard_choice == "1" ]]; then
        set_adguard_family
    elif [[ $adguard_choice == "2" ]]; then
        set_adguard_non_filter
    elif [[ $adguard_choice == "3" ]]; then
        dns_settings
    else
        dns_settings
    fi
}

custom_dns_input() {
    clear
    printf "${GREEN}
${header}
#
# Custom DNS
# Custom DNS, Requires 2 DNS Servers
#
"
    clear
    read -p "# $ WRN Fix IT(1st DNS)>" custom_dns1
    if [[ $custom_dns1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        printf "${GREEN}
${header}
#
# DNS Server 1: $custom_dns1
# DNS Server 2:
#
"   
    else
        clear
        printf "${RED}[!] ERROR Cannot Add DNS, Please Check your DNS Server\n"
        printf "${CYAN}[!] DNS Input: ${custom_dns1}"
        sleep 5
        menu
    fi
    clear
    read -p "# $ WRN Fix IT(2nd DNS)>" custom_dns2
    if [[ $custom_dns2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        printf "${GREEN}
${header}
#
# DNS Server 1: $custom_dns1
# DNS Server 2: $custom_dns2
#
"
    else
        clear
        printf "${RED}[!] ERROR Cannot Add DNS, Please Check your DNS Server\n"
        printf "${CYAN}[!] DNS Input:  ${custom_dns2}"
        sleep 5
        menu
    fi
    set_custom_dns
}

dns_changer() {
    clear
    printf "${GREEN}
${header}
#
# Default / DHCP ............. [0]
# Google DNS ................. [1]
# Cloudflare DNS ............. [2]
# Freenome DNS ............... [3]
# Comodo DNS ................. [4]
# Quad9 DNS .................. [5]
# Verisign DNS ............... [6]
# OpenDNS .................... [7]
# AdGuard DNS ................ [8]
# Custom DNS ................. [9]
# Back ....................... [10] (enter)
#
"
    read -p "# $ WRN Fix IT>" change_dns
    if  [[ $change_dns == "0" ]]; then
        set_default_config
    elif [[ $change_dns == "1" ]]; then
        set_google
    elif [[ $change_dns == "2" ]]; then
        set_cloudflare
    elif [[ $change_dns == "3" ]]; then
        set_freenom
    elif [[ $change_dns == "4" ]]; then
        set_comodo
    elif [[ $change_dns == "5" ]]; then
        set_quad9
    elif [[ $change_dns == "6" ]]; then
        set_verisign
    elif [[ $change_dns == "7" ]]; then
        set_opendns
    elif [[ $change_dns == "8" ]]; then
        adguard_choice
    elif [[ $change_dns == "9" ]]; then
        custom_dns_input
    elif [[ $change_dns == "10" ]]; then
        dns_settings
    else
        menu
    fi
}

# $option 3
donate() {
    clear
    printf "${GREEN}
${header}
# Donate and Support
# =====================================
#
# Do you like this tool?
# Please consider to buy me a coffee or
# just donate to keep this project alive.
#
# Buy Me A Coffee ............ [1]
# PayPal ..................... [2]
# Back to Main Menu .......... [3] (enter)
#
"
    read -p "# $ WRN Fix IT> " donate_choice
    if [[ $donate_choice == "1" ]]; then
        xdg-open "https://wrngnz.ga/bmc"
    elif [[ $donate_choice == "2" ]]; then
        xdg-open "https://wrngnz.ga/paypal"
    elif [[ $donate_choice == "3" ]]; then
        menu
    else
        menu
    fi
}

menu() {
    clear
    printf "${GREEN}
${header}
# Your Linux companion toolset for fixing common issues
# =====================================
#
# Tools ...................... [1] (enter)
# Modules .................... [2] (coming soon)
# Donate ..................... [3]
# Exit ....................... [4]
#
"
    read -p "# $ WRN Fix IT> " opt
    if [[ $opt == "1" ]]; then
        dns_settings
    elif [[ $opt == "2" ]]; then
        menu
    elif [[ $opt == "3" ]]; then
        donate
    elif [[ $opt == "4" ]]; then
        exit
    else
        menu
    fi
}

# MAIN
menu
