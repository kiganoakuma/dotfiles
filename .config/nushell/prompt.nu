
# Custom prompt (similar to powerlevel10k but simpler)
def create_right_prompt [] {
    # Get command execution time if it's longer than 3s
    let duration = if (try { $env.CMD_DURATION_MS } | into int) > 3000 {
        let ms = ($env.CMD_DURATION_MS | into int)
        if $ms < 1000 {
            $"($ms)ms"
        } else if $ms < 60000 {
            $"(($ms / 1000))s"
        } else {
            $"(($ms / 60000))m"
        }
    } else { "" }    
    # Get exit code
    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {
        $"(ansi red)✘ ($env.LAST_EXIT_CODE)(ansi reset)"
    } else { "" }
    
    # Combine them
    $"($duration)($last_exit_code)"
}

# Create the main prompt
def create_left_prompt [] {
    # Get current directory, replace home with ~
    let dir = ($env.PWD | str replace $env.HOME "~")
    
    # Get git information
    let git_info = if (do { git status --porcelain } | complete | get stdout | str trim | is-empty) {
        let branch = (do { git branch --show-current } | complete | get stdout | str trim)
        if $branch != "" {
            $"(ansi green)($branch)(ansi reset)"
        } else { "" }
    } else {
        let branch = (do { git branch --show-current } | complete | get stdout | str trim)
        if $branch != "" {
            $"(ansi red)($branch)(ansi reset)"
        } else { "" }
    }
    
    # Create prompt character (changes color based on last exit code)
    let prompt_char = if ($env.LAST_EXIT_CODE == 0) {
        $"(ansi green)>(ansi reset)"
    } else {
        $"(ansi red)>(ansi reset)"
    }
    
    # Create the first line with directory and git info
    let first_line = $"\n(ansi blue_bold)($dir)(ansi reset) ($git_info)"
    
    # Return the two-line prompt
    $"($first_line)\n "
}

# Apply the prompt config
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
