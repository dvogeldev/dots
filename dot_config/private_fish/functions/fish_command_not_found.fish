function fish_command_not_found
    # "In a container" check
    if test -e /run/.containerenv -o -e /.dockerenv
        distrobox-host-exec $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end

# Integrate host with container seamlessly
# Another cool trick we can pull, is the handy command_not_found_handle function to try and execute missing commands in the container on the host.
