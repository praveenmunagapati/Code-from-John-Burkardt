function mertens_test ( )

%*****************************************************************************80
%
%% MERTENS_TEST tests MERTENS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MERTENS_TEST\n' );
  fprintf ( 1, '  MERTENS computes the Mertens function.\n' );
  fprintf ( 1, '\n'  );
  fprintf ( 1, '    N   Exact   MERTENS(N)\n' );
  fprintf ( 1, '\n' );
 
  n_data = 0;

  while ( 1 )

    [ n_data, n, c ] = mertens_values ( n_data );

    if ( n_data == 0 )
      break
    end

    c2 = mertens ( n );

    fprintf ( 1, '  %4d  %8d  %8d\n', n, c, c2 );

  end
 
  return
end
