while (/usr/bin/true); do
  OUTPUT=`bash core-describe.sh | grep StackStatus`
  if [[ $OUTPUT =~ .*_COMPLETE.* ]]; then
    echo $OUTPUT
    break
  else
   echo $OUTPUT
  fi

  sleep 1
done
