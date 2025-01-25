session_root "~/work-private/adventofcode-2024"

if initialize_session "aoc"; then
  new_window "edit"
  run_cmd "nvim"
  new_window "run"
  run_cmd "go test"
  select_window "edit"
fi
finalize_and_go_to_session
