#!/bin/bash
steamcmd_dir="$HOME/SteamCmd"
config_dir="$HOME/.klei/DoNotStarveTogether"
install_dir="$HOME/DoNotStarveTogetherServer"
cluster_name="Moon"

function fail()
{
        echo Error: "$@" >&2
        exit 1
}
function check_for_file()
{
    if [ ! -e "$1" ]; then
            fail "Missing file: $1"
    fi
}

cd "$steamcmd_dir" || fail "Missing $steamcmd_dir directory!"
check_for_file "steamcmd.sh"
check_for_file "$config_dir/$cluster_name/cluster.ini"
check_for_file "$config_dir/$cluster_name/cluster_token.txt"
check_for_file "$config_dir/$cluster_name/Master/server.ini"
check_for_file "$config_dir/$cluster_name/Caves/server.ini"
./steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 +quit

check_for_file "$install_dir/bin"
cd "$install_dir/bin" || fail
run_shared=(./dontstarve_dedicated_server_nullrenderer)
run_shared+=(-console)
run_shared+=(-cluster "$cluster_name")
run_shared+=(-monitor_parent_process $$)
run_shared+=(-shard)
"${run_shared[@]}" Caves  | sed 's/^/Caves:  /' &
"${run_shared[@]}" Master | sed 's/^/Master: /'
