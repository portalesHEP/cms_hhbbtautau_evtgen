#Dummy script to copy a "model" card for different mass points

MASS="250 260 270 280 300 320 350 400 450 500 550 600 650 700 750 800 850 900 1000 1250 1500 1750 2000 2500 3000"

DEFMASS="320"
SAMPLE="VBFToBulkGravitonToHH"

for mass in $MASS
do
    for sample in $SAMPLE
    do
	mkdir ${sample}_M$mass

	cp -r ${sample}_M${DEFMASS}/${sample}_M${DEFMASS}_customizecards.dat ${sample}_M$mass/${sample}_M${mass}_customizecards.dat
	cp -r ${sample}_M${DEFMASS}/${sample}_M${DEFMASS}_extramodels.dat ${sample}_M$mass/${sample}_M${mass}_extramodels.dat
	cp -r ${sample}_M${DEFMASS}/${sample}_M${DEFMASS}_proc_card.dat ${sample}_M$mass/${sample}_M${mass}_proc_card.dat
	cp -r ${sample}_M${DEFMASS}/${sample}_M${DEFMASS}_run_card.dat ${sample}_M$mass/${sample}_M${mass}_run_card.dat

	find ./${sample}_M$mass/ -type f -exec sed -i 's/'${DEFMASS}'/'${mass}'/g' {} \;
	echo ${DEFMASS}' to '$mass
    done
done
