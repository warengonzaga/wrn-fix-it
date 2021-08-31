from os import system, name
import sys

appname = "WRN Fix IT"
appvers = "1.0.0-rc.2"
appstat = "Release Candidate"
dev = "Waren Gonzaga"
desc = "Your companion toolset for fixing common issues"
divider = "======================================"

def t001_1(t001_d0 = 1, t001_d1 = None, t001_d2 = None):
    pass

def t001():
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print( "#")
    print( "# Default / DHCP ............. [0]")
    print( "# Google DNS ................. [1]")
    print( "# Cloudflare DNS ............. [2]")
    print( "# Freenome DNS ............... [3]")
    print( "# Comodo DNS ................. [4]")
    print( "# Quad9 DNS .................. [5]")
    print( "# Verisign DNS ............... [6]")
    print( "# OpenDNS .................... [7]")
    print( "# Back ....................... [8] (enter)")
    print( "#")

    while True:
        user_input = input("t001_option=# > ")

        if user_input == "0":
            # Default / DHCP
            t001_d0 = "1"
            t001_1()
            break
        elif user_input == "1":
            # Google Public DNS
            t001_d0 = "0"
            t001_d1 = "8.8.8.8"
            t001_d2 = "8.8.4.4"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "2":
            # Cloudflare DNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "3":
            # Freenom DNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "4":
            # Comodo Secure DNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "5":
            # Quad9 DNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "6":
            # Verisign DNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "7":
            # OpenDNS
            t001_d0 = "0"
            t001_d1 = ""
            t001_d2 = ""
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "8":
            tools_menu()
            break
        else:
            print("Invalid input. Please try again.")
            continue


def tools_menu():

    # Terminal command for clearing screen varies depending
    # on the operating system
    if name == "nt":
        system("cls")
    else:
        system("clear")

    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print( "#")
    print( "# DNS Server Changer ......... [1]")
    print( "# Back to Main Menu .......... [2] (enter)")
    print( "#")

    while True:
        user_input = input("toolsMenu=# > ")

        if user_input == "1":
            t001()
            break
        elif user_input == "2":
            main_menu()
            break
        else:
            print("Invalid input. Please try again.")
            continue

def modules_menu():
    # TODO: Modules menu
    pass

def donate():
    # TODO: Donate menu
    pass

def main_menu():
    # TODO: Add color to terminal outputs with Colorama

    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# {desc}")
    print(f"# {divider}")
    print( "#")
    print( "# Tools ...................... [1] (enter)")
    print( "# Modules .................... [2] (coming soon)")
    print( "# Donate ..................... [3]")
    print( "# Exit ....................... [4]")
    print( "#")

    while True:
        user_input = input("mainMenu=# > ")
    
        if user_input == "1":
            tools_menu()
            break
        elif user_input == "2":
            modules_menu()
            break
        elif user_input == "3":
            donate()
            break
        elif user_input == "4":
            sys.exit()
        else:
            print("Invalid input. Please try again.")
            continue

def main():
    main_menu()

if __name__ == '__main__':
    main()
