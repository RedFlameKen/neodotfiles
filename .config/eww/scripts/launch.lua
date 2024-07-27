
os.execute("killall eww")
os.execute("eww daemon")
os.execute("eww update vol_level=$(pactl get-sink-volume $(pactl get-default-sink) | awk -F '[//]' '{print $2}' | tr -d '\\ %')")
os.execute("eww open bar")

