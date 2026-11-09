! 程式名稱：sum_to_n
! 功能：計算 1 + 2 + ... + N 的總和
program sum_to_n
  implicit none                       ! 關閉隱含型別，所有變數都必須先宣告

  integer(kind=8) :: n, i, total      ! n: 上限；i: 迴圈變數；total: 累加結果（64 位元整數避免溢位）
  character(len=32) :: arg            ! 用來接收命令列參數的字串
  integer :: ios                      ! 讀取輸入時的狀態碼（0 表示成功）

  if (command_argument_count() >= 1) then      ! 若有命令列參數
    call get_command_argument(1, arg)          ! 取出第一個參數
    read(arg, *, iostat=ios) n                 ! 把字串轉成整數 n，狀態存入 ios
    if (ios /= 0) then                         ! 轉換失敗代表輸入不是整數
      print '(A)', 'Error: N must be an integer'   ! 印出錯誤訊息
      stop 1                                   ! 以錯誤碼 1 結束程式
    end if
  else                                         ! 沒有命令列參數時，改由鍵盤輸入
    write(*, '(A)', advance='no') 'Enter N: ' ! 印出提示且不換行
    read(*, *) n                               ! 從鍵盤讀入 N
  end if

  total = 0                                    ! 累加器歸零
  do i = 1, n                                  ! 從 1 迴圈到 N
    total = total + i                          ! 每次把 i 加進總和
  end do

  print '(A,I0,A,I0)', '1 + 2 + ... + ', n, ' = ', total   ! 輸出算式與結果
end program sum_to_n
