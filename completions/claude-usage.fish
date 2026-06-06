complete -c claude-usage -f
complete -c claude-usage -s h -l help -d 'Show help'
complete -c claude-usage -n '__fish_use_subcommand' -a scan -d 'Scan JSONL files and update database'
complete -c claude-usage -n '__fish_use_subcommand' -a today -d "Show today's usage summary"
complete -c claude-usage -n '__fish_use_subcommand' -a week -d 'Show last 7 days (per-day + by-model)'
complete -c claude-usage -n '__fish_use_subcommand' -a stats -d 'Show all-time statistics'
complete -c claude-usage -n '__fish_use_subcommand' -a dashboard -d 'Scan JSONL files and start the dashboard server'
complete -c claude-usage -n '__fish_seen_subcommand_from scan dashboard' -l projects-dir -d 'Path to Claude projects directory'
complete -c claude-usage -n '__fish_seen_subcommand_from dashboard' -l host -d 'Dashboard host'
complete -c claude-usage -n '__fish_seen_subcommand_from dashboard' -l port -d 'Dashboard port'
