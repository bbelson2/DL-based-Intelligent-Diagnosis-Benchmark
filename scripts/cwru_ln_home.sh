# On the first wsl Ubuntu (20.04) and on the Alienware, /vann is a root folder
# cd /vann/data/

# On WSL 22.04, /vann is a folder in the home directory
cd ~/vann/data/


mkdir -p dlb
cd dlb
mkdir -p cwru
cd cwru
mkdir -p 'Normal Baseline Data'
cd 'Normal Baseline Data'
for f in '97.mat' '98.mat' '99.mat' '100.mat'
do
    ln -sf ~/vann/data/cwru/${f} ./${f}
done
cd ..

mkdir -p '12k Drive End Bearing Fault Data'
cd '12k Drive End Bearing Fault Data'
for f in '105.mat' '106.mat' '107.mat' '108.mat' '118.mat' '119.mat' '120.mat' '121.mat' '130.mat' '131.mat' '132.mat' '133.mat' '169.mat' '170.mat' '171.mat' '172.mat' '185.mat' '186.mat' '187.mat' '188.mat' '197.mat' '198.mat' '199.mat' '200.mat' '209.mat' '210.mat' '211.mat' '212.mat' '222.mat' '223.mat' '224.mat' '225.mat' '234.mat' '235.mat' '236.mat' '237.mat' 
do
    ln -sf ~/vann/data/cwru/${f} ./${f}
done
cd ..

mkdir -p '12k Fan End Bearing Fault Data'
cd '12k Fan End Bearing Fault Data'
for f in '278.mat' '279.mat' '280.mat' '281.mat' '282.mat' '283.mat' '284.mat' '285.mat' '294.mat' '295.mat' '296.mat' '297.mat' '274.mat' '275.mat' '276.mat' '277.mat' '286.mat' '287.mat' '288.mat' '289.mat' '309.mat' '310.mat' '311.mat' '312.mat' '270.mat' '271.mat' '272.mat' '273.mat' '290.mat' '291.mat' '292.mat' '293.mat' '315.mat' '316.mat' '317.mat' '318.mat'
do
    ln -sf ~/vann/data/cwru/${f} ./${f}
done
cd ..

mkdir -p '48k Drive End Bearing Fault Data'
cd '48k Drive End Bearing Fault Data'
for f in  '109.mat' '110.mat' '111.mat' '112.mat'  '122.mat' '123.mat' '124.mat' '125.mat' '135.mat' '136.mat' '137.mat' '138.mat' '174.mat' '175.mat' '176.mat' '177.mat' '189.mat' '190.mat' '191.mat' '192.mat' '201.mat' '202.mat' '203.mat' '204.mat' '213.mat' '214.mat' '215.mat' '217.mat' '250.mat' '251.mat' '252.mat' '253.mat' '262.mat' '263.mat' '264.mat' '265.mat' 
do
    ln -sf ~/vann/data/cwru/${f} ./${f}
done
cd ..

# not used
# '144.mat' '145.mat' '146.mat' '147.mat' '148.mat' '149.mat' '150.mat' '151.mat' '156.mat' '158.mat' '159.mat' '160.mat' '161.mat' '162.mat' '163.mat' '164.mat' '226.mat' '227.mat' '228.mat' '229.mat' '238.mat' '239.mat' '240.mat' '241.mat' '246.mat' '247.mat' '248.mat' '249.mat' '258.mat' '259.mat' '260.mat' '261.mat' '298.mat' '299.mat' '3001.mat' '3002.mat' '3003.mat' '3004.mat' '3005.mat' '3006.mat' '3007.mat' '3008.mat' '300.mat' '301.mat' '302.mat' '305.mat' '306.mat' '307.mat' '313.mat' 
