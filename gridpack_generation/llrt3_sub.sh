SAMPLE=$1
MASS=$2

mkdir /grid_mnt/vol_home/llr/cms/portales/hhbbtautau/gridpack_bbtautau/${SAMPLE}_M${MASS}

cd /grid_mnt/vol_home/llr/cms/portales/hhbbtautau/bbtautau_gridpack/genproductions/bin/MadGraph5_aMCatNLO/

PYTHONPATH=$PYTHONPATH:/usr/lib64/python2.7/site-packages;\
./gridpack_generation.sh ${SAMPLE}_M${MASS} ../../../cards/${SAMPLE}_M${MASS}

mv ./${SAMPLE}* /grid_mnt/vol_home/llr/cms/portales/hhbbtautau/gridpack_bbtautau/${SAMPLE}_M${MASS}/
