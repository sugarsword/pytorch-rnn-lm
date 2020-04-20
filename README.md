# Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Changed the script: download_data.sh and preprocessed the new dataset
The new dataset is the collection of Bob Dylan's lyrics


Train a model:

    ./scripts/train.sh
Changed the script train.sh
Changed parameters to find the lowest PPL

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Table for training parameter changes:

| Number of epochs | Embedding size | Hidden size |  Dropout | Test loss | PPL |Time |
|---|---|---|---|---|---|---|
|40|200|200|0.5|4.66|105.69|433sec|
|40|100|100|0.5|4.69|108.58|228sec|
|40|200|200|0.6|4.67|106.58|425sec|
|40|300|300|0.5|4.62|101.79|714sec|
|40|400|400|0.5|4.63|102.32|1091sec|
|40|500|500|0.5|4.66|105.9|1694sec|
|40|300|300|0.7|4.65|104.29|777sec|
|40|300|300|0.4|4.65|104.39|717sec|
 

PPL drops as the embedding size increases from 100 to 300 but increases after 300.
The best parameters are: 40-300-0.5 (Epochs-Embedding-Dropout) 


Generate (sample) some text from a trained model with:

    ./scripts/generate.sh
    
Changed the script generate.sh

output in sample:
and the cloud is wrong . <eos> Song name : <unk> &apos; triggers Circled Till Tweedle Dum least Tweedle Dee                                                                 . <eos> There &apos;s gon one to get away now . <eos> Feel like she &apos;s gonna hot to get                                                                                any away , <eos> It was the dark same such a help jungle , <eos> It must get stoned .                                                                                       <eos> They &apos;re looking for an defeated , time you don &apos;t wanna tough the land . <eos> I didn                                                                      &apos;t understand , <eos> You &apos;re doing , I fell in the word , <eos> We really far at musta  

----------------
Part 2:
1) add new script in tools/examples/word_language_model: generate_with_strategy.py
2) change the install_packages.sh to install $examples from my fork of $examples (to get the new generate_with_strategy.py)
2) add new bash script in scripts: generate_with_strategy.sh
3) generated new sample with greedy strategy

the street . <eos> I &apos;m gonna <unk> , I &apos;m trying to get anywhere , <eos> I &apos;m gonna
stop at the world , I &apos;m trying to get to be anywhere . <eos> I &apos;m going in the                                            
morning , I &apos;m gonna go it from the land . <eos> I &apos;m going in the morning , I
&apos;m gonna go it from the land . <eos> I &apos;m gonna <unk> , I &apos;m trying to get closer                                     
, <eos> I &apos;m not sleepy and there is no place I &apos;m going to . <eos> Hey , Mr.
