# How to use [Current Ranger](https://lowpowerlab.com/guide/currentranger/)

Tested on macOS 11.6.3

## Setup

1. Install [grabserial](https://github.com/tbird20d/grabserial):
	1. `git clone https://github.com/tbird20d/grabserial.git`
	2. `cd grabserial && sudo python setup.py install`
2. Connect your currentranger for [safe use using a USB isolator](https://lowpowerlab.com/guide/currentranger/safety-and-proper-usage/), making a note of the device address once plugged in, e.g. `/dev/cu.usbmodem14101`
3. If using the scripts, update the `.sh` files with your device address
4. Switch on the currentranger
2. Set currentranger adc sampling to SLOW (`./send.sh s`)
3. Set currentranger to start USB logging (`./send.sh u`)
4. Check it's logging correctly (`./view.sh`), ctrl-c to exit

## Manual capture

1. Grab some data: `grabserial -d "/dev/cu.usbmodem14101" -e 10 -t -n > output.log`
	* `-d ...` - serial port
	* `-e 10`  - run for 10s
	* `-t`	 - show timestamp
	* `-n`	 - don't show delta between messages
	* `> output.log` - save output to `output.log`
3. Create a blank csv file: `echo "timestamp,current" > output.csv`
4. Manually clean `output.log`, checking for any garbled messages (first and last lines)
5. Pipe `output.log` into `output.csv`: `sed -e 's/[][]//g' -e 's/ /,/g' output.log >> output.csv`

## Scripted capture

1. Grab some data: `./record.sh` and check for any garbled messages
2. Process the data: `./process.sh`

## Analysis

1. Open `analysis.ipynb` and follow instructions
