###########################################################
# Change the following values to train a new model.
# type: the name of the new model, only affects the saved file name.
# dataset: the name of the dataset, as was preprocessed using preprocess.sh
# test_data: by default, points to the validation set, since this is the set that
#   will be evaluated after each training iteration. If you wish to test
#   on the final (held-out) test set, change 'val' to 'test'.
type=java-med-model
dataset_name=java-med
data_dir=/content/drive/MyDrive/java-med
data=${data_dir}/${dataset_name}
test_data=${data_dir}/${dataset_name}.val.c2s
model_dir=/content/drive/MyDrive/models

mkdir -p ${model_dir}
set -e
python3 -u /content/code2seq/code2seq.py -d ${data} -te ${test_data} -l ${model_dir}/model -s ${model_dir}/model
