#!/usr/bin/env bash

data_dir=$1
data_name=$(basename "${data_dir}")
data=${data_dir}/${data_name}
test=${data_dir}/${data_name}.val.c2s
run_name=$2
model_dir=/content/drive/MyDrive/models_py199kt-decoder
load_prefix=/content/drive/MyDrive/models_py199kt-embed2/model
save_prefix=${model_dir}/model
cuda=${3:-0}
seed=${4:-239}

mkdir -p "${model_dir}"
set -e
CUDA_VISIBLE_DEVICES=$cuda python -u /content/code2seq/code2seq.py \
  --data="${data}" \
  --test="${test}" \
  --save_prefix="${save_prefix}" \
  --load=${load_prefix} \
  --seed="${seed}" \
  --transfer=True
