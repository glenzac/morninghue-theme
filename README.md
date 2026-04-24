# MorningHue

A vivid light color theme designed for brightly-lit environments.

Warm off-white background with carefully contrast-verified vivid accents. Every syntax color meets **WCAG AA (4.5:1)** or **AAA (7:1)** contrast standards, reducing eye strain during long coding sessions while keeping colors bright and distinguishable.

**[Live Preview](https://glenzac.github.io/morninghue-theme/)**

## Features

- **Warm off-white background** (`#F1EDE5`) — gentler than pure white, sits between PaperColor's cool gray and a warm cream color.
- **Vivid, accessible colors** — every syntax color is contrast-verified against the background
- **AAA contrast (7:1+)** for the most important elements: keywords, control flow, types, preprocessor directives
- **AA contrast (4.5:1+)** for secondary elements: strings, numbers, functions, operators
- **VS Code support** — full workbench theme with token colors, semantic highlighting, and terminal palette
- **iTerm2 support** — native macOS color preset (`.itermcolors`) with the full 16-color palette
- **zsh theme** — oh-my-zsh compatible prompt with git status, works standalone too
- **256-color terminal support** — works in any modern terminal emulator
- **GUI support** — works in gvim and Neovim with `termguicolors`
- **Broken symlink visibility** — includes a dircolors config that fixes the common light-theme issue of invisible broken symlinks
- **Terminal tool compatibility** — ANSI palette remapped so TUI tools like GitHub Copilot CLI render text visibly on the light background
- **30+ languages** — covers all standard Vim syntax groups, so any language Vim recognizes gets proper highlighting
- **DV-optimized** — extra attention to SystemVerilog, TCL, and hardware design verification workflow highlighting

## Color Palette

### AAA Tier (7:1+ contrast) — Most prominent

| Color | Hex | cterm | Ratio | Usage |
|-------|-----|-------|-------|-------|
| ![#0000d7](https://placehold.co/16x16/0000d7/0000d7) Vivid Blue | `#0000d7` | 20 | 9.08 | Keywords, `module`, `endmodule`, structure |
| ![#870000](https://placehold.co/16x16/870000/870000) Dark Crimson | `#870000` | 88 | 8.86 | PreProc, `` `define ``, `` `ifdef `` |
| ![#870087](https://placehold.co/16x16/870087/870087) Deep Magenta | `#870087` | 90 | 7.56 | Control flow: `always_ff`, `if`, `for`, `case` |
| ![#5f00d7](https://placehold.co/16x16/5f00d7/5f00d7) Vivid Purple | `#5f00d7` | 56 | 7.29 | Types: `logic`, `wire`, `reg`, `int` |

### AA Tier (4.5:1+ contrast) — Vivid accents

| Color | Hex | cterm | Ratio | Usage |
|-------|-----|-------|-------|-------|
| ![#005f00](https://placehold.co/16x16/005f00/005f00) Dark Green | `#005f00` | 22 | 6.82 | Strings |
| ![#005f5f](https://placehold.co/16x16/005f5f/005f5f) Sea Teal | `#005f5f` | 23 | 6.42 | Boolean, special constants |
| ![#af0000](https://placehold.co/16x16/af0000/af0000) Deep Red | `#af0000` | 124 | 6.37 | Errors, exceptions |
| ![#005f87](https://placehold.co/16x16/005f87/005f87) Dark Teal | `#005f87` | 24 | 6.06 | Function names, identifiers |
| ![#005faf](https://placehold.co/16x16/005faf/005faf) Medium Blue | `#005faf` | 25 | 5.52 | Operators, delimiters |
| ![#875f00](https://placehold.co/16x16/875f00/875f00) Dark Golden | `#875f00` | 94 | 4.90 | Numbers, constants (bold) |
| ![#af00d7](https://placehold.co/16x16/af00d7/af00d7) Bright Purple | `#af00d7` | 128 | 4.73 | Statements, assertions |
| ![#d70000](https://placehold.co/16x16/d70000/d70000) Vivid Red | `#d70000` | 160 | 4.62 | `import`, `include` |

### UI Accent

| Color | Hex | cterm | Usage |
|-------|-----|-------|-------|
| ![#005faf](https://placehold.co/16x16/005faf/005faf) Medium Blue | `#005faf` | 25 | Status bar, visual selection, cursor |
| ![#ffff5f](https://placehold.co/16x16/ffff5f/ffff5f) Bright Yellow | `#ffff5f` | 227 | Search highlight |
| ![#949494](https://placehold.co/16x16/949494/949494) Gray | `#949494` | 246 | Comments (italic, intentionally subtle) |

### Terminal ANSI Palette (color0–color15)

On a light background the standard "white" palette slots must be remapped to dark values — otherwise TUI tools that render text in color7 or color15 (such as GitHub Copilot CLI) become invisible. Several other bright slots are also semantically remapped so TUI tools get readable, theme-coherent colors.

| Slot | Hex | cterm | CR | Usage |
|------|-----|-------|----|-------|
| color0 / ansiBlack | `#444444` | 238 | 8.33 | Black → foreground dark |
| color1 / ansiRed | `#af0000` | 124 | 6.37 | Errors, deletions |
| color2 / ansiGreen | `#005f00` | 22 | 6.82 | Strings, success |
| color3 / ansiYellow | `#875f00` | 94 | 4.90 | Numbers, warnings |
| color4 / ansiBlue | `#0000d7` | 20 | 9.08 | Keywords, structure |
| color5 / ansiMagenta | `#870087` | 90 | 7.56 | Control flow |
| color6 / ansiCyan | `#005f87` | 24 | 6.02 | Identifiers, functions |
| color7 / ansiWhite | `#444444` | 238 | 8.33 | **Remapped to dark** — TUI tool visibility |
| color8 / ansiBrightBlack | `#949494` | 246 | 2.60 | Comments (subtle) |
| color9 / ansiBrightRed | `#d70000` | 160 | 4.62 | Imports, vivid red |
| color10 / ansiBrightGreen | `#005f87` | 24 | 6.02 | Functions (semantic remap) |
| color11 / ansiBrightYellow | `#af00d7` | 128 | 4.73 | Statements, assertions (semantic remap) |
| color12 / ansiBrightBlue | `#005faf` | 25 | 5.52 | Operators, accent |
| color13 / ansiBrightMagenta | `#af005f` | 132 | 6.02 | Rose accent |
| color14 / ansiBrightCyan | `#005f5f` | 23 | 6.42 | Booleans, constants (semantic remap) |
| color15 / ansiBrightWhite | `#1c1c1c` | — | 14.60 | **Remapped to near-black** — TUI tool visibility |

## Installation

### VS Code

**From source (development):**

1. Clone the repository into your VS Code extensions directory:

```bash
# Linux / macOS
git clone https://github.com/glenzac/morninghue-theme ~/.vscode/extensions/morninghue

# Windows
git clone https://github.com/glenzac/morninghue-theme %USERPROFILE%\.vscode\extensions\morninghue
```

2. Restart VS Code, then select the theme:
   - Open **Command Palette** (`Ctrl+Shift+P` / `Cmd+Shift+P`)
   - Type **Preferences: Color Theme**
   - Select **MorningHue**

### Vim / Neovim

**Plain file (recommended):**

```bash
# Vim
mkdir -p ~/.vim/colors
cp colors/morninghue.vim ~/.vim/colors/

# Neovim
mkdir -p ~/.config/nvim/colors
cp colors/morninghue.vim ~/.config/nvim/colors/
```

Add to your `~/.vimrc` or `~/.config/nvim/init.vim`:

```vim
set background=light
colorscheme morninghue
```

For GUI colors in Neovim, also add:

```vim
set termguicolors
```

**vim-plug:**

```vim
Plug 'yourusername/morninghue'
```

### iTerm2 (macOS)

1. Open **iTerm2 → Preferences → Profiles → Colors**
2. Click **Color Presets… → Import…** and select `morninghue.itermcolors`
3. Select **MorningHue** from the Color Presets dropdown

### zsh

**oh-my-zsh:**

```bash
cp morninghue.zsh-theme ~/.oh-my-zsh/themes/morninghue.zsh-theme
```

Add to `~/.zshrc`:

```zsh
ZSH_THEME="morninghue"
```

**Standalone (no oh-my-zsh):**

```bash
# Add to ~/.zshrc
source /path/to/morninghue.zsh-theme
```

The theme uses standard ANSI palette colors. When combined with the iTerm2 preset (or `morninghue.Xresources`), the prompt picks up the theme's exact accent colors automatically.

For `ls` colors and broken-symlink highlighting, also set up [dircolors](#dircolors-ls-colors--broken-symlinks-fix).

### xterm

```bash
# Merge with existing Xresources
xrdb -merge morninghue.Xresources

# Or copy to home directory
cp morninghue.Xresources ~/.Xresources
xrdb -merge ~/.Xresources
```

### tmux

Add to your `~/.tmux.conf`:

```bash
source-file /path/to/morninghue.tmux.conf
```

Then reload tmux:

```bash
tmux source-file ~/.tmux.conf
```

### dircolors (ls colors + broken symlinks fix)

Add to your shell rc file (`~/.bashrc`, `~/.cshrc`, etc.):

**bash/zsh:**
```bash
[ -f /path/to/morninghue.dircolors ] && eval $(dircolors /path/to/morninghue.dircolors)
```

**tcsh/csh:**
```csh
if ( -f /path/to/morninghue.dircolors ) eval `dircolors -c /path/to/morninghue.dircolors`
```

This fixes the broken symlink visibility issue common with light terminal themes — orphaned symlinks are shown in bold red on a light pink background, making them impossible to miss.

## Language Support

MorningHue defines all standard Vim highlight groups and VS Code TextMate/semantic token scopes, so **any language works out of the box**. Additionally, it includes optimized highlighting for:

- **SystemVerilog / Verilog** — module boundaries, always blocks, assertions, and types are distinctly colored
- **Python** — decorators, builtins, imports
- **Makefile** — targets, variables, recipes
- **TCL** — commands, procedures, variables
- **Shell / tcsh / csh** — conditionals, variables, command substitution
- **C / C++** — preprocessor, types, structures
- **VimL** — commands, options, highlight groups
- **Markdown** — heading hierarchy, code blocks, links
- **JSON / YAML** — keys, values, structure
- **HTML / XML / CSS** — tags, attributes, properties
- **JavaScript / TypeScript** — imports, variables, functions
- **Git** — commit messages, diffs

## Accessibility

All contrast ratios are measured against the background (`#F1EDE5`, luminance 0.849) using the [WCAG 2.1 contrast ratio formula](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html).

| Standard | Ratio | Used For |
|----------|-------|----------|
| **AAA** | >= 7:1 | Keywords, control flow, types, preprocessor |
| **AA** | >= 4.5:1 | Strings, numbers, functions, operators, imports |
| **Subtle** | ~2.6:1 | Comments (intentionally low contrast, italic styling) |

### Why this matters

- **Reduces eye strain** in brightly-lit offices and workspaces
- **Improves readability** for users with low vision or color vision deficiency
- **Better than most light themes** — many popular light themes (including PaperColor) have 5-6 colors that fall below the AA threshold

## Why a Light Theme?

MorningHue is designed for use in brightly-lit environments. There is peer-reviewed research supporting this design decision — but the picture is nuanced, so this section presents what the evidence actually says rather than a simplified "light is better" argument.

### The positive polarity advantage

*Polarity* is the term researchers use for the relationship between text and background brightness. **Positive polarity** means dark text on a light background; **negative polarity** means light text on a dark background.

Multiple controlled studies find that positive polarity produces better proofreading accuracy and faster reading speed under typical office lighting conditions. The clearest mechanistic explanation comes from a 2014 study by Piepenbrock, Mayr, and Buchner¹: positive polarity displays caused smaller pupil sizes compared to negative polarity, and smaller pupils reduce both spherical and chromatic aberrations in the eye's lens — producing a sharper retinal image.

A 2013 study by the same group² confirmed the advantage held for both younger and older adults. A separate paper³ found the effect was more pronounced with smaller character sizes, which is relevant for code where identifiers and operators are often small.

Critically, a 2007 study by Buchner and Baumgartner⁴ found that when display luminance was equalized between positive and negative polarity conditions, the performance difference disappeared. **The advantage is a luminance effect, not a polarity effect per se.** In normal use, positive polarity displays are brighter overall, and it is that extra luminance causing pupil constriction that drives the reading benefit — not anything intrinsic to "dark text on light background."

### Ambient light is the key variable

The advantage is conditional on environment. A 2024 study⁵ found that in high ambient brightness conditions, negative polarity actually produced *lower* eye fatigue, likely because a dark screen reduces total luminance load on the visual system when the room itself is already very bright. Research by Dobres et al. (2017)⁶ consistently shows that what matters most is **matching screen luminance to ambient light**: when screen brightness is close to the environmental brightness, visual fatigue is reduced regardless of polarity.

MorningHue was designed for the common scenario of bright office or indoor lighting where ambient and screen luminance are naturally similar — the context where the positive polarity advantage is most consistent and most measured.

### Warm white, not pure white

Pure white backgrounds (`#ffffff`) maximize the luminance benefit but introduce their own problem: halation, where the bright background creates a perception of light "bleeding" into surrounding dark text, especially noticeable for users with astigmatism. A warm off-white (`#F1EDE5`) retains enough luminance to drive pupil constriction while reducing the harsh glare that makes extended reading on pure-white screens uncomfortable.

### When a dark theme is the right choice

The research does **not** support positive polarity as universally superior. Dark themes are a legitimate choice in several contexts:

- **Dim or dark environments** — dark themes reduce glare and better match low ambient luminance, where the positive polarity advantage disappears or reverses
- **Individual differences** — polarity effects vary significantly between people; population studies show each polarity benefits a comparable proportion of individuals
- **Perceived cognitive workload** — a 2025 eye-tracking study at ACM CHI⁷ found dark mode produced significantly lower perceived workload on complex visual tasks
- **Low contrast sensitivity** — users with certain vision conditions, low vision, or cataracts may read faster with negative polarity
- **Personal preference** — subjective preference is a real factor; a theme you find comfortable is better than one you tolerate

There is also **no peer-reviewed research specifically on dark versus light themes for code reading**. Claims that one polarity is objectively better for programming go beyond the available evidence.

### Sources

1. Piepenbrock, C., Mayr, S., & Buchner, A. (2014). Smaller pupil size and better proofreading performance with positive than with negative polarity displays. *Ergonomics*, 57(11), 1670–1677. <https://pubmed.ncbi.nlm.nih.gov/25135324/>

2. Piepenbrock, C., Mayr, S., Mund, I., & Buchner, A. (2013). Positive display polarity is advantageous for both younger and older adults. *Ergonomics*, 56(7), 1116–1124. <https://doi.org/10.1080/00140139.2013.790485>

3. Piepenbrock, C., Mayr, S., & Buchner, A. (2014). Positive display polarity is particularly advantageous for small character sizes. *Human Factors*, 56(5), 942–951. <https://journals.sagepub.com/doi/abs/10.1177/0018720813515509>

4. Buchner, A., & Baumgartner, N. (2007). Text–background polarity affects performance irrespective of ambient illumination and colour contrast. *Ergonomics*, 50(7), 1036–1063. <https://pubmed.ncbi.nlm.nih.gov/19562598/>

5. Eichenbaum et al. (2024). Effects of ambient illuminance on display polarity, visual fatigue, and reading performance. *PMC / BMC Ophthalmology*. <https://pmc.ncbi.nlm.nih.gov/articles/PMC11175232/>

6. Dobres, J., Chahine, N., & Reimer, B. (2017). Perceptual and legibility thresholds for positive and negative polarity text in indoor and outdoor environments. *Applied Ergonomics*, 65, 41–47. <https://doi.org/10.1016/j.apergo.2016.08.011>

7. Wang, Y. et al. (2025). The dark side of dark mode: an eye-tracking study. *ACM CHI 2025*. <https://dl.acm.org/doi/10.1145/3715669.3725879>

## Comparison with PaperColor

| Element | PaperColor | CR | MorningHue | CR | Improvement |
|---------|-----------|-----|-----------|-----|-------------|
| Background | `#eeeeee` (cool gray) | — | `#F1EDE5` (warm off-white) | — | Warmer, less harsh |
| Strings (olive) | `#5f8700` | 3.65 | `#005f00` | 6.82 | +87% |
| Statement (pink) | `#d70087` | 4.27 | `#af00d7` | 4.73 | +11% |
| Operator (aqua) | `#0087af` | 3.56 | `#005faf` | 5.52 | +55% |
| Numbers (orange) | `#d75f00` | 3.28 | `#875f00` | 4.90 | +49% |
| Boolean (green) | `#008700` | 4.05 | `#005f5f` | 6.42 | +59% |
| Broken symlinks | Invisible | — | Bold red on pink | High | Fixed |

## License

[MIT](LICENSE)
