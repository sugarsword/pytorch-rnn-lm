#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/dylan

mkdir -p $data/dylan/raw

wget https://mulhod.github.io/bob_dylan_lyrics/full_lyrics_file_dumps/all_songs_with_metadata.txt
mv all_songs_with_metadata.txt $data/dylan/raw/lyrics.txt

# preprocess slightly

cat $data/dylan/raw/lyrics.txt | python $base/scripts/preprocess_raw.py > $data/dylan/raw/lyrics.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/dylan/raw/lyrics.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/dylan/raw/lyrics.preprocessed.txt

# split into train, valid and test

head -n 500 $data/dylan/raw/lyrics.preprocessed.txt > $data/dylan/valid.txt
head -n 1000 $data/dylan/raw/lyrics.preprocessed.txt | tail -n 500 > $data/dylan/test.txt
tail -n 3260 $data/dylan/raw/lyrics.preprocessed.txt > $data/dylan/train.txt
