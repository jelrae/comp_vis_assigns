function [ imOut ] = denoise(image, kernel_type, varargin)

switch kernel_type
    case 'box'
        imOut = imboxfilt(image, varargin{1});
%       varargin{1} denotes window size
    case 'median'
        imOut = medfilt2(image,[varargin{1} varargin{1}]);
%       second argument constructs [m n] matrix from varargin{1} input

    case 'gaussian'
%       varargin{1} denotes sigma, varargin{2} denotes window size,
%       Gauss2d => function G = gauss2D( sigma , kernel_size )
        imOut = imfilter(image, gauss2D (varargin{1}, varargin{2}) );
        
end
end
