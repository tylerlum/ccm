%%% 
%% Defining all physical constants
%  Yan Peng, UBC, 2016/10/24

function [the_constant] = constants(name)

m_pi = 3.14159265358979323846;
keySet =   {'M_E', 'M_LOG2E', 'M_LOG10E', 'M_LN2', ...
            'M_LN10', 'M_PI', 'M_TWO_PI', 'M_PI_2', ...
            'M_PI_4', 'M_1_PI', 'M_2_PI', 'M_2_SQRTPI', ...
            'M_SQRT2', 'M_SQRT1_2', 'P_Q', 'P_C', ...
            'P_K', 'P_H', 'P_EPS0', 'P_U0', ...
            'P_CELSIUS0'};
valueSet = [2.7182818284590452354,  1.4426950408889634074,  0.43429448190325182765, 0.69314718055994530942, ...
            2.30258509299404568402, m_pi,                   6.28318530717958647693, 1.57079632679489661923, ...
            0.78539816339744830962, 0.31830988618379067154, 0.63661977236758134308, 1.12837916709551257390, ...
            1.41421356237309504880, 0.70710678118654752440, 1.602176462e-19,        2.99792458e8,           ...
            1.3806503e-23,          6.62606876e-34,         8.854187817e-12,        (4.0e-7 * m_pi),        ...
            273.15];
const_map = containers.Map(keySet,valueSet);

the_constant = const_map(name);

end