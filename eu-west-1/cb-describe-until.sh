while (/usr/bin/true); do
  OUTPUT=`bash cb-describe.sh | grep StackStatus`
  if [[ $OUTPUT =~ .*CREATE_COMPLETE.* ]]; then
    echo $OUTPUT
    break
  else
   echo $OUTPUT
  fi

  sleep 1
done
