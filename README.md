# Apktool-X

`This doesn't work with android 12 apks.`

If you don't know already, Apktool apk doesn't work on android Q. We've come up with a simple workaround for that. The steps are pretty simple and self-explanatory.

## The requirements:-
- Android Q running device with root access
- Termux

## Setting up the environment
First of all launch termux and run this command:
```
apt update && apt install wget -y
```

##  Installation
After above steps are completed successfully, run this command which will trigger the installation process itself. Grant root access in the prompt.
```
wget https://raw.githubusercontent.com/soulr344/apktool_android/8.7.7/install.sh && bash install.sh
```

After completion, you should have Apktool installed and visible on the app drawer. Open apktool and go to it's settings. Check the "Root" option on the bottom so `root access id used`. Then check the top checkbox, `"Add apktool and option flags"`, Upon enabling it, the options below it should be enabled. Choose the apktool version you want `(upon changing the value the name should change as well. If 2.4.2 is selected, apktool-2.4.2.jar is shown)`. Then tap on "Install OpenJDK", install it, and run it. For "Compilation" and "Decompilation" flags, i like to check `--use-aapt2` and `--keep-broken-res`. Then you can start compiling and decompiling APKs on the go!
Follow for updates.

## Credits:
- To the original owner and my friends
- [SypeR54](https://github.com/SypeR54)
- [Voytec83](https://github.com/Voytec83)
- [AzSuperBored](https://github.com/AzSuperBored)
