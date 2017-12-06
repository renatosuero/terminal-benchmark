#!/bin/bash

MAX_RETRIES=100000
START=$(date +%s.%N)
// 6*42 + 48
for i in {1..100000}; do
  echo -e '\r';
  echo -e '\033[0K\033[1mBold\033[0m \033[7mInvert\033[0m \033[4mUnderline\033[0m';
  echo -e '\033[0K\033[1m\033[7m\033[4mBold & Invert & Underline\033[0m';
  echo;
  echo -e '\033[0K\033[31m Red \033[32m Green \033[33m Yellow \033[34m Blue \033[35m Magenta \033[36m Cyan \033[0m';
  echo -e '\033[0K\033[1m\033[4m\033[31m Red \033[32m Green \033[33m Yellow \033[34m Blue \033[35m Magenta \033[36m Cyan \033[0m';
  echo;
  echo -e '\033[0K\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m';
  echo -e '\033[0K\033[1m\033[4m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m';
  echo;
  echo -e '\033[0K\033[30m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m';
  echo -e '\033[0K\033[30m\033[1m\033[4m\033[41m Red \033[42m Green \033[43m Yellow \033[44m Blue \033[45m Magenta \033[46m Cyan \033[0m';
done
END=$(date +%s.%N)
echo "Coloured output test takes: " + $(echo "($END - $START)" | bc) + " seconds"
COLOURED_OUPUT=$(echo "(300 * $MAX_RETRIES) / ($END - $START)" | bc)


START=$(date +%s.%N)
for i in {1..100000}; do
  echo -e '\r';
  echo -e '🎫💋📂💣💒💁💀💳📄📕📦📷🔈🔙🔪🔻🔻🕊🕊🕛🕬🕽🖎🖎🖎🖍🖞🗀🗑🗢🗳🗡🗤🗣🗺🗻🗼🗽🗾🗿🗮🗝🗌🖻🖪🖙🖈🕷🕦🕕🔳🔢🔑🔀📯📞📍💼💫💚💉👸👧👖🐴🐣🐒🐁🏰🏟🏎🎽🎬🎛🎊🍹🍨🍗';
done
END=$(date +%s.%N)
echo "Unicode output test takes: " $(echo "($END - $START)" | bc) " seconds"
UNICODE_OUPUT=$(echo "(139 * $MAX_RETRIES) / ($END - $START)" | bc)


START=$(date +%s.%N)
for i in {1..100000}; do
  echo -e '\r';
  echo -e 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ';
done
END=$(date +%s.%N)
echo "Non-unicode output test takes: " $(echo "($END - $START)" | bc) " seconds"
NONE_UNICODE_OUPUT=$(echo "(118 * $MAX_RETRIES) / ($END - $START)" | bc)

test_output='';
START=$(date +%s.%N)
for x in {1..10}; do
  test_output="${test_output} a🎫"
  for i in {1..100000}; do
    echo -e '\r';
    echo -e $test_output;
  done
done
END=$(date +%s.%N)
echo "Mixed output test takes: " $(echo "($END - $START)" | bc) " seconds"
MIXED_OUPUT=$(echo "(165 * $MAX_RETRIES) / ($END - $START)" | bc)


echo "${COLOURED_OUPUT} coloured characters per second"
echo "${UNICODE_OUPUT} unicode characters per second"
echo "${NONE_UNICODE_OUPUT} none-unicode characters per second"
echo "${MIXED_OUPUT} Mixed characters per second"

