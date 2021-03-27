import os

home = os.path.expanduser("~")
cwd = os.getcwd()


for config in os.listdir("."):
    if(config != "symlink.py" and config != ".git"):
        try:
            os.symlink(f"{cwd}/{config}", f"{home}/.config/{config}")

            print(f"linked {config}")
        except:
            print(f"{config} already exits")
