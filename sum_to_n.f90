program sum_to_n
  implicit none
  integer(kind=8) :: n, i, total
  character(len=32) :: arg
  integer :: ios

  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    read(arg, *, iostat=ios) n
    if (ios /= 0) then
      print '(A)', 'Error: N must be an integer'
      stop 1
    end if
  else
    write(*, '(A)', advance='no') 'Enter N: '
    read(*, *) n
  end if

  total = 0
  do i = 1, n
    total = total + i
  end do

  print '(A,I0,A,I0)', '1 + 2 + ... + ', n, ' = ', total
end program sum_to_n
