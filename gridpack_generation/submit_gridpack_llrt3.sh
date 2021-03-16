# produce gridpacks on llr t3 cluster
MASSES="250 260 270 280 300 320 350 400 450 500 550 600 650 700 750 800 850 900 1000 1250 1500 1750 2000 2500 3000"

SAMPLES="VBFToBulkGravitonToHH VBFToRadionToHH GluGluToRadionToHH_narrow GluGluToBulkGravitonToHH_narrow"

for sample in $SAMPLES
do
    for mass in $MASSES
    do
	/opt/exp_soft/cms/t3/t3submit -short ./llrt3_sub.sh ${sample} ${mass}
    done
done
