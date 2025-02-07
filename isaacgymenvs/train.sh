DATE=`date '+%Y%m%d_%H%M'`
echo "Save as: " $DATE

# declare -a tasks=('FactoryTaskGears' 'FactoryTaskInsertion' 'FactoryTaskNutBoltPick' 'FactoryTaskNutBoltScrew')
# declare -a tasks=('FactoryTaskNutBoltPick')
declare -a tasks=('FactoryTaskInsertion')


mkdir -p log/$DATE
for i in ${!tasks[@]}; do
	# nohup python train.py task=${tasks[$i]} headless=True capture_video=True checkpoint='runs/FactoryTaskInsertion/nn/20220812165033/FactoryTaskInsertion.pth' wandb_activate=True wandb_entity=quantumiracle >> log/$DATE/${tasks[$i]}.log &
	nohup python train.py task=${tasks[$i]} headless=True capture_video=True checkpoint='runs/FactoryTaskInsertion/nn/20220817195332/FactoryTaskInsertion.pth' wandb_activate=True wandb_entity=quantumiracle >> log/$DATE/${tasks[$i]}.log &
	# nohup python train.py task=${tasks[$i]} headless=True capture_video=True wandb_activate=True wandb_entity=quantumiracle >> log/$DATE/${tasks[$i]}.log &
done


# python train.py task=FactoryTaskInsertion headless=False test=True checkpoint='runs/FactoryTaskInsertion/nn/last_FactoryTaskInsertionep8192rew\[-212.67\].pth'
# python train.py task=FactoryTaskInsertion headless=False test=True checkpoint='runs/FactoryTaskInsertion/nn/FactoryTaskInsertion.pth'