session_root "~/work-gojira/atl-scripts-master"

if initialize_session "gmaster"; then
  new_window "nvim"
  run_cmd "nvim"
  new_window "zsh"
  new_window "wiki"
  run_cmd "wiki"
  select_window "nvim"
fi
finalize_and_go_to_session
