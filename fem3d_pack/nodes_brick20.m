function p = nodes_brick20 ( )

%*****************************************************************************80
%
%% NODES_BRICK20 returns the natural coordinates of the BRICK20 element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real P(3,20), the coordinates.
%
  p = [ ...
    -1.0, -1.0, -1.0; ...
    +1.0, -1.0, -1.0; ...
    +1.0, +1.0, -1.0; ...
    -1.0, +1.0, -1.0; ...
    -1.0, -1.0, +1.0; ...
    +1.0, -1.0, +1.0; ...
    +1.0, +1.0, +1.0; ...
    -1.0, +1.0, +1.0; ...
     0.0, -1.0, -1.0; ...
    +1.0,  0.0, -1.0; ...
     0.0, +1.0, -1.0; ...
    -1.0,  0.0, -1.0; ...
    -1.0, -1.0,  0.0; ...
    +1.0, -1.0,  0.0; ...
    +1.0, +1.0,  0.0; ...
    -1.0, +1.0,  0.0; ...
     0.0, -1.0, +1.0; ...
    +1.0,  0.0, +1.0; ...
     0.0, +1.0, +1.0; ...
    -1.0,  0.0, +1.0 ]';

  return
end
