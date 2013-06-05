%%Load all the data and laser power into one file

clear all;
close all;

cd('..')

cd('.\Rawdata\IBUPROFENalldata')
filelist = dir;
for i = 1:length(filelist)-2
    data_IBUPROFEN{i} = load(filelist(i+2).name);
    filename2_IBUPROFEN{i} = filelist(i+2).name;
end
cd('..')

cd('.\IBUPROFENcentroids')
filelist = dir;
for i = 1:length(filelist)-2
    data_IBUPROFEN{i}.centroid = load(filelist(i+2).name);
end
cd('..')

cd('.\RANDOMPOWER_CTRLalldata')
filelist = dir;
for i = 1:length(filelist)-2
    data_ctrl{i} = load(filelist(i+2).name);
    filename2_ctrl{i} = filelist(i+2).name;
end
cd('..')

cd('.\RANDOMPOWER_CTRLcentroids')
filelist = dir;
for i = 1:length(filelist)-2
    data_ctrl{i}.centroid = load(filelist(i+2).name);
end
cd('..')


cd ..
cd Preprocessing

save data_IBUPROFEN  data_IBUPROFEN filename2_IBUPROFEN
save data_ctrl  data_ctrl filename2_ctrl
