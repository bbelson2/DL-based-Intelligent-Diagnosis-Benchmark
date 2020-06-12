#!/bin/bash

# Download all data files 

# Start in the scripts folder (https://stackoverflow.com/a/246128)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

# Invoke each script (https://stackoverflow.com/a/8352939)
/bin/bash ./trainCWRU_CNN.sh
/bin/bash ./trainPU_CNN.sh
/bin/bash ./trainMFPT_CNN.sh
/bin/bash ./trainUoC_CNN.sh
/bin/bash ./trainXJTU_CNN.sh
/bin/bash ./trainSEU_CNN.sh
