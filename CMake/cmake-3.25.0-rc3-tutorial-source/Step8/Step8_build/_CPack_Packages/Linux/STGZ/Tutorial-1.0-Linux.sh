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
CMake/Tutorial/Step8...

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
� ��gc �\tו~�,����q %�ߚ�����dl�l�b;%��,�mmlɑF�dC�֥�J]��lC���g�6��ݓ.ɦ�Y�C��,����ͶK���4	ui�5	A{ߛ�Fo�f�BwO�8���޽���;�7�N4�KE��CL����V꭫��TO�����[WS]WU'y�յ�>$�~�N��J���rgo(�	[ʝ-��C��OR��kH�]����h<�t�^�2�=|55g��j/�OU��������U#�sA��H����S]}�Կ-yWB�����O��s;�O%��ߑR�h��1��\��l����U�ϋ���֓��#�X!���&ݞJ()>@�R(����Fc=I�;����yUD���o
ljo�q���pÍ�$��7��G�lȭ7�6t��͟'uEc�N������S���	�?��V��k-��������q���T�����H�	����l:�@�#���j���S�Y?�G%�.G��pr"��i�^��W��x�^����т3��Ub�ȕ�sr�H_�a��)O��@�9����m3�\�?i�CT~���g�z�_��H]v#e�Y@��]���z���H���2w�_S#�S^��G3D�2RVާ@��{bݻ��g��#e�lE_��W��/R���+�}��w2����e�1�~c'�q��a���S�7e�������7�,�����16*�������e�B��Ki�a���gs�Ә����&�l3Ƿ"s���q;X������r<j����f!_e!��E��-p����(;�t�E��,�?c!ﲰ�i��',��[��=(�J��9h1�S?�āy�T#�e��\�!Y���d|�Ue���rDI(=Ѥ�$:Z��1�#�էhy�9�ll��%�*J�B��@�7��v�F�E�������%d5��I������+����xRM(�����#�}2Q���e�7�[�ƶ���9��I�+1�mC�����rxp���Vi���02+�xh�@wӆ�jY3P�'e�Uj�cQ�z�U�mݦ�x���58((�d<n������Te��w����v�K6�[�;��je�	�5`�o�=��T�<� ���r�\2��0�ģɋ�����XDޤ$�{pf�3a�;�p�rw(ڇ�	5�\�!U�BI��H��r_<¿qi.��ƾ���ұ������F���A��77�m���j���y-� ����*���U,����7�V���+;�*�����;E��Wz�n�el�͞��m�n���^�7�����S�gO���w�W����+��֯(���v|wyS׷�~{�>9?-�w�SK-������~����<z�ڈ/���W��K���E��o�?�F�����y8�p��p�ya���p�Q�����ç8����rw�z�*�p�n��E�v�P�Y� ���m�?o�p'�o��"���b��>���������8|6��rx	����R�p���p�>����q�~_��)�>��eK�	�Q�������W�������L�L�Od����r"O^�8��L&3Jx�輝�t�A���|Ῡ�N�?������.�/&|H�g�S:?��:?��^��M�+t���st���6�/#�NSZc��F��~��]i���������T���
���=����?*�%�#�C�������;��_��k���e��=)�}!&��q� *o�ksc�������z+��7#s���!<�R
�Gp�H�O0Yz:��
8�&x`���<rZ����3G��_L�7���P$J-���	��_Sgw�.�ɥЯ�����A�v;��������a�����	�S���΂k*����w|x�[ٮ�0�30�	����������ó�������i̠����|�ͻ��	��h9"�?���{D�٤}�����ޣrz� ��&磆ǘ��e��G ܏=9�s�܁'���m���P�|�ƃ�p���n`\��j����}����s4)b/����b���Y���ࣳHE����wO��h�����z|q�Vڄ.�_��u;q�^�gAp?�qg�d$X=�t����j��2W�A���,H|~�3�/�.5~���[o?��Wz��tjzx�)[��ۧ3iK�6ո[F��ȂǮ#CX�]��9t�V��?֍��>��br8c)���irSP�i��л����`�~&�}j�f���8��d+��ta#iפ��*^���^�eю�T��B\����s�.��esӤ��Β�����}�t��`�uL�(������=�[��0���T^8s���	�8\؛���Vy������O_��|BT=`���j̯;�[��'@�D�+0��>�>�����2(�4�X0��֣ Һ�y��Ӛ�n���H��z��K��>}Z0Ob7��c6`<����ߏw��L$f��c�����r��	�:;��8�o5.0��z<]Lf������'�������?~R���� �g��ڒ꼶��V`?�2 /�����7f��z�24�%���b,Mݚ�.�8t���C��m�(�͆�s����(������l�|.�>�a>��.?z����E�(>>��r]����٪��Á7l��2Z��~|N�tvdr�LғגIzo�H�^��p���'i����ϓI��>�2����j��9�JCgs�톎�����H���[�����&?�'(��{�r��~Ӓ>ђ>ޔ�mCf��ڂ+��~�����no��A>؝-�w��ӟ��)��)��)���FI�U.ݤ$��xLBnԙ�(�$$�R�]Ju�*R�T(�H�x\��ݐMJY;�I�$S�I�K�J߀��E�PL�Ƣj4�'m��	5��R�`��O�j�@�Ka�.������(t�m����0���}&s��T&3th1ܚG����~ۉLf�_x+���������3���t/�@��I�� �g����G�c@��}rx����l��v�&dt��.*�i8>�0���VMEd��j�������~�(u�+-��l���Ch͢U�U_}%�{�= u��;1���o㲾��1�Y��@���ƒ�m���S���B<-z�d	B���WS��@�@�
�a��;1����A9��r����w��9C~�?	����Z>��q���_rU����BV����co���@�#�)�ߖ��ȗaL�6.�q') �������S��ms����eЎ�����u��]����/;��HA���KΦR�
����E�K�����ROCi��Rimi��R���b���c�$�����.��<�iw�Ɓ�؝/9�?�`#Y3o��-����O��O��O��O��ί��*�|
;�7�i����S^?�@��Y�C�.;����,�<;+�΀��1�9���x�t&��=����!v���gg2�R���`��gZpbgh*�/-v�d�V���agF�ٗ�YF�b���^��Ύ�� �ܻ�~6
���n���<�s��]4�$�?�']v�ZL��~J�(�B� �C��R:F�>J�)=L�QJ�؏>zh�E��b� ���:s�Z3rd�w�>��5�|u���KG������Ϳ�x��˻�#W�z����{'�1V�KY�ظJ���J�Ԕ��]��TzS���W�q{j�ޥ~v��I�r�n�ϣq�~�݈�{Mq�>�x�>ߌx�>/�x�>^��}���|2��yg�gE�x	�L�R�1GT����K�1�s�uΈ�5=l�@����F|>
^a�/@�W����Ԉ_���F��t;`uf�_�d1��s�F��L��CF�����9 �g)���
��:R�b4ڐ-�u�:���i��F�s�s����&�sQ�d,w����Ͽ�r}���J���}��y�3��(�+�Zn,�)a�B�?[�W���GϘ�C3� q w��*�������~��;s�1Aq��v;������Oٰ+�Р߈�u⩛;��m8��f�C��(>��d�;;�z�]����|�"��9�x�R�-�㶄>���S������Z��\>b��-�W�v��=��~�k�]�~ba��B�V/���`�i���|} S�@��w[�C�������<��Y;.�6����O��b����̩��Z:�������?:5;��/R;{�x[K�Y��v<�Z{��~T(Y����q5Y�?n��@������W
�z5��YB�A����g&���_d��W-�g!_i��a�����/�������pBM���nwe�d�_���$��H\��w���O$�Pj���}��D����\vD�P"�&+15�u'B��I��o���*��Jc����A���]9U���Ѥ"�㱤�H��蕖zY�Ʊ	`k�$E��e��+z�6�C��Q4=�{�Q$�o�qmC����f-�D��V�1�4"J^���5 66�*y��N9�`�i��n�����y��E� �uы�qݺ�@��Ѱ�% ����|X��DBj*|�ƕ��K�  �{<���o�m]�ܶ��+���W�MU2��qE��+��WnmU���Р��J$�SI%r�K� QT��q?�0"���;2�P�ɸ�c��Ý%fM�=�(���6}ڝP�ݦqjZĕP{.�*�]�#M��O�,��X��`��b�ǲ^⼎�F6�X��hZ.6�d,�i����y�������"�V]4�*=	X-�J���]-]�@���xb�u%���\;����M6����$��~� C�P�N�dm�5�~?��G�
v��j�2=�GbZz�o:X��ۅ^��'�6����nM�"B����XlinԬ�#�Nn�WC]@a�!��]�1�@�X\U���{ ���n㠮T�/R�PM��A$�7��E�ȶ�Q5��l�N��J_ҫ�>{�_�{��"����D`�hq'��^�Vz�CIo$�堘pXV�ʀ*��5�U���`�Px�?
�5�0A����m�����'�o�=����w;X�	<����0Z}7��b��	���*���o�4�l��^��E�O�ߟ2�8�g���VP�m����������!�����پ9��������\a?Rl��������~$�>��@�C��<�پ%��(���im����&��}��~��S}����2:��_j��M�K�|���aI��=�>�We�%4��������+��6���O�g���~�Y�Jԟk�;��`�����%���~�#��!~(f� /���
�Vߏ�*�UA��73:h7ʋ�&�}iF�
�������i���~��\�/�æő�b��4�W�/�c���Q}���zl|��I|_XA7�&�R~�ͨ����<���$�K�B����=Y�|�Yt-_|����	��{`a�����O�u�߬G����w>������3�B�Y� .D}1�S�����y����	�?�?���e����u��*���joM��#]��P"�{���1yr�=����n�OnxI���evs���t�W��:&�z}M=�.~��F�P(�b���{���^b��K���K�Gȭs�\�xD��#�K��K�s�����9�^j�V���>s��Z�&���u�)��YU�'�2����lf\s�L��f��Pa�bE���ϣ1g��Ud
���~�[E>���V���|���d��!D�ie��=�h'v���s`�I�Y���qr]���_�v��Vvr���(ο v �c?H;�c���ځL�� ���R?fۇ����oܲ����EdzH��r2ÿc������w[��x�-�k�O�[ȧ,p�����"��6�}�����y��|�P���S����3�����!��=�ϔ�.ų��������f����hiű�<��_�����)N~����q����;�P��fĽ/�p���6s�+8|!���/��Y��`a��f�>[8y�}vs�p����%�-N��ÿka��8.��9��8�V[�e��e��~�8[�8�s�Wd�_���6��v>��w��N���n֕���+
���� IB�Χ��~���3�雥Ct�h3m�d�s}-v~�_To���rd��a��؉������0���#��K�vsyq�k%2o?�>�v��W�r��d�s5E�_.���U;2�����*G���>��t�on������;�>�2�Y����R��,��~V;w��7/���L��v��tB}�,��j�n���C�϶s�O��O�����~a" r  