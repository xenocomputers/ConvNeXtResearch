'''
File name: selectRandomClasses.py
Author(s): Aarohan Mishra
'''
import sys
import shutil
import os
from pathlib import Path
import random


def main():
    # Define paths to directories we need to create
    sampleDir = Path('sampleClasses')
    sampleTrainPath= Path('sampleClasses/train')
    sampleValPath= Path('sampleClasses/val')
    # Check to delete the contents of the previous randomly selected directories if they exist to ensure a fixed number of classes are there
    if sampleDir.exists() is False:
        sampleDir.mkdir()
    if sampleTrainPath.exists():
        shutil.rmtree(sampleTrainPath)
    if sampleValPath.exists():
        shutil.rmtree(sampleValPath)

    # Create directories if they do not already exist
    if sampleTrainPath.exists() is False:
        sampleTrainPath.mkdir()
    if sampleValPath.exists() is False:
        sampleValPath.mkdir()

    # Define paths to the imagenet-mini data we need to read from
    mainTrainPath = Path('imagenet-mini/train')
    mainValPath = Path('imagenet-mini/val')

    # Get contents of the training directory, define values needed for loop later on
    trainContents = os.listdir(mainTrainPath)
    maxVal = len(trainContents)
    selectedIndices = []
    # Loop to make note of index positions of any hidden files, as these appear from os.listdir
    for i in range(maxVal):
        if '.' in trainContents[i]:
            selectedIndices.append(i)
            # break
    
    # Main Loop
    for _ in range(100):
        idx = random.randint(0, maxVal)
        # Keep looping if needed until we get an index value we have not already encountered
        while idx in selectedIndices:
            idx = random.randint(0, maxVal)
        selectedIndices.append(idx)
        selectedClass = trainContents[idx]
        # print(selectedClass)
        # Create paths to copy
        tmpTrainPath = Path(mainTrainPath.joinpath(selectedClass))
        tmpSampleTrainPath = Path(sampleTrainPath.joinpath(selectedClass))
        tmpValPath = Path(mainValPath.joinpath(selectedClass))
        tmpSampleValPath = Path(sampleValPath.joinpath(selectedClass))
        tmpSampleTrainPath.mkdir()
        tmpSampleValPath.mkdir()
        # Check if there is a discrepancy
        if Path.exists(tmpTrainPath) is False or Path.exists(tmpValPath) is False:
            print(f"Critical issue: {selectedClass} only appears in either train or val")
            sys.exit()
        # Copy the directories
        shutil.copytree(tmpTrainPath, tmpSampleTrainPath, dirs_exist_ok= True)
        shutil.copytree(tmpValPath, tmpSampleValPath, dirs_exist_ok= True)
        # return
    input("Press ENTER to end program") # Meant to serve as an indication the program has finished executing


if __name__ == '__main__':
    main()