# EE526_Project

### Image Convert
- figures/cropimg.py: cut to (720, 1280), turn to grayscale
- figures/convert_binary.py: write the binary values into txt
- figures/bin2jpg.py: regenerate the figure, from the one got from convert_binary.py
- figures/jpg2intensity.py: write the intensity into txt file
- figures/itensity2img.py: regenerate the figure, from the intensity array (use together with jpg2intensity.py)

### Makefile
- Makefile for simulation: test/result
- make compile
- make simulate: generate vcd file
- make display
- make clean


## Running ORB_SLAM3

### Version

Ubuntu 20.04

git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git

git checkout v0.4-beta (release 1.0 does not work on my computer)

Opencv: 4.5.0

Pangolin: v0.5

Eigen: 3.4.0

### running dataset

running in the ORB_SLAM3 directory:

Examples/Monocular/mono_euroc Vocabulary/ORBvoc.txt Examples/Monocular/EuRoC.yaml /home/rouwei/Documents/slam3/Datasets/EuRoc/MH1 Examples/Monocular/EuRoC_TimeStamps/MH01.txt 


## Gaussian Filter

### Parameter
Window size: 7*7 <br>
Sigma: 2 <br>
Matlab: h = fspecial('gaussian', [7 7], 2)

#### Gaussian Kernal

    0.0049    0.0092    0.0134    0.0152    0.0134    0.0092    0.0049
    0.0092    0.0172    0.0250    0.0283    0.0250    0.0172    0.0092
    0.0134    0.0250    0.0364    0.0412    0.0364    0.0250    0.0134
    0.0152    0.0283    0.0412    0.0467    0.0412    0.0283    0.0152
    0.0134    0.0250    0.0364    0.0412    0.0364    0.0250    0.0134
    0.0092    0.0172    0.0250    0.0283    0.0250    0.0172    0.0092
    0.0049    0.0092    0.0134    0.0152    0.0134    0.0092    0.0049

    
#### Gaussian Kernal * 1024 (2^10)
     5     9    14    16    14     9     5
     9    18    26    29    26    18     9
    14    26    37    42    37    26    14
    16    29    42    48    42    29    16
    14    26    37    42    37    26    14
     9    18    26    29    26    18     9
     5     9    14    16    14     9     5

