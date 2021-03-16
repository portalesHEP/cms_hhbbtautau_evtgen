# cms_hhbbtautau_evtgen
Pipeline for private signal MC generation within CMSSW

## Some additional packages required:

```
#First thing:
export SCRAM_ARCH=slc7_amd64_gcc700
cmsrel CMSSW_10_6_21/
cd CMSSW_10_6_21/src
git clone https://github.com/portalesHEP/cms_hhbbtautau_evtgen.git


# generator fragments and MadGraph utilities for gridpack generation
git clone git@github.com:cms-sw/genproductions.git

# Pythia fragment in correctly setup folder for "LHE->GEN" step
curl -s --insecure https://github.com/cms-sw/genproductions/blob/master/genfragments/ThirteenTeV/Higgs/HH/ResonanceDecayFilter_example_HHTo2B2T_madgraph_pythia8_CP5_cff.py --retry 2 --create-dirs -o Configuration/GenProduction/python/ResonanceDecayFilter_example_HHTo2B2T_madgraph_pythia8_CP5_cff.py [ -s Configuration/GenProduction/python/ResonanceDecayFilter_example_HHTo2B2T_madgraph_pythia8_CP5_cff.py ]
#

```


## gridpack_generation

General informations for gridpack generation with MadGraph:

https://twiki.cern.ch/twiki/bin/view/CMS/QuickGuideMadGraph5aMCatNLO

NOTE: gridpack generation requires CMSSW not to be set, and won't work otherwise. 

Madgraph datacards are generated for spin-0 (Radion) and spin-2 (Graviton) signals, produced through ggF or 'VBF' (is it really VBF here though??). 

Mass hypothesis from 250 GeV to 3 TeV are used.

Example cards are available here:

- Spin-0, VBF: https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/VBFToXToHH/VBFToRadionToHH_M
- Spin-0, ggF: https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/exo_diboson/Spin-0/Radion_hh_narrow/Radion_hh_narrow_M900
- Spin-2, VBF: https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/VBFToXToHH/VBFToBulkGravitonToHH_M
- Spin-2, ggF: https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/exo_diboson/Spin-2/BulkGraviton_hh_narrow/BulkGraviton_hh_GF_HH_narrow_M900


These can be used as an input to `getCards_allMassPoints.sh` to get all desired mass points. 

Once all cards are ready, the corresponding gridpacks can be generated using
```
genproductions/bin/MadGraph5_aMCatNLO/gridpack_generation.sh
```

`submit_gridpack_llrt3.sh` allows to call that script and run the gridpack generation on LLR t3.

## lhe_generation

LHE generation setup borrowed from:

https://github.com/NEUAnalyses/HHWWgg_Tools/tree/master/UL_Gridpacks

## lhe_to_AOD

Complete but outdated recipe:

https://twiki.cern.ch/twiki/bin/view/CMS/MbjaSamples#LHE_Text_Files_to_LHE

Official PdmV MC campains info:

https://twiki.cern.ch/twiki/bin/view/CMS/PdmVMcCampaigns


These two linked were used to define the `cmsDriver.py` definitions in `cmsRun_makeDrivers`. None of these worked "out of the box" for me, so I did some tweaking to make things work. I'll make sure that everything is fine with MC experts before launching the actual production.

The drivers should be called in order from 00 to 04. 05 should be used to generate NANOAOD, but I still need to actually write/test it.

