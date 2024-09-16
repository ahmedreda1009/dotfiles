# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/Users/ahmedreda/Documents/Folders/Projects/natours"

# Create session with specified name if it does not already exist.
if initialize_session "natours"; then

  # Create a new window inline within session layout definition.
  new_window "natours-app"
  split_v 20
  run_cmd "npm run start"
  select_pane 1
  run_cmd "nvim ."

  # Simulate pressing the Tmux prefix (Cmd+b) followed by 'b' to open a floating pane with Floax.
  # Replace 'C-b' with your actual prefix if different.
  run_cmd "tmux send-keys -t natours-app C-b b"  # C-b is the tmux prefix key (Cmd+b for you), followed by 'b'

  # Load a defined window layout (optional).
  # load_window "example"

  # Select the default active window on session creation.
  # select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
