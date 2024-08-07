#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'nq.sh' encrypted at Fri Aug  2 11:19:03 CDT 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY��� X_�@0}����N�����P;��6� �!����G���@4�   *�7�hh@      Jz�j�� h   44 �L�1�2`� 4aRM ���ڛP�S�� �d&z�(V:��[�"TK�Y�%�gL�}>G���t~���u���E�N�9eT���u���`{�LD\�c�c�Yi���Y�/!�9��ZrpNsgE�B�"��Ofy�!��ˉ�ѿ5��"҉��<pd	|�Ӡ�	��0&b���.�����9�D`k��,�;I� �r�0�}���e�y�)��J]qX�sU�MT�X1D1��
���\e1��2"�}��7\Aq���x`/��f�r�/3A߸ǣ��x���!�< ��h���q�{�����E��2>~R�Shs��{��tGGw `@��`��J�p��Ɓ:�e@��%0�/�2:�Ǽ
%��2��@�d(B�+ �5`$��"b��	�<�� �&.E)F��JR�)$�I$�l<D`[ �@� &��qg��)�	,,$G�ss�� �6��y�V��
� �P/��L���a�4y�r�Rkm�KY���;�� $���h�8�ѹ+���)���d~���k�|����^�ܭ꾺��&|���=�r�^�L�"��R4��+J6M�n�Da>�%��� �fs�H�<	�Ь�!2�fz	C]pAX���3@��/Zy`a�����u)ˮ���"L b���<e	��L�#�$��M&���k���R�q8 z��=$H}I��&�D���_�pnD*�Ok�bN>$��b��~f�9%�@!y��F��E�R0Ԭ�3~ )T�o^ѬD\".I$�$�"R$JD�u���{V�1�'�Ka[|�m"��Bi(PL��^p����j��L�DGKFGH�#�ވ��rI�D�#-� �ZH��T ��5�$A Y%�N�B9-���.�: ��Q/���$煾�\�W F�\ل��{L���3�Oo'"�qHӑ��s��'#'�"��$���[؄R�
�4S)������s�	�c����� UUUUW��4�ܑN$,!���