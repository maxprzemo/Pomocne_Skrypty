#!/system/bin/sh

VFS=0         # <<<<<<<<<<<<<<< Tu wpisz wartość początkową vfs_cache_pressure

VFSstep=500   # <<<<<<<<<<<<<<< Tu wpisz wartość o jaką będzie zmieniane vfs_cache_pressure

VFSEnd=10000  # <<<<<<<<<<<<<<< Tu wpisz wartość końcową vfs_cache_pressure

# Uruchomienie aplikacji Aparat
camera() {
	am start -n com.lge.camera/.CameraAppLauncher 1> /dev/null
}

killer_app() {
	KillCamera=$(ps | grep com.lge.camera | awk '{print $2}')
		while (($KillCamera!=0)); do
		ps | grep com.lge.camera | awk '{print $2}' | xargs kill
		done
	}


test_eight() {
	target=$1
case "$target" in
	"8" )
  camera
  sleep 1
  killer_app
  sleep 5
        ;;
esac
}

while (($VFS<=$VFSEnd)); do
	sleep 1
	test_eight 8
	
	# Dodawanie wartości VFS
	VFS=$(($VFSstep + $VFS))

	
done
