#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# GitHub Dark Dimmed scheme by GitHub (converted from VS Code theme)

color00="22/27/2e" # Base 00 - Black
color01="f4/70/67" # Base 08 - Red
color02="57/ab/5a" # Base 0B - Green
color03="c6/90/26" # Base 0A - Yellow
color04="53/9b/f5" # Base 0D - Blue
color05="b0/83/f0" # Base 0E - Magenta
color06="39/c5/cf" # Base 0C - Cyan
color07="ad/ba/c7" # Base 05 - White
color08="54/5d/68" # Base 03 - Bright Black
color09=$color01   # Base 08 - Bright Red
color10=$color02   # Base 0B - Bright Green
color11=$color03   # Base 0A - Bright Yellow
color12=$color04   # Base 0D - Bright Blue
color13=$color05   # Base 0E - Bright Magenta
color14=$color06   # Base 0C - Bright Cyan
color15="cd/d9/e5" # Base 07 - Bright White
color16="ff/93/8a" # Base 09
color17="dc/bd/fb" # Base 0F
color18="2d/33/3b" # Base 01
color19="37/3e/47" # Base 02
color20="63/6e/7b" # Base 04
color21="cd/d9/e5" # Base 06
color_foreground="ad/ba/c7"   # Base 05
color_background="22/27/2e"   # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\'
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\007\033\'
  printf_template_var='\033P\033]%d;rgb:%s\007\033\'
  printf_template_custom='\033P\033]%s%s\007\033\'
elif [ "${TERM%%-*}" = "linux" ]; then
  printf_template='\e]4;%d;rgb:%s\e\\'
  printf_template_var='\e]%d;rgb:%s\e\\'
  printf_template_custom='\e]%s%s\e\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg adbac7 # foreground
  printf $printf_template_custom Ph 22272e # background
  printf $printf_template_custom Pi adbac7 # bold color
  printf $printf_template_custom Pj 373e47 # selection color
  printf $printf_template_custom Pk adbac7 # selected text color
  printf $printf_template_custom Pl adbac7 # cursor
  printf $printf_template_custom Pm 22272e # cursor text
else
  printf $printf_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    printf $printf_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      printf $printf_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset printf_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
