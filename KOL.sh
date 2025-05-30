#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'hiddify.sh' encrypted at Mon Apr 21 01:15:13 +0330 2025
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
skip=76
set -e

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
BZh91AY&SYղ�� G_�@}����N�����`~��l)Oo�!D��LJmF�2 Ѧ�� 4  2d�b`ɂd ф``�4��P�        O�T�   ��� 4A14M#M��2z!��@�ѡ��B2S�
zdИS4&��zF�<��ԄG�W���N�P��S&	i�-����
I����w��O�N!η`��3膉�4�Q�,@X!�A��c���,�C��21,�0)����|������o���hh[�z)'�P�ҔM�̆�%h��@� ��M�έ�i
РҚO���-s�x���G~mĠ^���a�3�c^�(�N��ۏM�c#��{L�4�q.�:�%�+�@!2��>)X���s(.��s$��d��T���BS�I��/�~1�J�Dq3Ud"H.�H��D���p�@���#	$@�O�&�p\�p\�D�.;�>�:';_��5R���w��p��f}X�C�x�M�%�'� y`⟢I�M�י�q*'s������Q �Q�;@��yjӮr&�lO�{Na�]�gJ$
嗅���(6��T�j����+�!���[cp5��%F(���%�%�Pb�z�q�������6�y=���)i6h{�7LLM&!  !B� ś堉�����D�"g0-�@   F4���%"@/G������:���-;JL@/^c��e2kf@8�:���� �����ޓ�<Ӎ
�9��z�X[��7�����R��D���:�:�HHP����;[qm썬R�R����6��Y��D�2�S o�$'�	�<Tv@�.BЗ�T��:�Lx���F�\�C>�b�VeX�nP\�F$�dQS��$LTL8c���un�*k�B�2 �k(���ohk%Ѡ�`��P���G��D��	����(i޲f� �;DMB�߿Xa'U�S #S��ZX\���2s������8L �7%�(�G��P9�f�S4�]��an��dA�dY����a恁�������A�Ϲ�[e��Ɔz�e���P�X>��i(Ư��8!̗�'��_�p�q-$�N /e�I۶U(������Uh��"f����8�܈;��4�(F�% �Ǥ�;<�y�������L#��u�@�@�C>����x�/t�AHwFaM�R��4&��ܫCj���7!K.�I�D��59��ܼ�E-r���}R$���4�ǸD���M@�S��i�лk���X/?��$$$�!B��RX�AAAAAAC"�K�?�ܑN$5l��@