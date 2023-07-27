#try to figure out what is wrong with the hdf5 file by reading in the csv file and saving it as 
##the hdf5 file??
##or alternatively see if the hdf5 file gives you the csv file as expected?
import pandas
reread = pd.read_hdf('./store.h5') 
