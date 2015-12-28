#!/bin/sh

. ./cross_envshtrih.sh

echo '**** BEGIN ****'
echo '$BASE='$BASE
echo '$CC='$CC

PLAY_START="$BASE/wav/elephant.wav"
PLAY_ER="$BASE/wav/dog_bark_x.wav"
PLAY_OK="$BASE/wav/cat_meow2.wav"


prenv='no'
if [ $prenv == 'yes' ]; then
  echo PREFIX=$PREFIX
  echo TARGET=$TARGET
  echo CROSS_COMPILE=$CROSS_COMPILE
  echo CC=$CC
  echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
  echo INSTALL_PATH=$INSTALL_PATH
  echo INSTALL_MOD_DIR=$INSTALL_MOD_DIR
  echo INCLUDES=$INCLUDES
  echo CFLAGS=$CFLAGS
  echo CXXFLAGS=$CXXFLAGS
fi

#   ---------------------------------------------
#   Prints execution status.
#
#   arg1 : Execution status
#   arg2 : Continue (0) or Abort (1) on error
#   ---------------------------------------------
status ()
{
       if [ $1 -eq 0 ] ; then
               echo "[SUCCESS]"
       else
               echo "[FAILED]"

               if [ $2 -eq 1 ]; then
                       cd $BASE
                       aplay $PLAY_ER
                       exit 1
               fi
       fi

}

#aplay $PLAY_START
echo 'cd to $BASE dir'
cd $BASE
status $? 1

WillBuildBysyBox='yes'
if [ $WillBuildBysyBox == 'yes' ]; then

  if [ 0 ]; then
    echo 'untar BusyBox'
    tar -C $BASE/sys1/ -xvzf $BASE/download/busybox-1.13.3-mini2440.tgz
    status $? 1
  fi
  
  cd $BASE/sys1/busybox-1.13.3
  status $? 1
  echo ""
  #echo make menuconfig for BusyBox
  #make ARCH=arm menuconfig
  #status $? 1
  #echo make
  #make
  #status $? 1
  
  echo install
  make install
  status $? 1
  echo ""
fi

WillOpenSSH='yes'
if [ $WillOpenSSH == 'yes' ]; then
  
  #echo untar openSSL
  #tar -C $BASE/sys1/ -xvzf $BASE/download/openssl-1.0.1p.tar.gz
  #status $? 1
  #cd $BASE/sys1/openssl-1.0.1p
  #status $? 1
  #echo ""
  
  #echo './configure'
  #./Configure dist --prefix=$BASE/sys1/openssl shared
  #status $? 1
  #echo ""
  
  #echo 'make ssl'
  #make CC="$CC" AR="${AR} r" RANLIB="${CROSS_COMPILE}ranlib"
  #status $? 1
  #echo ""
  
  #echo 'install ssl to tmpdir'
  #make install
  #status $? 1
  #echo ""
  
  echo "+++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++++++++++++++++++++++++++++++++++++++++++++"
  echo ""
  
  cd $BASE
  
  #echo untar ZLIB
  #tar -C $BASE/sys1/ -xvzf $BASE/download/zlib-1.2.8.tar.gz
  #status $? 1
  #echo ""
  
  #cd $BASE/sys1/zlib-1.2.8
  #status $? 1
  #echo ""
  
  #echo 'configure zlib'
  #./configure --prefix=$BASE/sys1/zlib
  #status $? 1
  #echo ""
  
  #cd $BASE/sys1/zlib-1.2.8
  #echo 'make'
  #make
  #status $? 1
  #echo ""

  #cd $BASE/sys1/zlib-1.2.8
  #echo 'make install'
  #make install
  #status $? 1
  #echo ""
  
  echo "+++++++++++++++++++++++++++++++++++++++++++++"
  echo "+++++++++++++++++++++++++++++++++++++++++++++"
  echo ""
  
  cd $BASE

fi

cd $BASE
aplay $PLAY_OK
echo '**** END ****'
