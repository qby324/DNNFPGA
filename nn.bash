#! /bin/bash -e

# Sat Jan  3 14:29:57 JST 2015
# shinot

xType=htkscp   # data type (input side of NN)
yType=arkiv    # data type (output side of NN)
ydat=ydat.arkiv # file to store train and development data made from alignment file (output side)
ytrain=$ydat   # utterances corresponding to xtrain are automatically extracted from this file
ydev=$ydat   # utterances corresponding to xvalid are automatically extracted from this file
rbmepoch=10    # number of epochs for RBM pretraining
bpepoch=15     # number of epochs for fine tuning
outdir=nn     # directory to store trained MLP etc
mvnormf=$outdir/nn.xnorm # file to store mean and variance for input normalization

# Check configurations
source vcheck.bash
vcheck "splice" $splice 
vcheck "ftrans0" $ftrans0
vcheck "st2idmap" $st2idmap
vcheck "xtrain" $xtrain
vcheck "alimlf" $alimlf
vcheck "mlf2arkiv" $mlf2arkiv 
vcheck "compmv" $compmv
vcheck "rbmtrain" $rbmtrain
vcheck "backprop" $backprop
vcheck "outputsize" $outputsize

mkdir -p $outdir

############ Makes Y data from alignment file ##########################
$mlf2arkiv $alimlf $st2idmap > $ydat

############ compute mean and variance for input normalization #########
$compmv $xtrain $mvnormf

############ RBM PRETRAINING ###########################################

echo \#\# RBM pretraining
cp -fp $ftrans0 $outdir/trans.0


# rbm 1st layer
rbmi=1
outsize=60
prev=$(($rbmi - 1))
$rbmtrain $xtrain $outsize --xType=$xType --spl=$splice --mvnf=$mvnormf --ft=$outdir/trans.${prev} --sd=1234 \
    --rt=gb --lr=0.002 --mm=0.9 --rgl=0.00001  --of=$outdir/rbm.$rbmi --wt=$outdir/trans.${rbmi} --ep=$rbmepoch

# rbm 2nd layer
rbmi=2
outsize=40
prev=$(($rbmi - 1))
$rbmtrain $xtrain $outsize --xType=$xType --spl=$splice --mvnf=$mvnormf --ft=$outdir/trans.${prev} --sd=1234 \
    --rt=bb --lr=0.002 --mm=0.9 --rgl=0.0001  --of=$outdir/rbm.$rbmi --wt=$outdir/trans.${rbmi} --ep=$rbmepoch

# rbm 2nd layer
rbmi=3
outsize=40
prev=$(($rbmi - 1))
$rbmtrain $xtrain $outsize --xType=$xType --spl=$splice --mvnf=$mvnormf --ft=$outdir/trans.${prev} --sd=1234 \
    --rt=bb --lr=0.002 --mm=0.9 --rgl=0.0001  --of=$outdir/rbm.$rbmi --wt=$outdir/trans.${rbmi} --ep=$rbmepoch

# output layer (random)
rbmi=4
outsize=$outputsize
prev=$(($rbmi - 1))
$rbmtrain /dev/null $outsize --xType=$xType --spl=$splice --mvnf=$mvnormf --ft=$outdir/trans.${prev} --sd=1234 \
    --rt=gb --lr=0.001 --mm=0.9 --rgl=0.00001  --of=$outdir/rbm.$rbmi --wt=$outdir/mlp.ini --at=softmax --ep=0

############ MLP FINETUNING ############################################
echo \#\# backprop
$backprop $outdir/mlp.ini $xtrain $ytrain --xType=$xType --spl=$splice --mvnf=$mvnormf --yType=$yType \
    --devX=$xdev --devY=$ydev --ep=$bpepoch --ot=c --lr=0.1 --mm=0.0 --rgl=0.0  --ofs=$outdir/mlp
(cd $outdir; rm -f mlp.final; ln -s mlp.$bpepoch mlp.final)

# clean temporaly file
rm $ydat
