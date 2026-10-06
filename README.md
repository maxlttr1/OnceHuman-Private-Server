# OnceHuman-Private-Server
1. Copy the example configuration:
```bash
cp OnceHuman/Saved/Config/LinuxServer/GameUserSettings.example.ini \
    OnceHuman/Saved/Config/LinuxServer/GameUserSettings.ini
```

2. Edit the configuration:
```bash
nano OnceHuman/Saved/Config/LinuxServer/GameUserSettings.ini
```
Set your server and admin passwords:
```bash
ServerPassword=yourpassword_here
AdminPassword=youradminpassword_here
```
*The GameUserSettings.example.ini file can be committed because it contains no real passwords. The real GameUserSettings.ini stays only on your server.* 

3. Start the container: 
```bash
bash start.sh
```