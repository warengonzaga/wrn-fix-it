from os import system, name
import sys

appname = "WRN Fix IT"
appvers = "1.0.0-rc.2"
appstat = "Release Candidate"
dev = "Waren Gonzaga"
desc = "Your companion toolset for fixing common issues"
divider = "======================================"

def tools_menu():
    print("TODO: Tools menu")

def modules_menu():
    print("TODO: Modules menu")

def donate():
    print("TODO: Donate menu")

def main_menu():
    print(f"# {divider}")
    print(f"# {appname} v{appvers} - {appstat}")
    print(f"# by {dev}")
    print(f"# {divider}")
    print(f"# {desc}")
    print(f"# {divider}")
    print("#")
    print("# Tools ...................... [1] (enter)")
    print("# Modules .................... [2] (coming soon)")
    print("# Donate ..................... [3]")
    print("# Exit ....................... [4]")
    print("#")

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
            print("Invalid input. Try again.")
            continue

def main():
    main_menu()

if __name__ == '__main__':
    main()
