# Learning Guide
Setup your environment variables like PATH and maybe other things
```
source /tools/Xilinx/Vitis/2024.1/settings64.sh
```
Navigate to a folder you want to contain your Vivado project in
```
cd $PROJECT_PATH
```
Launch the Vivado GUI
```
vivado &
```
## Board File
Clone the Avnet BDF repo
```
git clone git@github.com:Avnet/bdf.git
```
 Copy the au15p board folder to Xilinx boards sub-folder
```
cp -R bdf/aub15p /tools/Xilinx/Vivado/2024.1/data/boards/board_files/
```
If permission was denied, you're probably using a user account\
re-run the copy command as `sudo cp`
```
sudo cp -R bdf/aub15p /tools/Xilinx/Vivado/2024.1/data/boards/board_files/
```
If on a user account, you need to ensure this new folder is accessible to you \
so when you launch Vivado, it can read it. Change the owner of the folder to you
```
sudo chown $YOUR_USERNAME -R /tools/Xilinx/Vivado/2024.1/data/boards/board_files
```



