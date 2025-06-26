# ~/.zsh/functions.zsh
# Custom shell functions

# Add your functions below

mdcd() {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

function killport {
  # check if argument was provided
  if [[ $# -gt 0 ]]; then
    # split comma-separated ports into an array
    ports=("${(@s/,/)1}")
  else
    # prompt user for comma-separated ports
    read "input?Enter comma-separated ports: "
    # split input into an array
    ports=("${(@s/,/)input}")
  fi

  # loop through each port and kill processes using that port
  for port in "${ports[@]}"; do
    echo "Searching for processes using port $port"
    pids=$(lsof -t -i tcp:$port)

    if [[ -z $pids ]]; then
      echo "No processes found using port $port"
      continue
    fi

    echo "Processes found using port $port: $pids"
    echo "Killing processes using port $port with kill command"
    echo $pids | xargs kill

    sleep 1 # wait for processes to be killed

    # verify that the processes are killed
    for pid in $pids; do
      if ps -p $pid > /dev/null; then
        echo "Failed to kill process $pid with kill command, trying with kill -9 command"
        kill -9 $pid
      fi
    done

    sleep 1 # wait for processes to be killed

    # verify that the processes are killed
    for pid in $pids; do
      if ps -p $pid > /dev/null; then
        echo "Failed to kill process $pid with kill -9 command, giving up"
        return 1
      fi
    done

    echo "Successfully killed processes using port $port"
  done

  return 0
}

rmall() {
  # Convert comma-separated input to an array
  if [ -n "$1" ]; then
    FOLDERS=("${(s:,:)1}")
  else
    # If no arguments are provided, ask for input
    echo "Please enter folder names (comma-separated):"
    read -r input
    FOLDERS=("${(s:,:)input}")
  fi

  # List all the folders to be affected
  echo "The following folders will be affected:"
  for folder in "${FOLDERS[@]}"; do
    find . -name "$folder" -type d -prune -exec echo '{}' \;
  done

  # Ask for confirmation, with "Y" as the default option
  printf "Are you sure you want to remove these folders? (Y/n): "
  read -r confirm

  # Set default confirm value if no input is provided
  confirm="${confirm:-Y}"

  # Remove folders if confirmed
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    for folder in "${FOLDERS[@]}"; do
      find . -name "$folder" -type d -prune -exec rm -rf '{}' +
    done
    echo "Folders have been removed."
  else
    echo "Operation canceled."
  fi
}

lall() {
  find . -name $1 -type d -prune
}

# Navigate to git repository root
groot() {
  local gitroot=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n "$gitroot" ]]; then
    cd "$gitroot"
  else
    echo "Not in a git repository"
    return 1
  fi
}

# Handle "cd ..." patterns with spaces
cd() {
  if [[ "$1" == "..." ]]; then
    builtin cd ../..
  elif [[ "$1" == "...." ]]; then
    builtin cd ../../..
  elif [[ "$1" == "....." ]]; then
    builtin cd ../../../..
  else
    builtin cd "$@"
  fi
}
