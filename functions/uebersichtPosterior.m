clear
iter = dir('X:\Covid\Kolibius_GCM_1_7_v*.mat');

for countr = 1:7
    params = {'n', 'N', 'm', 'out', 'sde', 'cap', 'Rin', 'Rou', 'trn', 'Tin', 'Ton', 'dev', 'sev', 'Tsy', 'Trd', 'fat', 'sur', 'tft', 'sen', 'del', 'tes'}';
    
allIter = [];
for it = 1:size(iter,1)
load([iter(it).folder, filesep, iter(it).name], 'GCM');
thisCountr = GCM{countr}.Ep

allIter(:,it) = structfun(@exp, thisCountr);
end
temp = num2cell(allIter);
allPost{countr} = cell2struct(temp, params,1);
end