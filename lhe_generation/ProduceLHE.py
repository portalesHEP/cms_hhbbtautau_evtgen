##-- Imports 
import os 
import time 

##-- Gridpack Params
gridpack_Type = 'GluGluToRadionToHH_narrow'
direc = '/grid_mnt/vol_home/llr/cms/portales/hhbbtautau/bbtautau_gridpack/gridpack_bbtautau/%s/'%(gridpack_Type)
gridpacks = ["%s/%s"%(direc, file) for file in os.listdir(direc) if file.endswith('tar.xz')]
print("gridpacks:",gridpacks)
nGridpacks = len(gridpacks)

os.system("mkdir LHE_Files/%s"%(gridpack_Type))
##-- LHE Production Parameters
nEvents = 10000
RandomSeed = int(time.time())
numberOfCPUs = 8

##-- Produce an LHE file for each gridpack 
for i, gridpack in enumerate(gridpacks):
    print("On Gridpack: %s / %s"%(i + 1, nGridpacks))
    gridpackName = gridpack.split('/')[-1].split('.')[0]
    
    print("gridpack Name:",gridpackName)
    print("gridpack Path:",gridpack)
    
    ##-- Unpack Gridpack Tarball
    UNPACK_TARBALL_COMMAND = "tar -xaf %s"%(gridpack)
    print("UNPACK_TARBALL_COMMAND:",UNPACK_TARBALL_COMMAND)
    os.system(UNPACK_TARBALL_COMMAND)
    
    ##-- Produce LHE file 
    RUN_GRID_COMMAND = "./runcmsgrid.sh %s %s %s"%(nEvents, RandomSeed, numberOfCPUs)
    print("RUN_GRID_COMMAND:",RUN_GRID_COMMAND)
    os.system(RUN_GRID_COMMAND)
    
    ##-- Move LHE file to output directory 
    MOVE_FILE_COMMAND = "mv cmsgrid_final.lhe LHE_Files/%s/%s.lhe"%(gridpack_Type, gridpackName)
    print("MOVE_FILE_COMMAND:",MOVE_FILE_COMMAND)
    os.system(MOVE_FILE_COMMAND)
    
print("DONE")
