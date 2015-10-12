PRODUCT_NAME=hockey
NOTIFY="True"
NOTES="Build uploaded via the upload API"

echo "Downloading File..."
echo "Archives: ${CIRCLE_ARTIFACTS}"
https://circle-artifacts.com/gh/androidautomationdev/calculator-cd-android/${CIRCLE_BUILD_NUM}/artifacts/0/home/ubuntu/calculator-cd-android/app/build/outputs/apk/app-debug.apk


if [ "$1" ]
then
  NOTES="$1"
fi

if [ ! -f "app/build/outputs/apk/app-debug.apk" ]
then
  echo "app/build/outputs/apk/app-debug.apk not found!"
else
  echo "Uploading to HockeyApp..."
  /usr/bin/curl "https://rink.hockeyapp.net/api/2/apps/upload" \
       -F ipa=@"app/build/outputs/apk/app-debug.apk" \
      -F "status=2" \
       -F "notify=1" \
       -F "notes=Some new features and fixed bugs." \
       -F "notes_type=0" \
       -H "X-HockeyAppToken: ${HOCKEYAPP_TOKEN}" \
fi