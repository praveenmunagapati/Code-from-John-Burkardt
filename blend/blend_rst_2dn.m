function x = blend_rst_2dn ( r, s, t, n, bound_rst )

%*****************************************************************************80
%
%% BLEND_RST_2DN extends vector data on faces into a cube.
%
%  Diagram:
%
%    010-----r10-----110        011-----r11-----111
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    0s0.....rs0.....1s0        0s1.....rs1.....1s1     S
%      |       .       |          |       .       |     |
%      |       .       |          |       .       |     |
%    000-----r00-----100        001-----r01-----101     +----R
%           BOTTOM                      TOP
%
%    011-----0s1-----001        111-----1s1-----101
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    01t.....0st.....00t        11t.....1st.....10t          T
%      |       .       |          |       .       |          |
%      |       .       |          |       .       |          |
%    010-----0s0-----000        110-----1s0-----100     S----+
%           LEFT                       RIGHT
%
%    001-----r01-----101        011-----r11-----111
%      |       .       |          |       .       |
%      |       .       |          |       .       |
%    00t.....r0t.....100        01t.....r1t.....11t     T
%      |       .       |          |       .       |     |
%      |       .       |          |       .       |     |
%    000-----r00-----100        010-----r10-----110     +----R
%           FRONT                       BACK
%
%  Discussion:
%
%    BLEND_RST_2DN is NOT equivalent to a trilinear finite element
%    method, since the data is sampled everywhere along the corners,
%    edges, and faces, rather than at a finite number of nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Gordon,
%    Blending-Function Methods of Bivariate and Multivariate Interpolation
%    and Approximation,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 1, March 1971, pages 158-177.
%
%    William Gordon and Charles Hall,
%    Transfinite Element Methods: Blending-Function Interpolation over
%    Arbitrary Curved Element Domains,
%    Numerische Mathematik,
%    Volume 21, Number 1, 1973, pages 109-129.
%
%    William Gordon and Charles Hall,
%    Construction of Curvilinear Coordinate Systems and Application to
%    Mesh Generation,
%    International Journal of Numerical Methods in Engineering,
%    Volume 7, 1973, pages 461-477.
%
%    Joe Thompson, Bharat Soni, Nigel Weatherill,
%    Handbook of Grid Generation,
%    CRC Press, 1999.
%
%  Parameters:
%
%    Input, real R, S, T, the (R,S,T) coordinates of the point
%    to be evaluated.
%
%    Input, integer N, the dimension of the vector space.
%
%    External, BOUND_RST, is a function which is given (R,S,T)
%    coordinates and an component value I, and returns XI, the value
%    of the I-th component of the N-vector at that point.  BOUND_RST
%    will only be called for "faces", that is, for values (R,S,T) where
%    at least one of R, S and T is either 0.0 or 1.0.  BOUND_RST has
%    the form:
%      function xi = bound_rst ( r, s, t, i )
%
%    Output, real X(N), the interpolated value at the
%    point (R,S,T).
%
  for i = 1 : n
%
%  Get the I-th coordinate component at the corners.
%
    x000 = bound_rst ( 0.0, 0.0, 0.0, i );
    x001 = bound_rst ( 0.0, 0.0, 1.0, i );
    x010 = bound_rst ( 0.0, 1.0, 0.0, i );
    x011 = bound_rst ( 0.0, 1.0, 1.0, i );
    x100 = bound_rst ( 1.0, 0.0, 0.0, i );
    x101 = bound_rst ( 1.0, 0.0, 1.0, i );
    x110 = bound_rst ( 1.0, 1.0, 0.0, i );
    x111 = bound_rst ( 1.0, 1.0, 1.0, i );
%
%  Get the I-th coordinate component at the edges.
%
    xr00 = bound_rst ( r, 0.0, 0.0, i );
    xr01 = bound_rst ( r, 0.0, 1.0, i );
    xr10 = bound_rst ( r, 1.0, 0.0, i );
    xr11 = bound_rst ( r, 1.0, 1.0, i );

    x0s0 = bound_rst ( 0.0, s, 0.0, i );
    x0s1 = bound_rst ( 0.0, s, 1.0, i );
    x1s0 = bound_rst ( 1.0, s, 0.0, i );
    x1s1 = bound_rst ( 1.0, s, 1.0, i );

    x00t = bound_rst ( 0.0, 0.0, t, i );
    x01t = bound_rst ( 0.0, 1.0, t, i );
    x10t = bound_rst ( 1.0, 0.0, t, i );
    x11t = bound_rst ( 1.0, 1.0, t, i );
%
%  Get the I-th component on the faces.
%
    x0st = bound_rst ( 0.0, s, t, i );
    x1st = bound_rst ( 1.0, s, t, i );
    xr0t = bound_rst ( r, 0.0, t, i );
    xr1t = bound_rst ( r, 1.0, t, i );
    xrs0 = bound_rst ( r, s, 0.0, i );
    xrs1 = bound_rst ( r, s, 1.0, i );
%
%  Interpolate the I-th coordinate component of the interior point.
%
    x(i) = blend_123 ( r, s, t, x000, x001, x010, x011, x100, x101, x110, x111, ...
      xr00, xr01, xr10, xr11, x0s0, x0s1, x1s0, x1s1, x00t, x01t, x10t, x11t, ...
      x0st, x1st, xr0t, xr1t, xrs0, xrs1 );

  end

  return
end
