% Returns the model parameters according to the type
% Yan Peng, UBC, 2016/10/20

%Changed to a 45nm MOSFET model an added junction capacitance parameters
% Justin Reiher 2017/07/30

function [input_params] = mvs_model_params_45nmHP(type)

%% Define parameters for the model
% This is a 45nm mosfet model

switch(type)
    case 'n'
        input_params = struct('version',    1.10,       'type',  1,         ...
            'W',          450e-7,     'Lgdr',  45e-7,     ...
            'dLg',        3.75e-7,     'Cg',    2.837e-6, ...
            'etov',       1.67e-7,   'delta', 0.1370,    ...
            'n0',         1.4075,      'Rs0',   100.5558,     ...
            'Rd0',        100.5558,      'Cif',   1.9856e-12,   ...
            'Cof',        1.9856e-12,    'vxo',   1.2277,   ...
            'mu',         641.7222,  'beta',  1.8,       ...
            'Tjun',       298,        'phib',  1.2,       ...
            'gamma',      0.2,        'Vt0',   0.5496,       ...
            'alpha',      3.5,        'mc',    0.2,       ...
            'CTM_select', 1,          'CC',    0,         ...
            'nd',         3.053e-14,   'zeta',  1.0);
    case 'p'
        input_params = struct('version',    1.10,       'type',  -1,        ...
            'W',          450e-7,     'Lgdr',  45e-7,     ...
            'dLg',        3.75e-7,     'Cg',    2.837e-6, ...
            'etov',       1.67e-7,   'delta', 0.1637,    ...
            'n0',         1.4001,      'Rs0',   153.8674,     ...
            'Rd0',        153.8674,      'Cif',   1.9856e-12,   ...
            'Cof',        1.9856e-12,    'vxo',   1.0751,   ...
            'mu',         285.6056,       'beta',  1.6,       ...
            'Tjun',       298,        'phib',  1.2,       ...
            'gamma',      0.2,        'Vt0',   0.6252,       ...
            'alpha',      3.5,        'mc',    0.2,       ...
            'CTM_select', 1,          'CC',    0,         ...
            'nd',         0.0235,     'zeta',  1.0);
    case 'baseCap'
        input_params = 2.57e-6;
    otherwise
        input_params = struct('TNOM',        300,        'Wint',     5e-7,       ...
            'Lgdr',        45e-7,      'dLg',       3.75e-7,    ...
            'Xl',          -20e-9,     'Xw',       0,          ...
            'Xj',          1.4e-6,     'CjdTnom',  0.0005,  ...
            'Tjun',        298,        'Tcj',      0.001,   ...
            'PbdTnom',     1.0,       'Tpb',       0.005,  ...
            'CjswdTnom',   5e-10,     'Tcjsw',     0.001,  ...
            'PbswdTnom',   1.0,       'Tpbsw',     0.005,  ...
            'CjswgdTnom', 5e-10,      'Tcjswg',    0.001, ...
            'PbswgdTnom',  1.0,       'Tpbswg',    0.005, ...
            'Mjd',        0.5,        'Mjswd',    0.33,   ...
            'Mjswgd',     0.33,          'W',     450e-7);
        
        
        
end

end