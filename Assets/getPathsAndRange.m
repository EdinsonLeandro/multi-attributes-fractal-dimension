function [paths, ranges] = getPathsAndRange(names, full)
% Select folder location and range (minimum and maximum values) of
% specified input "names".
%
% Input:
% names= Type: Cell array. Seismic data names.
% full= Type: Logical. Switch between full data or test data

% Select the folder name to get data.
if full
    folder = "Cropped_2250ms-3200ms";
else
    folder = "Inline_900-903";
end

% Create array of paths and join using "/" to create relative paths
paths = ['Data', folder, 'Cosine_phase.segy'; ...
         'Data', folder, 'Instantaneous_amplitude.segy'; ...
         'Data', folder, 'Instantaneous_bandwidth.segy'; ...
         'Data', folder, 'Instantaneous_frecuency.segy'; ...
         'Data', folder, 'Second_derivative.segy'; ...
         'Data', folder, 'real_amp_EM.segy'];

paths = join(paths, '/');

% All Seismic attributes names. Sorted alphabetically.
alldataNames = {'cosine of phase', 'instantaneous amplitude', ...
                'instantaneous bandwidth', 'instantaneous frequency', ...
                'second derivative', 'seismic amplitude'};

% All Seimic data range (minimum and maximum values). 
% It was extracted from Textual header. Data between the time window under study.
% Format -> [min, max]
allRanges = [[-1.00, 1.00]; [0.0, 3704.38]; [0.0, 125.0]; ...
             [0.0, 125.0]; [-4827.35, 5291.98]; [-4827.35, 5291.98]];

% Lowercase of names
names = lower(names);

% Give "true" if the element in "alldataNames" is a member of "names".
indexes = ismember(alldataNames, names);

% Select only desired paths. Transpose and convert to cell array.
paths = cellstr( paths(indexes).' );

% Select ony desired ranges.
ranges = allRanges(indexes, :);
end