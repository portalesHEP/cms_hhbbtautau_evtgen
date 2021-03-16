#!/bin/sh

PROCESS="GluGluToRadionToHH_narrow"
MASS="900"
FILEIN="./baseLHE/"${PROCESS}_M${MASS}".lhe"
FILEOUT="./lhe2MINIAOD/"${PROCESS}_M${MASS}.00.LHEGENSIM.root

FRAGMENT_PATH="Configuration/GenProduction/python/"
FRAGMENT=${FRAGMENT_PATH}ResonanceDecayFilter_example_HHTo2B2T_madgraph_pythia8_CP5_cff.py

CONDITIONS="106X_upgrade2018_realistic_v4"
BEAMSPOT="Realistic25ns13TeVEarly2018Collision"
GEOMETRY="DB:Extended"
ERA="Run2_2018"

cmsDriver.py \
    $FRAGMENT \
    --filein file:${FILEIN} \
    --fileout file:${FILEOUT} \
    --mc \
    --eventcontent RAWSIM \
    --datatier GEN \
    --conditions $CONDITIONS \
    --beamspot $BEAMSPOT \
    --step GEN,SIM \
    --geometry $GEOMETRY \
    --era $ERA \
    -n 100 \
    --nThreads 8

#    --no_exec
