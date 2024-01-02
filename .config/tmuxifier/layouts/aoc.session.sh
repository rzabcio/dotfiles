session_root "~/work-private/adventofcode-2023"

if initialize_session "aoc"; then
  new_window "nvim"
  run_cmd "nvim"
  new_window "zsh"
  new_window "wiki"
  run_cmd "wiki"
  select_window "nvim"
fi
finalize_and_go_to_session
