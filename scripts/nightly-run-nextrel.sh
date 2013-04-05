#!/bin/bash

SCRIPT_NAME=nightly-run-nextrel
BUILD_TYPE=nextrel

BDE_CORE_BRANCH=remotes/origin/master
BDE_BB_BRANCH=remotes/origin/master

CORE_UORS="bsl bst bde bbe bce bae bte"
BB_UORS="dev bsi zde a_bdema a_bteso a_xercesc e_ipc z_a_bdema bap a_comdb2 z_bae a_cdrcache"

ALL_UORS="$CORE_UORS $BB_UORS"

# redirect outputs so we can track failures - nysbldo2 does
# not mail cron job results
exec > ~bdebuild/logs/log.$SCRIPT_NAME.`date +"%Y%m%d-%H%M%S"` 2>&1

TOOLSPATH=$(dirname $0)/..
SCRIPT_PATH=$TOOLSPATH/scripts

export TOOLSPATH SCRIPT_PATH SCRIPT_NAME BUILD_TYPE BDE_CORE_BRANCH BDE_BB_BRANCH
export CORE_UORS BB_UORS ALL_UORS

$SCRIPT_PATH/nightly-run-common-script.sh
