# MorningHue — zsh prompt theme
# https://github.com/glenzac/morninghue-theme
#
# Usage (oh-my-zsh):
#   cp morninghue.zsh-theme ~/.oh-my-zsh/themes/morninghue.zsh-theme
#   Set ZSH_THEME="morninghue" in ~/.zshrc
#
# Usage (standalone, no oh-my-zsh):
#   source /path/to/morninghue.zsh-theme
#
# Best with the MorningHue iTerm2 preset so ANSI colors map to theme accents:
#   color4  (blue)         → #0000d7 Vivid Blue    — keywords
#   color6  (cyan)         → #005f87 Dark Teal      — identifiers
#   color11 (brightyellow) → #af00d7 Bright Purple  — statements
#   color12 (brightblue)   → #005faf Medium Blue    — operators/accent
#   color3  (yellow)       → #875f00 Dark Golden    — warnings/numbers
#   color1  (red)          → #af0000 Deep Red       — errors
#   color8  (brightblack)  → #949494 Comment Gray   — subtle text

# ── Git prompt ────────────────────────────────────────────────────────────────

if (( $+functions[git_prompt_info] )); then
  # oh-my-zsh is loaded — use its git_prompt_info
  ZSH_THEME_GIT_PROMPT_PREFIX=" %F{11}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
  ZSH_THEME_GIT_PROMPT_DIRTY=" %F{3}✗%f"
  ZSH_THEME_GIT_PROMPT_CLEAN=" %F{6}✓%f"
  _morninghue_git_info() { git_prompt_info }
else
  # Standalone — use vcs_info (built into zsh)
  autoload -Uz vcs_info
  zstyle ':vcs_info:*'     enable git
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' unstagedstr " %F{3}✗%f"
  zstyle ':vcs_info:git:*' stagedstr   " %F{6}✓%f"
  zstyle ':vcs_info:git:*' formats      " %F{11}%b%f%u%c"
  zstyle ':vcs_info:git:*' actionformats " %F{11}%b%f|%F{1}%a%f%u%c"
  add-zsh-hook precmd vcs_info 2>/dev/null || precmd_functions+=(vcs_info)
  _morninghue_git_info() { echo "${vcs_info_msg_0_}" }
fi

# ── Prompt ────────────────────────────────────────────────────────────────────
#
# Looks like:
#   ~/path/to/dir  branch ✗  ❯
#   ~/path/to/dir  ❯            (no repo)
#
# The ❯ character turns red when the last command failed.

PROMPT='%F{4}%~%f$(_morninghue_git_info) %(?.%F{12}.%F{1})❯%f '
RPROMPT='%F{8}%*%f'
