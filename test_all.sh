#!/bin/bash

# Download all data files 

# Start in the scripts folder (https://stackoverflow.com/a/246128)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

# Invoke each script (https://stackoverflow.com/a/8352939)
/bin/bash ./testCWRU_CNN.sh
/bin/bash ./testPU_CNN.sh
/bin/bash ./testMFPT_CNN.sh
/bin/bash ./testUoC_CNN.sh
/bin/bash ./testXJTU_CNN.sh
/bin/bash ./testSEU_CNN.sh
