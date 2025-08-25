#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Rgmyr Dark scheme by rgmyr (converted from iTerm2)

color00="00/28/31" # Base 00 - Black
color01="d1/1c/24" # Base 08 - Red
color02="6c/be/6c" # Base 0B - Green
color03="a5/77/06" # Base 0A - Yellow
color04="21/76/c7" # Base 0D - Blue
color05="c6/1c/6f" # Base 0E - Magenta
color06="25/92/86" # Base 0C - Cyan
color07="9c/c2/c3" # Base 05 - White
color08="00/64/88" # Base 03 - Bright Black
color09=$color01   # Base 08 - Bright Red
color10=$color02   # Base 0B - Bright Green
color11=$color03   # Base 0A - Bright Yellow
color12=$color04   # Base 0D - Bright Blue
color13=$color05   # Base 0E - Bright Magenta
color14=$color06   # Base 0C - Bright Cyan
color15="fc/f4/dc" # Base 07 - Bright White
color16="f5/16/3b" # Base 09
color17="e2/4d/8e" # Base 0F
color18="00/37/48" # Base 01
color19="00/64/88" # Base 02
color20="7a/8f/8e" # Base 04
color21="b5/d5/d3" # Base 06
color_foreground="9c/c2/c3"   # Base 05
color_background="00/28/31"   # Base 00

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
  printf $printf_template_custom Pg 9cc2c3 # foreground
  printf $printf_template_custom Ph 002831 # background
  printf $printf_template_custom Pi 9cc2c3 # bold color
  printf $printf_template_custom Pj 003748 # selection color
  printf $printf_template_custom Pk 9cc2c3 # selected text color
  printf $printf_template_custom Pl 9cc2c3 # cursor
  printf $printf_template_custom Pm 002831 # cursor text
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
