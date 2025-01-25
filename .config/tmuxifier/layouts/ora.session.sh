session_root "~/work/cmd"

if initialize_session "ora"; then
  new_window "wiki"
  run_cmd "wiki"

  new_window "cbs-ora"
  run_cmd "cd cbs.sample/cbs.sample.docker/src/main/docker/oracle"
  tmux split-window -h -p 50
  run_cmd "lazydocker"

  new_window "cbs"
  run_cmd "cd cbs"

  new_window "jboss"
  run_cmd "cd cbs/cbs.sample/cbs.sample.wildfly/target/wildfly/bin"
  tmux split-window -v 50
  run_cmd "cd cbs/cbs.sample/cbs.sample.wildfly/target/wildfly/bin"

  select_window "cbs-ora"
fi
finalize_and_go_to_session
