#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'KOland.sh' encrypted at Wed Jul 17 08:25:11 CDT 2024
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
BZh91AY&SY��  �_�@}���N.����P�   ѓ �`A��2`�4d���`F�b0L�`�ʞ�� hh�@h�C� ѓ �`A��2`�E4��@�bMM�F��Dڌ�Ꞧ�(a;G�(��0@,%�"4�A��l�ˢ�)$`�ו+.��Eq]�^�+LC��p�%֤�,ͻkK��GAX�C2���Z���t&�v��"M.*@�o��4�64�Z����?��qi�"�h��pKĥ�B�I���
1�R�S���>��r�e�W�P3��NM�q��暷`��FQ�g!E�L�lM>� V�������8�� wk���.3�w#)����ɫ��� f ����t�r.~WQ�v�������6o
O��@m@0>�PH>G��"i��"�1������˗H'㿫�b�k����� ��v��o���i��4�G�|�+���%sM���j��b��`~(�vѠ�cV��� ��`BǴ���RZ�PS��D��U�+[)w�K����y�{�7"�,�����- cl\jhQW�%J�B��І>�����B&7�URe+/��)7ޠ~�ic)��qJ���0e �LK�M`�L*8�6�4,�у�@�saAbΌ�C	���!���,Dh�uQ�r`@8�n.�"�Չl)��2�v�XPx
�6�/ �%���XI��Mƛ�G�Z)"yBSL�z�������H$�	Z@0�Y)�rs��"L�d0�`Vg0����r�odԍ�j���/3J2�Q ;L��4I�� a����:ڽ��J�$�E̡��^2�%��P��F�~�U,q
iz���x��_M�H�������@Z�+FS&�C/�+ҹ��J���6W<M��?��ν�B�np���@�?�x���H�
`b�