tencentmeeting)
    name="TencentMeeting"
    type="dmg"
    if [[ $(arch) == "arm64" ]]; then
        downloadURL="$(curl -fs 'https://meeting.tencent.com/web-service/query-download-info?q=%5B%7B%22package-type%22%3A%22app%22%2C%22channel%22%3A%220300000000%22%2C%22platform%22%3A%22mac%22%2C%22arch%22%3A%22arm64%22%7D%5D&c_os=web&c_os_version=1&c_os_model=web&c_timestamp=1653366550252&c_instance_id=5&c_nonce=DcaDam4y&c_app_id=1400143280&c_app_version=1&c_lang=zh-cn&c_district=0&nonce=miwSceJNQaSZttma' -H 'authority: meeting.tencent.com' -H 'referer: https://meeting.tencent.com/download-mac.html?from=1000&fromSource=1&macType=apple' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15' | grep -o "https://updatecdn.meeting.qq.com[^']*\.publish.arm64.dmg")"
        appNewVersion=$(curl -fs 'https://meeting.tencent.com/web-service/query-download-info?q=%5B%7B%22package-type%22%3A%22app%22%2C%22channel%22%3A%220300000000%22%2C%22platform%22%3A%22mac%22%2C%22arch%22%3A%22arm64%22%7D%5D&c_os=web&c_os_version=1&c_os_model=web&c_timestamp=1653366550252&c_instance_id=5&c_nonce=DcaDam4y&c_app_id=1400143280&c_app_version=1&c_lang=zh-cn&c_district=0&nonce=miwSceJNQaSZttma' -H 'authority: meeting.tencent.com' -H 'referer: https://meeting.tencent.com/download-mac.html?from=1000&fromSource=1&macType=apple' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15' | grep -o "https://updatecdn.meeting.qq.com[^']*\.publish.arm64.dmg" | sed -e 's/.*TencentMeeting\_0300000000\_\(.*\)\.publish\.arm64\.dmg.*/\1/')
    elif [[ $(arch) == "i386" ]]; then
        downloadURL="$(curl -fs 'https://meeting.tencent.com/web-service/query-download-info?q=%5B%7B%22package-type%22%3A%22app%22%2C%22channel%22%3A%220300000000%22%2C%22platform%22%3A%22mac%22%2C%22arch%22%3A%22x86_64%22%7D%5D&c_os=web&c_os_version=1&c_os_model=web&c_timestamp=1653366500890&c_instance_id=5&c_nonce=jA4P4JPY&c_app_id=1400143280&c_app_version=1&c_lang=zh-cn&c_district=0&nonce=tF6Bm4FYHJwdPeGH' -H 'authority: meeting.tencent.com' -H 'referer: https://meeting.tencent.com/download-mac.html?from=1000&fromSource=1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15' | grep -o "https://updatecdn.meeting.qq.com[^']*\.publish.x86_64.dmg")"
        appNewVersion=$(curl -fs 'https://meeting.tencent.com/web-service/query-download-info?q=%5B%7B%22package-type%22%3A%22app%22%2C%22channel%22%3A%220300000000%22%2C%22platform%22%3A%22mac%22%2C%22arch%22%3A%22x86_64%22%7D%5D&c_os=web&c_os_version=1&c_os_model=web&c_timestamp=1653366500890&c_instance_id=5&c_nonce=jA4P4JPY&c_app_id=1400143280&c_app_version=1&c_lang=zh-cn&c_district=0&nonce=tF6Bm4FYHJwdPeGH' -H 'authority: meeting.tencent.com' -H 'referer: https://meeting.tencent.com/download-mac.html?from=1000&fromSource=1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15' | grep -o "https://updatecdn.meeting.qq.com[^']*\.publish.x86_64.dmg" | sed -e 's/.*TencentMeeting\_0300000000\_\(.*\)\.publish\.x86_64\.dmg.*/\1/')
    fi
    curlOptions=( -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15" )
    appCustomVersion() { echo "$(defaults read /Applications/TencentMeeting.app/Contents/Info.plist CFBundleShortVersionString)$(echo ".")$(defaults read /Applications/TencentMeeting.app/Contents/Info.plist CFBundleVersion)" }
    expectedTeamID="88L2Q4487U"
    ;;
