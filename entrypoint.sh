#! /bin/bash

for opt in "$@" ; do

    case $opt in
        -c=*|--cmd=*)
            OPT_CMD="${opt#*=}"
            ;;
        *)
            # unknown option
    ;;
    esac

done

if [[ ! -z ${OPT_CMD} ]]; then
    echo "
cd /home/vivado/workdir
${OPT_CMD}
exit
" >> /home/vivado/.bashrc
fi    

 su - vivado
