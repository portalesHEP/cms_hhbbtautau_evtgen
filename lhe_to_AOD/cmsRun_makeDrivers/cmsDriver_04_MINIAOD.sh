#!/bin/sh

PROCESS="GluGluToRadionToHH_narrow"
MASS="900"
FILEIN="./lhe2MINIAOD/"${PROCESS}_M${MASS}.03.RECO.root
FILEOUT="./lhe2MINIAOD/"${PROCESS}_M${MASS}.04.MINIAOD.root

FRAGMENT_PATH="Configuration/GenProduction/python/"
FRAGMENT=${FRAGMENT_PATH}ResonanceDecayFilter_example_HHTo2B2T_madgraph_pythia8_CP5_cff.py

#CONDITIONS="106X_upgrade2018_realistic_v4"
CONDITIONS="106X_upgrade2018_realistic_v11_L1v1"
BEAMSPOT="Realistic25ns13TeVEarly2018Collision"
GEOMETRY="DB:Extended"
ERA="Run2_2018"

PILEUP_INPUT="dbs:/Neutrino_E-10_gun/RunIISummer20ULPrePremix-UL18_106X_upgrade2018_realistic_v11_L1v1-v2/PREMIX"

cmsDriver.py \
    step1 \
    --filein file:${FILEIN} \
    --fileout file:${FILEOUT} \
    --mc \
    --eventcontent MINIAODSIM \
    --datatier MINIAODSIM \
    --runUnscheduled \
    --conditions $CONDITIONS \
    --step PAT \
    --nThreads 4 \
    --geometry $GEOMETRY \
    --era $ERA \
    -n 100 \
#    --no_exec
