function setup(varargin)
%SETUP run me at initialisation -- checks for a major indexing bug in matlab and initialises the paths
% setup(0) suppresses printout


if nargin==0
    show=1;
else
    show=varargin{1};
end

packages={'brml.*'};
if show
    disp('Importing packages:')
end
for i=1:length(packages)
    if show
        fprintf(1,'%s\n',packages{i})
    end
    import(packages{i})
end

if exist('matlabpath')
    clear p s
    p(1).t(1)=1; % check if there is a bug in this matlab version
    s(1)=1;
    p(2).t=s(:);
    p(2).t; % gives the right answer
    s(1)=2; % should change s only
    if p(2).t~=1
        disp('Your matlab JIT compiler is buggy. It has now been turned off');
        eval('feature accel off')
    end
end
t={'','graphlayout','data','DemosExercises'};
%t={'','data','DemosExercises'};

%p=pwd;
p=which('setup'); p=p(1:end-8);
if show
    disp('Adding paths:')
end
for i=1:length(t)
    addpath([p,'/' t{i}])
    if show
        disp([p,'\' t{i}]);
    end
end
addpath(genpath([p,'/minFunc_2012']))
%clear p s t
