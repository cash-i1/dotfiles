import os
import platform
import subprocess
import shutil


class Formatting:
  RESET = '\033[0m'
  RED = '\033[91m'
  GREEN = '\033[92m'
  YELLOW = '\033[93m'
  BLUE = '\033[94m'
  MAGENTA = '\033[95m'
  CYAN = '\033[96m'
  ERROR = RED + "[!]" + RESET
  INFO = YELLOW + "[?]" + RESET
  SUCCESS = GREEN + "[✔]" + RESET


locations = {"nvim": "~/.config/nvim"}

os_type = platform.system()
remote = "https://github.com/cash-i1/dotfiles.git"
git_directory = "~/repos"
script_version = "1.0"


def run(command: list):
  try:
    subprocess.run(command, check=True, capture_output=True)
  except Exception as e:
    print(e)
    return False


def col(string: str, col: Formatting):
  return f"{col}{string}{Formatting.RESET}"


def is_git_installed():
  try:
    subprocess.check_output(["git", "--version"])
    return True
  except Exception:
    return False


def check_sudo():
  try:
    subprocess.run(['sudo', '-v'],
                   check=True,
                   stdout=subprocess.PIPE,
                   stderr=subprocess.PIPE)
    return False
  except Exception:
    return True


def main():
  print(f"{Formatting.INFO} install script version: {script_version}")
  if check_sudo():
    print(
        f"{Formatting.ERROR} you are running this as sudo, for security, {col('do not run in sudo', Formatting.RED)}"
    )
    exit(1)
  else:
    print(f"{Formatting.INFO} not running in sudo")

  if os_type.lower() == "linux":
    print(
        f"{Formatting.INFO} you are using linux, things should work as expected"
    )
  elif os_type.lower() == "macos":
    print(f"{Formatting.INFO} you are using macos, things may not work")

  elif os_type.lower() == "windows":
    print(f"{Formatting.ERROR} windows is not supported")
    exit(1)

  print(f"{Formatting.INFO} creating {col(git_directory, Formatting.MAGENTA)}")

  if is_git_installed():
    print(f"{Formatting.INFO} checking if git is installed")

    try:
      print(
          f"{Formatting.INFO} trying to clone {col(remote, Formatting.MAGENTA)} to {col(git_directory, Formatting.MAGENTA)}"
      )
      run(["git", "clone", remote, git_directory])
      print(
          f"{Formatting.SUCCESS} successfully cloned {col(remote, Formatting.MAGENTA)} to {col(git_directory, Formatting.MAGENTA)}"
      )

      try:

        for file_name, file_directory in locations.items():
          print(
              f"{Formatting.INFO} creating directory {col(file_directory, Formatting.MAGENTA)}"
          )
          os.makedirs(file_directory, exist_ok=True)
          backup_directory = file_directory + "_bak"
          print(
              f"{Formatting.INFO} backing up {col(file_directory, Formatting.MAGENTA)} to {col(backup_directory, Formatting.MAGENTA)}"
          )
          shutil.copytree(file_directory, backup_directory)
          print(
              f"{Formatting.INFO} copying {col(git_directory + '/' + file_name, Formatting.MAGENTA)} to {col(file_directory, Formatting.MAGENTA)}"
          )
          if run(["cp", git_directory + "/" + file_name, file_directory]) == False:
            print(f"{Formatting.ERROR} could not copy {col(git_directory + '/' + file_name, Formatting.MAGENTA)} to {col(file_directory, Formatting.MAGENTA)}.")
            exit(1)
            
      except Exception as e:
        print(e)
        exit(1)

    except:
      print(
          f"{Formatting.ERROR} could not clone the repo to {col(git_directory, Formatting.MAGENTA)}"
      )
      exit(1)
    print(f"{Formatting.SUCCESS} all operations were successful")
    exit(1)
  else:
    print(f"{Formatting.ERROR} git is not installed.")
    exit(1)


if __name__ == "__main__":
  main()

