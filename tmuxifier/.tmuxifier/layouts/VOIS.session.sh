# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/Users/ahmedreda/Documents/Folders/VOIS/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "VOIS"; then

# /Users/ahmedreda/Documents/Folders/VOIS/wf-ngx-module-develop
  # Create a new window inline within session layout definition.
  #new_window "misc"
  new_window "ngx-module"
  run_cmd "cd wf-ngx-module-develop"
  run_cmd "nvim ."

  new_window "ecare"
  run_cmd "cd wf-ecare-app-6bf732ea3c5f146f82929a84db4916bd6205289d"
  run_cmd "nvim ."

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
