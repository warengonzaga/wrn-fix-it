from os import system, name
import sys
import ctypes

appname = "WRN Fix IT"
appvers = "1.0.0-rc.2"
appstat = "Release Candidate"
dev = "Waren Gonzaga"
desc = "Your companion toolset for fixing common issues"
divider = "======================================"


def clear():
    """Clear the screen.

    Terminal command for clearing screen varies depending
    on the operating system"""
    if name == "nt":
        system("cls")
    else:
        system("clear")


def err3():
    """Error when network doesn't exit"""
    clear()
    print("Error 3")
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# The selected network doesn't exist!")
    print(f"# Keep in mind that the network names are case sensitive.")
    print(f"# {divider}")
    print(f"#")
    print(f"# Press enter to continue...")
    input()
    main_menu()


def t001_1_windows(t001_d0, t001_d1, t001_d2):
    """Change DNS servers on Windows
    """

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# Select the network you want to change the DNS server of.")
    print(f"# Note: Interface names are case-sensitive.")
    print(f"# {divider}")
    system("netsh interface ip show config")
    print(f"# {divider}")
    print(f"#")
    t001_2_option = input("t001_2_option= > ")
    print(f"#")
    print(f"# Updating ...")
    errorlevel = system(f'netsh interface ip set dnsservers "{t001_2_option}" dhcp')

    if errorlevel != 1:
        if t001_d0 == "0":
            system(f'netsh interface ip set dnsservers "{t001_2_option}" static {t001_d1} primary')
            system(f'netsh interface ip add dnsservers "{t001_2_option}" {t001_d2} index=2')
    else:
        err3()

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"#")
    print(f"# DNS server successfully changed!")
    print(f"#")
    print(f"# {divider}")
    print(f"#")
    print(f"# Press enter to continue...")
    input()

    tools_menu()


def t001_1_linux(t001_d0, t001_d1, t001_d2):
    """Change DNS servers on Linux
    """

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# Updating DNS servers..")
    print(f"#")

    # Check if resolv.conf.bak exists
    backup_exists = system("[ -f /etc/resolv.conf.bak ]") == 0

    # Default config
    if t001_d0 == "1":
        if backup_exists:
            system("mv /etc/resolv.conf.bak /etc/resolv.conf")
            print("# DNS server successfully changed!")
        else:
            print("# [!] Backup file for resolv.conf not found. This is probably because you haven't changed your DNS servers yet with this tool, or you are currently using your default domain.")

    # Other DNS configs
    else:
        if not backup_exists:
            system("mv /etc/resolv.conf /etc/resolv.conf.bak")

        system(f'echo "nameserver {t001_d1}" > /etc/resolv.conf')
        system(f'echo "nameserver {t001_d2}" >> /etc/resolv.conf')
        print(f"# DNS server successfully changed!")

    print(f"#")
    print(f"# {divider}")
    print(f"#")
    print(f"# Press enter to continue...")
    input()

    tools_menu()


def t001_1(t001_d0 = "1", t001_d1 = None, t001_d2 = None):
    """Redirect to the Windows, macOS or Linux DNS changer."""

    # TODO: Implement macOS support

    # Different function for windows and linux
    if name == "nt":
        t001_1_windows(t001_d0, t001_d1, t001_d2)
    else:
        t001_1_linux(t001_d0, t001_d1, t001_d2)


def t001():
    """Make the user select the DNS server to change into."""

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"#")
    print(f"# Default / DHCP ............. [0]")
    print(f"# Google DNS ................. [1]")
    print(f"# Cloudflare DNS ............. [2]")
    print(f"# Freenome DNS ............... [3]")
    print(f"# Comodo DNS ................. [4]")
    print(f"# Quad9 DNS .................. [5]")
    print(f"# Verisign DNS ............... [6]")
    print(f"# OpenDNS .................... [7]")
    print(f"# AdGuard (more).............. [8]")
    print(f"# Custom ..................... [9]")
    print(f"# Back ....................... [10] (enter)")
    print(f"#")

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
            t001_d1 = "1.1.1.1"
            t001_d2 = "1.0.0.1"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "3":
            # Freenom DNS
            t001_d0 = "0"
            t001_d1 = "80.80.80.80"
            t001_d2 = "80.80.81.81"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "4":
            # Comodo Secure DNS
            t001_d0 = "0"
            t001_d1 = "8.26.56.26"
            t001_d2 = "8.20.247.20"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "5":
            # Quad9 DNS
            t001_d0 = "0"
            t001_d1 = "9.9.9.9"
            t001_d2 = "149.112.112.112"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "6":
            # Verisign DNS
            t001_d0 = "0"
            t001_d1 = "64.6.64.6"
            t001_d2 = "64.6.65.7"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "7":
            # OpenDNS
            t001_d0 = "0"
            t001_d1 = "208.67.222.222"
            t001_d2 = "208.67.220.220"
            t001_1(t001_d0, t001_d1, t001_d2)
            break
        elif user_input == "8":
            # AdGuard DNS
            pass
        elif user_input == "9":
            # Custom DNS
            pass
        elif user_input == "10" or user_input == "":
            # Go back to tools menu
            tools_menu()
            break
        else:
            print("Invalid input. Please try again.")
            continue


def tools_menu():
    """Select tools for configuring networks"""

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"#")
    print(f"# DNS Server Changer ......... [1]")
    print(f"# Back to Main Menu .......... [2] (enter)")
    print(f"#")

    while True:
        user_input = input("toolsMenu=# > ")

        if user_input == "1":
            t001()
            break
        elif user_input == "2" or user_input == "":
            main_menu()
            break
        else:
            print("Invalid input. Please try again.")
            continue


def modules_menu():
    """The modules menu, WIP"""

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# Currently not available!")
    print(f"# {divider}")
    print(f"#")
    print(f"# Press Enter to continue...")
    input()
    main_menu()


def launch(url):
    """Launch a website in the default browser
       given a URL."""

    if name == "nt":
        system(f"start {url}")
    elif name == "posix":
        system(f"xdg-open {url}")


def donate():
    """Links to donation sites"""

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# Donate and Support")
    print(f"# {divider}")
    print(f"# ")
    print("# Do you like this tool?")
    print("# Please consider to buy me a coffee or")
    print("# just donate to keep this project alive.")
    print("#")
    print("# Buy Me A Coffee ............ [1]")
    print("# Back to Main Menu .......... [2] (enter)")
    print("#")

    while True:
        user_input = input("donate=# > ")
        if user_input == "1":
            launch("https://wrngnz.ga/bmc")
            break
        elif user_input == "2" or user_input == "":
            main_menu()
        else:
            print("Invalid input. Please try again.")


def main_menu():
    """Main menu"""

    # TODO: Add color to terminal outputs with Colorama

    clear()
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# {desc}")
    print(f"# {divider}")
    print(f"#")
    print(f"# Tools ...................... [1] (enter)")
    print(f"# Modules .................... [2] (coming soon)")
    print(f"# Donate ..................... [3]")
    print(f"# Exit ....................... [4]")
    print(f"#")

    while True:
        user_input = input("mainMenu=# > ")

        if user_input == "1" or user_input == "":
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


def is_admin():
    """Return True if the program has admin privileges"""

    # Windows
    if name == 'nt':
        return ctypes.windll.shell32.IsUserAnAdmin() != 0

    # Linux
    else:
        return system('[ "$EUID" == 0 ]') == 0


def main():
    if not is_admin():
        print(f"# {divider}")
        print(f"# {appname} v{appvers} - {appstat}")
        print(f"# by {dev}")
        print(f"# {divider}")
        print(f"# ERROR * ERROR * ERROR * ERROR * ERROR * ERROR")
        print(f"#")
        print(f"# Current user permissions to execute this .py file are inadequate.")
        print(f"# This .py file must be run with administrative privileges.")
        print(f"# Close this program and run it as administrator.")
        print(f"# Contact the developer to assist you...")
        print(f"#")
        print(f"# ERROR * ERROR * ERROR * ERROR * ERROR * ERROR")
        print(f"Press Enter to exit the program...")
        input()
        return 4

    main_menu()
    return 0

if __name__ == '__main__':
    main()
