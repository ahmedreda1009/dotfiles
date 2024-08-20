# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/Users/ahmedreda/Documents/Folders/ITI/rank.dev"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "grad-project"; then

  # Create a new window inline within session layout definition.
  new_window "grad-main"
  split_v 20
  # run_cmd "cd next
  # run_cmd "npm run dev"
  # split_h 50
  # run_cmd "npm run dev"
  # split_v 50
  # select_pane 2
  run_cmd "cd next"
  run_cmd "npm run dev"
  split_h 50
  run_cmd "cd socket-server"
  run_cmd "npm run dev"
  select_pane 1
  run_cmd "nvim ."

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
