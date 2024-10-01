import os
import random

temp_download_dir = os.path.join(
    "/tmp", f"addtobeets_{random.randint(1000, 9999)}")

print(f"making {temp_download_dir}")
os.mkdir(temp_download_dir)

links = input("link(s): ").split(" ")
if len(links) <= 1:
    if links[0] == "":
        print("no links provided")
        exit()
links_str = " ".join(links)

spot_dl_command = f"""
    docker run -it -v \\
        {temp_download_dir}:/music \\
        spotdl/spotify-downloader:latest \\
        download {links_str}
        """

beets_command = f"beet import -g {temp_download_dir}"
command = ""

command = spot_dl_command

if command == "":
    print("command is nothing")
    exit()

should_run = True if input(
    f"download music? (`{command}`)? [y/n]: ") == "y" else False

if should_run:
    print(f"running: `{command}`")
    os.system(f"{command}")

print(f"successfuly downloaded to {temp_download_dir}")

command = beets_command

if command == "":
    print("command is nothing")
    exit()

should_run = True if input(
    f"add to beets (`{command}`)? [y/n]: ") == "y" else False

if should_run:
    print(f"running`{command}`")
    os.system(f"{command}")

print("successfuly added songs to beets")
