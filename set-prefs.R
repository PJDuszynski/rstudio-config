#Set General Preferences
rstudio.prefs::use_rstudio_prefs(
    auto_append_newline = TRUE,
    auto_detect_indentation = TRUE,
    console_double_click_select = TRUE,
    continue_comments_on_newline = TRUE,
    doc_outline_show = "all",
    enable_cloud_publish_ui = FALSE,
    indent_guides = "rainbowfills",
    margin_column = 100L,
    posix_terminal_shell = "zsh",
    rainbow_parentheses = TRUE,
    remove_history_duplicates = TRUE,
    restore_last_project = FALSE,
    show_hidden_files = TRUE,
    show_last_dot_value = TRUE,
    strip_trailing_whitespace = TRUE,
    submit_crash_reports = FALSE,
    sync_files_pane_working_dir = TRUE,
    syntax_color_console = TRUE,
    show_invisibles = TRUE,
    save_workspace = "never",
    load_workspace = FALSE,
    num_spaces_for_tab = 4L,
    show_rmd_render_command = TRUE
)

# Set Tool Paths (Requires RTools on windows)
if(Sys.info()['sysname'] == 'Windows') {
    HOME_DIR = Sys.getenv("USERPROFILE")
    TERMINAL_PATH = "C:/rtools43/usr/bin/bash.exe"
    PYTHON_PATH = glue::glue("{HOME_DIR}/scoop/shims/python3.exe")
    RSA_KEY_PATH = glue::glue("{HOME_DIR}/.ssh/id_ed25519")
    GIT_EXE_PATH = glue::glue("{HOME_DIR}/scoop/shims/git.exe")
} else if(Sys.info()['sysname'] == 'Linux') {
    TERMINAL_PATH = Sys.getenv("ZSH")
    RSA_KEY_PATH =  "$HOME/.ssh/id_ed25519"
    GIT_EXE_PATH = "/usr/bin/git"
    PYTHON_PATH = "/usr/bin/python3"
}

rstudio.prefs::use_rstudio_prefs(
    terminal_path = TERMINAL_PATH,
    python_path = PYTHON_PATH,
    rsa_key_path = RSA_KEY_PATH,
    git_exe_path = GIT_EXE_PATH
)

# Set Theme
devtools::install_github("gadenbuie/rsthemes")
rsthemes::install_rsthemes()
rstudioapi::applyTheme("Yule RStudio {rsthemes}")