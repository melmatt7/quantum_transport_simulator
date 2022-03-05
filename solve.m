function [E V]=solve(model,varargin)

switch model,
    case 'bandstructure',
        [E V]=solve_bandstructure(varargin);
    otherwise,
        disp('Not a defined model')
end