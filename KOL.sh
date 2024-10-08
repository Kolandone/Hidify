#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'kyo.sh' encrypted at Tue Aug 13 18:19:55 CDT 2024
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
BZh91AY&SY�� >߀@}����N�����`?>AD�}�J�U�� �`�2��� �`�2��� �`�2��i���4   4  h  D�MMI6��e1D��4i�hQA�	�`���F#M=L�z�z�қS�RQ��?�A�BB�d�I5�.���&I��x��<������D�Ƽ��0�LY%Z�@]q֤F��t���C��dbrL�cSY58i��y�a�v�γ�1�tސ�*���$�KJ��x`�F�׺Y��H���.�t4ӿ�>Ty2�"C ���ʚ`�3��Xg���mK9�l�/vMxȶ�?@�+5����
����}4�s9���*�i^~��-��	]'f�)�h��\��T�UFʬ lBI�"{G�7�C����""> ��"ddddddy���`�X<M@�a��oW�?����;����MX�!�yDN!���4�!ŕ;���{_SƉ�Q96�_3�>\�1 �:M�D�p8��Ι�p���D� D���D�o�p4�D���M`]K7a�A�׏H`f�V��ԩR�Y@숒��%$�������D��'^����?��� �[c�A��S"ŭkZֱbŋ,Zֵ�l�3mu34���N�_�*bʕ0l  @j̇p��V'��=�����F��"|DJ�������k|�T�߈�>ʰ4��PS@p~�r�����A�0��.�C�����Q�jA<u��t���M�n=��02��%�!$�b%��&��
^�Ă;���W!V0g�0 ���>�$w�0���g�`�j��x��*�Ӄ�L�6,��C��Ԣd��V�@��Pܛd �6`�12����0̆bS�hl���B�S�?}�a���v��wq�Cy*{N�U�h�0�ߩ1n��bx�K��j�lZ�AНN�L(� �s;�P�S�7j3cZ&XhW`�@�2� �и9z���G8硡��������D�9��\�/s&�`�2�,K��DJ��q�������C������
��`hc����F8�6��j�A\DL�9M�ȃ�)��0A$2"H0�n�M8p���%*�2����P��B:�E6���l͂�R��u�rlNb��5��e�iA�
�cQ��c���ڜ9�E1��t7o��"AP�	 .dW7�"w����.���/%:�܅J�Rkxy��!B��Yb�j�,��.�p�!��$