.PHONY: baseline run1 run2 run3 run4 run5 run6 run7 run8

# Base output directory
OUTPUT_BASE = ../resultsCutmix



# Experiment 0: Baseline no cutmix
baseline:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
	--model convnext_tiny \
	--drop_path 0.1 \
	--batch_size 32 \
	--lr 4e-3 \
	--update_freq 128 \
	--model_ema false \
	--model_ema_eval false \
	--cutmix 0.0 \
	--mixup_prob 0.0 \
	--data_path sampleClasses \
	--output_dir $(OUTPUT_BASE)/baseline


# Experiment 1: alpha=0.1, mixup_prob=0.5
run1:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix 0.1 \
		--mixup_prob 0.5 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run1

# Experiment 2: alpha=0.1, mixup_prob=1.0
run2:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix 0.1 \
		--mixup_prob 1.0 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run2

# Experiment 3: alpha=0.5, mixup_prob=0.5
run3:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix 0.5 \
		--mixup_prob 0.5 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run3

# Experiment 4: alpha=0.5, mixup_prob=1.0
run4:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix_alpha 0.5 \
		--mixup_prob 1.0 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run4

# Experiment 5: alpha=1.0, mixup_prob=0.5
run5:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix_alpha 1.0 \
		--mixup_prob 0.5 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run5

# Experiment 6: alpha=1.0, mixup_prob=1.0
run6:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix_alpha 1.0 \
		--mixup_prob 1.0 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run6

# Experiment 7: alpha=2.0, mixup_prob=0.5
run7:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix 2.0 \
		--mixup_prob 0.5 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run7

# Experiment 8: alpha=2.0, mixup_prob=1.0
run8:
	python -m torch.distributed.launch --nproc_per_node=1 main.py \
		--model convnext_tiny \
		--drop_path 0.1 \
		--batch_size 32 \
		--lr 4e-3 \
		--update_freq 128 \
		--model_ema false \
		--model_ema_eval false \
		--cutmix 2.0 \
		--mixup_prob 1.0 \
		--data_path sampleClasses \
		--output_dir $(OUTPUT_BASE)/run8
