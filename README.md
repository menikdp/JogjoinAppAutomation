# JogjoinAppAutomation

This project created using Appium and Ruby to automate Jogjoin. First, you need to install all tools needed. After that you must setting up your laptop's environment


## Tools
To run this project, you will needs:
1. Visual Code (or your favourite editor)
2. Ruby 2.5.3 
3. Cucumber 
4. Gherkin
5. Android SDK
6. JDK
7. Appium
8. Node.js


## Environtment
Open your ./bashrc file, then add this line into it. (Your path maybe different)

`export JAVA_HOME=/usr/lib/jvm/java-8
export ANDROID_HOME=/home/asus/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/platform-tools 
export PATH=$PATH:/usr/lib/jvm/java-8/bin`


## Run
1. Open terminal/cmd, type `appium` to start appium server
2. Open another tab on terminal, point to this project, then type `cucumber` to run all scenario in all feature files
