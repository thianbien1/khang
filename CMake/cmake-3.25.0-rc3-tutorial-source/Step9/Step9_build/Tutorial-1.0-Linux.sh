#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step9...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ��gc �\t\�u��я�Z��;1k=�A�]i%ˤZKk�b���1���v���]��֖861G�f������'89N{h)i�Ӟ�cR
rM��&Ԅ��'��M
�Ѐ1��ޙ7�v��>Ĥ'Ɏ�|����;wf��vv�P&��C�a��|��7z���7�Dj�?���_��<>Cc �<���S�d�Z4��6M�c�r�g�0��HQ���d�dJ��&��w�R���X���ɘ���&�������]J'�����[��O�N{&��=�MM&Ҟh"�I+��&Ҟ�d��Cd�ʸү&�;B]ݑ����7ty�!�����xVf ���᎛:�=aϚus��G������t�'哯��M������Q������j���������@���������(_	�o��l�@_D�۽P�[~zS^�5�*�߃�@��;9����i�ю�W��y�~��M�Ώ���*3E�^��˴��LE=ڞ���9�T�#c3s����������Ӭggz�����c7S�53�2�ݗ�v29��!3��v���?M{�L��U�t2S��v�+G����b�Y̓w<���}M�uC�!5��mn�k
x�Io��i��Ԗm�dަ	�À\/f<����o<����q��Eo>~@�����AL�.�\/E�xB�>z��՟T��94��j����8�ǿk��aa��vo���e�[ؿ�W-�<ha��z�-��h�c�W���!�a�v�,�������~��?_��_l�����E�U�/@�PK��Pp?��xl�Zr5!���	L��Gz:p\I)jZSR=�CɄ��R���57o�N�Cq�J�W�H,����[(��P$֭����h
k����A>�h���hZ��dZK)��H���Pw������Tr/V{�CjGS�a%�un�і���FG�~�n���b�Q�B���vm�n���f5�Ơ�"	Uc^����՝��!2X��xDI��	pC�{|FG[���O�L#a�4��|�1���5bc�=��|ro�3Kf4}|| ��~���0���4�GR���F؁4A ?½��j"���4���񨃀�݆c�����:��'-	��FqTSFUh+�T"����(�(�j�-��u�d�;UhKk+n��Ж�ȦV\��6�֝;��"��m��;A$ ^{���F��"vX����We����ZA�)��?y&��m��|��?l����46�H�d��w
������z٨w��
�'������
���V�Y%i��o�%+�U�M;�g�?w�jyb]��1�=�������E:=#�Q��Y	GL��Ōs~�:��g&V��;������\\Ox����?#�>+�������	/|]%����٩@�w*/��{EX����N/�^!��R�|������3*�������
x��O	�K�	x������/��X��	�e�TJ�w��]������V�'��c,�Lk�����S�'h}������ �WPy������;��MQ�F���N����w�I�o|��3�r��e�����+)5�9��n�s)4�y���|ʯ0�*�/0x�m_M��.pޭ���0:/�6}<��������X� ��$�ߓ�����$����OJ�=�_�3?,���y��"����<<�?g:{�'��'��)�x��YM��3�]u-����Z���N�9���W �w�Q��N��'d��p�L��ׅ��:¶���_���2f�2w������6�`�Pfmox|�#d� �}Y����
03��<��!�.�<��v��I���PI.zA�������lf*�p^���������U���'BS�	���#�\�@'��'���� ���̨^�����Cbu����?C?X����Og^=O������<�3�Gu�%��.S�wy[x�x��O�p�%�e�Ybk|����d�P5�>Gj�vCӆ���k��N�����R�^�<�w��3����1pp�<ڑ)�j��s�#�0��O�~|y���)C�!7���5Fߞ�c�ǉ��x�a>�,���貘=�]���W�A��}��S������o�u�Ă;��\63;���-S���\"m5��қI�3Ys���d�'�v�����rꇆ�'��d*fC��[	g��Bȝ�N�ݻ?�cp&�=�k�R���Z�=f~X`af#�M����{��3�) ^L�. ���L�L9im�wvba�-x|�zAh�p�Yz��1��h8��p8�qD�Q`�D�ܕ#��{�y�T^8�<��SPq2�!�pf>��r������g��~J�0v��VA���2����YP:[��"^���?�����Zh��p�"�A����t�C A�H�v����C����7w`,Jw������^�PpG$�b�7�}7�̞�Oֵ�ݾ�<yf�\�>~ޡ]��[�ڳg۳o�e_��Wx��-���/����]�[���_
���^���{���/�R)�R)�R)���B�mQ��{v(���Lx����ʵ�Id����T<��3є�I%��'�uj���_ �Ւ�̧����o�r������9��:�mx]���%��r�@c@k��}@+���_�Z�k�t5Г@;�����@��L�g���Fݶe�+*�.��ف�=��VA�Q��?�پ
|��7A�{�����y{+��^���+��[��gr9q�����\�h%m}������Q���}��ZU>!�����ӊ�_��2��U̷���*��:[�Fh���٨!b�������˷C������ ����b�V����7�ꗃ��'��;��>2�0��{�Q�[��r��So��'x��0�
���r�k��j��ry&�!ת����|�î��-����9��]�6�<�\��\�M�J�7��j;�~u.g�����	{�/谽�9z����{�-��Ф]�(�R)�R)�R)�R)�ߧ�ϗ��$�K}�\�H;�fK�>�g؇~����g:�y�efq�l
?��?'��^�%	=���7�AvH��Uy���3+��R�3'�YR�;��ψb埯��~���yf|t���N���~���#�܇9�6]`��L1�x~F����ߗ�/y�X��	la���݌�0z��)F�0z��iFO2z��3<@ء7�F}�a�KP��)^���^�Y�ۗIh�o���g(翳������:~q��dY��n7΋�q�q�܌;Ѿ�x�q��r�0���c�+��2�s�x4�s��7���Ì�7�2�*�)��PK�yv�j�Ywyf|����E�:`ql)�/F�E�t��a`Zb�{f�2c�3�E�7��|}2�K�&&<�،� ��;���8Y��0�S�x�>-�+n:,e=mc���#e3�.�af�E�3F����Q����1�;���.���������s�?Ϭ�m���-F�V$�ɯ�����I���K��/����Β����pyܢ�Na\��8�~?٫�x�m1��:�-T�d��J�X���e��6����;�ܺ��/Ԙ�[��?bq��E�w���*�@�������Gq��k�� ;��*����B{���v�o���ߩ���{<������x��Y�_q��&�Ä�x�ß[�y۩Ǖ?o��Π�P��I/�+�~�.�ȟ)���~>��<�⍧��aagQ�>�S�Pa�����m�-���L�Z��k��5�X������~�l|���-/~m�(n������������:p�����������P>k�8F�^��x%��C8�%Si͌�XrxdHє�����/.D2TM��cXIh�1ԟ�+8��� ��D5�#썍��Ԍv��U�){մ�c�DZKebz�F{3�j�� 6�I��FU�CA�*p4�qE�#�OU��~æ`;�d�pDϮ�xsW�#�C��H�޲����u!�vӶ`G��L~�� M�0Z�a���P�	njႜ��1�+���ܼm��Ili"�JF#�x��P(��Ý�{p��?���n�m#=��$��\����ߏ��{�-=�%rX��	�I+�K��%�b�OX1��H�����L͐�M'� ���H���i3�
z�v�7��{��^�iC�ޓ<$i<�����V�]��
ky�<��$��k������i<�����V$����o�����.�$F�ׄ�		����jBSR� ��*��"}�}�P����K�O�q���C][�u�;$��a��9�Q�oKg����Ȗ!��H���|T��)c�XF��dh�y���`�.��WOV>9OO�;��<��ȠY$�^ҧA=O�,L5{���a-�V!J�����&���ϼ#�$�6&@}u(^��AS�E����7>��&t����=����.�E� �҈���;�di%���K�śJ�G�Wd���T��fb1��Ɣkt���'�n�_C��a���E^x"O�b�W����Z�
��E�~���įD��;��I�R�$}������}Ј�����Y�/�����\��q���|;M�?��=h����8=�*x�"��I>���|ߎ����<��#}����=N�%����{҆�s��(���D���d8������}ry�x�`����W����y�o#�#P�9���aI��STp��U�J������۞��QI��{r�H��I�|��Ӈ�#@�?OJ�|��*I^� ��!�0���)��Xҷ��+��I�|���Z�Y^�ߗ%}����jI^���C��)�M��_a��"�w�D6=_������k��+�Wۤ\o�o�~_�#�?���;�O��d��t�"������>��Dޖ����}1����R-ח��̢��}�k��V}*�-a�f� �^��?s��2�A�WJ��g���߳}�k$Y�TJ�TJ�T����Q� Z  