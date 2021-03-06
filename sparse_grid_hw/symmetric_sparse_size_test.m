function symmetric_sparse_size_test ( )

%*****************************************************************************80
%
%% SYMMETRIC_SPARSE_SIZE_TEST tests SYMMETRIC_SPARSE_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2012
%
%  Author:
%
%    John Burkardt.
%
%  Local parameters:
%
%    Local, integer D, the spatial dimension.
%
%    Local, integer MAXK, the maximum level to check.
%
  test_num = 3;

  dim_test = [ 5, 5, 3 ];
  nodes1 = [ ...
   0.0, 0.0, 0.0, 0.0, 0.0, 1.0;
   0.0, 0.0, 0.0, 0.0, 1.0, 0.0;
   0.0, 0.0, 0.0, 1.0, 0.0, 0.0;
   0.0, 0.0, 1.0, 0.0, 0.0, 0.0;
   0.0, 1.0, 0.0, 0.0, 0.0, 0.0 ]';
  nodes2 = [ ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    1.0, 1.0, 1.0, 1.0, 1.0, ...
    1.73205; ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    1.0, 1.0, 1.0, 1.0, 1.73205, ...
    0.0, 0.0, 0.0, 0.0, 1.0, ...
    0.0; ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 1.0, 1.0, 1.0, 1.73205, ...
    0.0, 0.0, 0.0, 1.0, 0.0, ...
    0.0, 0.0, 0.0, 1.0, 0.0, ...
    0.0; ...
    0.0, 0.0, 0.0, 1.0, 1.0, ...
    1.73205, 0.0, 0.0, 1.0, 0.0, ...
    0.0, 0.0, 1.0, 0.0, 0.0, ...
    0.0, 0.0, 1.0, 0.0, 0.0, ...
    0.0; ...
    0.0, 1.0, 1.73205, 0.0, 1.0, ...
    0.0, 0.0, 1.0, 0.0, 0.0, ...
    0.0, 1.0, 0.0, 0.0, 0.0, ...
    0.0, 1.0, 0.0, 0.0, 0.0, ...
    0.0 ]';
  nodes3 = [ ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.0, 0.0, 0.741964, 1.0, 1.0, ...
    1.0, 1.0, 1.0, 1.0, 1.73205, ...
    1.73205, 1.73205, 2.33441; ...
    0.0, 0.0, 0.0, 0.0, 0.0, ...
    0.741964, 1.0, 1.0, 1.0, 1.73205, ...
    1.73205, 2.33441, 0.0, 0.0, 0.0, ...
    0.0, 1.0, 1.0, 1.73205, 0.0, ...
    0.0, 1.0, 0.0; ...
    0.0, 0.741964, 1.0, 1.73205, 2.33441, ...
    0.0, 0.0, 1.0, 1.73205, 0.0, ...
    1.0, 0.0, 0.0, 0.0, 1.0, ...
    1.73205, 0.0, 1.0, 0.0, 0.0, ...
    1.0, 0.0, 0.0 ]';
  r_test = [ 6, 21, 23 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SYMMETRIC_SPARSE_SIZE_TEST\n' );
  fprintf ( 1, '  Given a symmetric sparse grid rule represented only by\n' );
  fprintf ( 1, '  the points with positive values, determine the total number\n' );
  fprintf ( 1, '  of points in the grid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For dimension DIM, we report\n' );
  fprintf ( 1, '  R, the number of points in the positive orthant, and\n' );
  fprintf ( 1, '  R2, the total number of points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       DIM         R        R2\n' );
  fprintf ( 1, '\n' );

  x0 = 0.0;

  for test = 1 : test_num

    r = r_test(test);
    dim = dim_test(test);

    if ( test == 1 )
      r2 = symmetric_sparse_size ( r, dim, nodes1, x0 );
    elseif ( test == 2 )
      r2 = symmetric_sparse_size ( r, dim, nodes2, x0 );
    elseif ( test == 3 )
      r2 = symmetric_sparse_size ( r, dim, nodes3, x0 );
    end

    fprintf ( 1, '  %8d  %8d  %8d\n', dim, r, r2 );

  end

  return
end
