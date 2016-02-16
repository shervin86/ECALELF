#! /bin/bash
#you should start from a file with only d and s
#call this script via script/step2_only_caller.sh
file=`basename $1 .dat`
invMass_type=$2
outDirData=~/scratch1/High_Mass/test/dato/
extension=${file}_${invMass_type}
region1=scaleStep0 
scenario=$3
initParameters1=$4
initParameters2=$5

echo $invMass_type ${extension} $scenario
echo "scenario is "$scenario
source script/functions.sh
source script/bash_functions_calibration_highMass.sh
###############################START TO COOK EVERYTHING#########################################################################################################

#Init, jobs, finalize
if [[ $scenario = "" ]];then
    echo "You should tell me what do you want to do: which is the scenario?"
fi

if [[ $scenario = "CatOnly" ]]; then
    echo "I am only categorizing"
    Categorize_region
fi

if [[ $scenario = "Test_job" ]]; then
    Test_1_job_highMass
fi

if [[ $scenario = "jobs" ]]; then
    Submit_50_jobs_highMass
fi

if [[ $scenario = "finalize_plots" ]]; then
    echo "you are finalizing the plots"
    Likelihood_Fitter_highMass
    Plot_data_MC_highMass
    Write_down_dat_corr_highMass
fi

if [[ $scenario = "slide" ]]; then
    #To be adapted
    echo "you want just to make the slides"
    Prepare_Slide_8_cat_profileOnly
    Prepare_Slide_8_cat
fi

#if [[ $scenario = "finalize" ]]; then
#    Likelihood_Fitter
#    Plot_data_MC
#    Write_down_root_corr
#    Prepare_Slide_8_cat
#fi
#
#if [[ $scenario = "closure" ]]; then
#    Write_down_root_corr
#    closure_test
#fi
#
#
#
#if [[ $scenario = "Full_Story" ]]; then
#    pileupHist
#    Cat_and_pileUpTrees
#    Test_1_job
#    Submit_50_jobs
#    Likelihood_Fitter
#    Plot_data_MC
#    Write_down_root_corr
#    closure_test
#    Prepare_Slide_8_cat
#fi