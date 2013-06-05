%%%load notes of each file into the note.mat
clear all
cd D:\Ilya\FEBMAR_DATA\DATA


%%%load randompopwer CTRL

cd RANDOMPOWER_CTRL
filelist = dir;
for i = 1:length(filelist)-2
    cd(filelist(i+2).name)
    tempfile = fopen('notes.txt');
    for j = 1:5
        line{j} = fgets(tempfile);
    end
    fclose(tempfile);
    
    
    I_ctrl(i) = str2num(line{4}(strfind(line{4}, '(mA):')+5 : end))*0.32;
    xpos_ctrl(i) = str2num(line{5}(strfind(line{5}, 'x:')+2 : strfind(line{5}, 'y:')-1));
    ypos_ctrl(i) = str2num(line{5}(strfind(line{5}, 'y:')+2 : end));
    filename_ctrl{i} = filelist(i+2).name;
    
    if filelist(i+2).name(end-6) == 'R'
        side_ctrl{i} = 'R';
    else
        if filelist(i+2).name(end-6) == 'L'
            side_ctrl{i} = 'L';
        else
            side_ctrl{i} = 'N';
        end
    end
    
    
    cd ..
end 


cd ..
cd IBUPROFEN
filelist = dir;
for i = 1:length(filelist)-2
    cd(filelist(i+2).name)
    tempfile = fopen('notes.txt');
    for j = 1:5
        line{j} = fgets(tempfile);
    end
    fclose(tempfile);
    
    
    I_IBUPROFEN(i) = str2num(line{4}(strfind(line{4}, '(mA):')+5 : end))*0.32;
    xpos_IBUPROFEN(i) = str2num(line{5}(strfind(line{5}, 'x:')+2 : strfind(line{5}, 'y:')-1));
    ypos_IBUPROFEN(i) = str2num(line{5}(strfind(line{5}, 'y:')+2 : end));
    
    
        filename_IBUPROFEN{i} = filelist(i+2).name;
    
    if filelist(i+2).name(end-6) == 'R'
        side_IBUPROFEN{i} = 'R';
    else
        if filelist(i+2).name(end-6) == 'L'
            side_IBUPROFEN{i} = 'L';
        else
            side_IBUPROFEN{i} = 'N';
        end
    end
    
    cd ..
end 

cd D:\Dropbox\Ilya\Worm_Pain\Data_Ayalsis\3rd_data_analysis\Preprocessing
save note_IBUPROFEN I_IBUPROFEN xpos_IBUPROFEN ypos_IBUPROFEN filename_IBUPROFEN side_IBUPROFEN
save note_ctrl I_ctrl xpos_ctrl ypos_ctrl filename_ctrl side_ctrl
