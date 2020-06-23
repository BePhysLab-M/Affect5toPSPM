# Affect5toPSPM


convert Affect5 raw eda output to .mat which can be imported by pspm, transfer function not required if default lablinc V settings were used. 
e.g., import as, 
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.datafile = {'... .mat'};
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{1}.scr.chan_nr.chan_nr_spec = 2;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{1}.scr.sample_rate = 1000;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{1}.scr.scr_transfer.none = true;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{2}.marker.chan_nr.chan_nr_spec = 3;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{2}.marker.sample_rate = 1000;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{3}.marker.chan_nr.chan_nr_spec = 4;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{3}.marker.sample_rate = 1000;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{4}.marker.chan_nr.chan_nr_spec = 5;
matlabbatch{1}.pspm{1}.prep{1}.import.datatype.mat.importtype{4}.marker.sample_rate = 1000;
matlabbatch{1}.pspm{1}.prep{1}.import.overwrite = false;
