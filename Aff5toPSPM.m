%% 23062020 - quick script to prepare affect5 EDA data for PSPM import

clear all
close all

%% Assuming input dir with folder per subject, outputdir
inputdir = 'inputdir\'
outputdir = 'outputdir\'

%% Params
V2microSiem = 10;           % Voltage to microSiemens, default is *10

%% Relevant files
MarkerFileNames = {'DIN_7_on', 'DIN_8_on', 'DIN_3_on_and_off_again'};       % filenames of all marker files
EDAFileName = 'skin';     % filename for EDA stream

%% get subfolders
input = dir(inputdir);
isub = [input(:).isdir]; 
Subj_folders = {input(isub).name}';
Subj_folders(ismember(Subj_folders,{'.','..'})) = [];
display([num2str(length(Subj_folders)) ' subject folders detected.'])

%% loop over folders
for foldernr = 1 : length(Subj_folders)
    display(['processing ' Subj_folders{foldernr}]);
    % open actual data
    CurrData = [];
    CurrData = dlmread([inputdir Subj_folders{foldernr} '\' EDAFileName '.tab']);
    % convert to microSiemens
    CurrData(:,2) = CurrData(:,2) .* V2microSiem;
    
    for markernr = 1 : length(MarkerFileNames)
        display(['processing ' Subj_folders{foldernr} 'marker ' MarkerFileNames{markernr} ]);
        markercolumn = [];
        markercolumn = zeros(length(CurrData),1);
        markerdata = [];
        % open marker file
        markerdata = dlmread([inputdir Subj_folders{foldernr} '\' MarkerFileNames{markernr} '.tab'] );
        % find all true values, toss everything else
        markerdata(markerdata(:,2) == 0,:) = [];
        markerdata(:,1) = floor(markerdata(:,1));
        markerdata(:,2) = [];
        % loop over nth marker within marker type
        for markernrnr = 1 : size(markerdata,1)
            loc = [];
            loc = find( CurrData(:,1) == markerdata(markernrnr));
            markercolumn(loc) = 1;
        end
        CurrData = [CurrData markercolumn];
    end
    display(['storing ' Subj_folders{foldernr}]);
    data = [];
    data = CurrData;
    save([outputdir Subj_folders{foldernr} '.mat'], 'data');
    display(['completed ' Subj_folders{foldernr}]);
    display([num2str(length(Subj_folders) - foldernr) ' files left...']);
end
display('syg, going home')

clear all

